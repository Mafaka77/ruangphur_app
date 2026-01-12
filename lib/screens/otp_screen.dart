import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:ruang_phur/constant/my_appbar.dart';
import 'package:ruang_phur/constant/my_snackbar.dart';
import 'package:ruang_phur/constant/reusable.dart';
import 'package:ruang_phur/constant/sized_box.dart';
import 'package:ruang_phur/controllers/otp_timer_controller.dart';
import 'package:ruang_phur/controllers/submit_form_controller.dart';

class OtpScreen extends GetView<SubmitFormController> {
  OtpScreen({super.key});
  @override
  final OTPTimerController otpTimerController = Get.put(OTPTimerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxHeight(50),
              const Text(
                'Enter OTP to verify',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              sizedBoxHeight(20),
              Text('An OTP has been sent to ${controller.diltuPhoneNo.text}'),
              sizedBoxHeight(30),
              Center(
                child: Pinput(
                  length: 4,
                  showCursor: true,
                  onCompleted: (otp) {
                    controller.verifyOtp(() {
                      showLoader(context);
                    }, (String message) {
                      hideLoader();
                      mySnackBar(message, const Icon(Icons.check));
                      controller.submitForm(() {
                        showLoader(context);
                      }, (String message, String? applicationNo) {
                        hideLoader();
                        Get.offAllNamed(
                          '/success-screen',
                          arguments: [
                            applicationNo,
                          ],
                        );
                      }, (String message) {
                        hideLoader();
                        mySnackBar(message, const Icon(Icons.warning));
                      });
                    }, (String message) {
                      hideLoader();
                      mySnackBar(message, const Icon(Icons.warning));
                    }, otp);
                  },
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              sizedBoxHeight(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Didn't receive code?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          otpTimerController.timeLeft.value == 0
                              ? otpTimerController.resetTimer
                              : null;
                        },
                        child: const Text('Resend'),
                      ),
                    ],
                  ),
                  Obx(() => Text(
                        "${otpTimerController.timeLeft.value ~/ 60}:${(otpTimerController.timeLeft.value % 60).toString().padLeft(2, '0')}",
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
