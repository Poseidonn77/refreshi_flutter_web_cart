import 'dart:async';

import 'package:get/get.dart';

import '../app/app_routes.dart';
import '../services/storage_service.dart';

/// Sign-in is a timed placeholder: after [redirectDelay] the user is marked
/// as signed in (Hive) and redirected to `?next=` or the merchants list.
class SignInController extends GetxController {
  SignInController({this.redirectDelay = const Duration(seconds: 3)});

  final Duration redirectDelay;
  final RxInt secondsLeft = 0.obs;

  Timer? _redirectTimer;
  Timer? _ticker;

  String get nextRoute => Get.parameters['next'] ?? Routes.geoMerchants;

  @override
  void onReady() {
    super.onReady();
    scheduleRedirect();
  }

  /// TODO: replace with the real scheduler / auth call.
  void scheduleRedirect() {
    cancelRedirect();
    secondsLeft.value = redirectDelay.inSeconds;
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsLeft.value > 0) secondsLeft.value--;
    });
    _redirectTimer = Timer(redirectDelay, _completeSignIn);
  }

  void cancelRedirect() {
    _redirectTimer?.cancel();
    _ticker?.cancel();
  }

  Future<void> _completeSignIn() async {
    _ticker?.cancel();
    if (Get.isRegistered<StorageService>()) {
      await Get.find<StorageService>().setSignedIn(true);
    }
    Get.offAllNamed(nextRoute);
  }

  @override
  void onClose() {
    cancelRedirect();
    super.onClose();
  }
}
