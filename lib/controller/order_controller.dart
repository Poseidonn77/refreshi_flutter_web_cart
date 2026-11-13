import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../database/queries/fetch_order.graphql.dart';
import '../models/delivery_slot.dart';
import '../models/order_status.dart';
import '../services/storage_service.dart';
import 'base_query_controller.dart';
import 'status_refresh.dart';

enum PaymentStatus { unpaid, onHold, paid }

/// `/order/:id`. Refreshes itself whenever the order's status is due to
/// change: payment captured (~5 s after placing), slot start, slot end.
class OrderController extends BaseQueryController<Query$FetchOrder$fetchOrder>
    with StatusRefresh {
  OrderController({super.client, DateTime Function()? clock})
    : _clock = clock ?? DateTime.now;

  final DateTime Function() _clock;

  @override
  void onInit() {
    super.onInit();
    if (routeId.isNotEmpty) fetchOrder(routeId);
  }

  /// Loads the order from the server (never the cache, so status is fresh).
  /// [silent] keeps the current order on screen while refreshing.
  Future<void> fetchOrder(String id, {bool silent = false}) async {
    await run(
      () => client.query$FetchOrder(
        Options$Query$FetchOrder(
          variables: Variables$Query$FetchOrder(id: id),
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      ),
      (parsed) => parsed.fetchOrder,
      silent: silent,
    );
    final order = data.value;
    scheduleRefresh(
      order == null
          ? null
          : nextStatusChange(
              status: order.status,
              now: _clock(),
              holdRequestTime: order.pay?.holdRequestTime,
              slotStart: order.timeSlotStart,
              slotEnd: order.timeSlotEnd,
            ),
      () => fetchOrder(id, silent: true),
      clock: _clock,
    );
  }

  PaymentStatus get paymentStatus {
    final pay = data.value?.pay;
    if (pay?.payCaptureTime != null) return PaymentStatus.paid;
    if (pay?.holdRequestTime != null) return PaymentStatus.onHold;
    return PaymentStatus.unpaid;
  }

  /// The slot sent with the order; falls back to one stored locally by older
  /// builds of the app.
  DeliverySlot? slotFor(Query$FetchOrder$fetchOrder order) {
    final start = order.timeSlotStart;
    final end = order.timeSlotEnd;
    if (start != null && end != null) {
      return DeliverySlot(start: start, end: end);
    }
    return Get.isRegistered<StorageService>()
        ? Get.find<StorageService>().orderSlot(order.id)
        : null;
  }
}
