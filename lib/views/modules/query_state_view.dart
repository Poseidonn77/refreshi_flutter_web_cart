import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart';

import '../../controller/base_query_controller.dart';

/// Renders loading / error / empty states for a [BaseQueryController],
/// and delegates to [builder] once data is available.
class QueryStateView<T> extends StatelessWidget {
  const QueryStateView({
    super.key,
    required this.controller,
    required this.builder,
    this.onRetry,
  });

  final BaseQueryController<T> controller;
  final Widget Function(T data) builder;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      final error = controller.error.value;
      if (error != null) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(error, textAlign: TextAlign.center),
              if (onRetry != null)
                TextButton(onPressed: onRetry, child: const Text('Retry')),
            ],
          ),
        );
      }
      final data = controller.data.value;
      if (data == null) return const Center(child: Text('Nothing found'));
      return builder(data);
    });
  }
}
