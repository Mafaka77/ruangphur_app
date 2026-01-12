import 'dart:async';
import 'package:get/get.dart';

class OTPTimerController extends GetxController {
  var timeLeft = 300.obs; // 5 minutes (300 seconds)
  Timer? _timer;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    timeLeft.value = 300; // Reset to 5 minutes

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.value > 0) {
        timeLeft.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
