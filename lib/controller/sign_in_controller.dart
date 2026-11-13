import 'dart:async';

import 'package:get/get.dart';

import '../app/nav.dart';
import '../services/storage_service.dart';

/// Demo sign-in: a boolean and a timer. Opening the page waits [delay],
/// flips [isSignedIn] to true, then continues to `?next=` (set by AuthGuard)
/// or returns to the page that opened it (e.g. checkout).
/// Persisted in Hive (see [restore]), so a reload keeps you signed in.
/// Signing in is required to place an order and to see orders.
class SignInController extends GetxController {
  SignInController({this.delay = const Duration(seconds: 3)});

  /// The demo's whole auth state.
  static final RxBool isSignedIn = false.obs;

  /// Loads the saved sign-in state from [storage] and saves every change
  /// back to it. Called once at startup, before the first route resolves.
  static void restore(StorageService storage) {
    isSignedIn.value = storage.signedIn;
    ever<bool>(isSignedIn, storage.setSignedIn);
  }

  final Duration delay;
  Timer? _timer;

  /// Captured when the route opens (Get.parameters is global).
  final String? next = Get.parameters['next'];

  @override
  void onReady() {
    super.onReady();
    _timer = Timer(delay, () {
      isSignedIn.value = true;
      final next = this.next;
      final nav = Get.key.currentState;
      if (next != null && next.isNotEmpty) {
        Get.offNamed<void>(next); // replaces sign-in, so back skips it
      } else if (nav != null && nav.canPop()) {
        Get.back<void>();
      } else {
        Nav.home();
      }
    });
  }

  /// Signs out and goes home (orders are no longer visible).
  static void signOut() {
    isSignedIn.value = false;
    Nav.home();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
