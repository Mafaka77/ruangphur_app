import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:ruang_phur/constant/my_appbar.dart';
import 'package:ruang_phur/constant/my_snackbar.dart';
import 'package:ruang_phur/constant/reusable.dart';
import 'package:ruang_phur/constant/sized_box.dart';
import 'package:ruang_phur/controllers/otp_timer_controller.dart';
import 'package:ruang_phur/controllers/submit_form_controller.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final SubmitFormController controller = Get.find<SubmitFormController>();
  late final OTPTimerController otpTimerController;
  late final TextEditingController pinController;
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    otpTimerController = Get.put(OTPTimerController());
    pinController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

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
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              sizedBoxHeight(20),
              Text('An OTP has been sent to ${controller.diltuPhoneNo.text}'),
              sizedBoxHeight(30),
              Center(
                child: Pinput(
                  length: 4,
                  showCursor: true,
                  controller: pinController,
                  focusNode: focusNode,
                  onCompleted: (otp) async {
                    var response = await controller.verifyOtp(otp);
                    showLoader(context);
                    if (response['success']) {
                      mySnackBar(response['message'], const Icon(Icons.check));
                      var res = await controller.submitForm();
                      if (res['success']) {
                        hideLoader();
                        mySnackBar(res['message'], const Icon(Icons.check));
                        Get.offAllNamed(
                          '/success-screen',
                          arguments: [res['applicationNo']],
                        );
                      } else {
                        hideLoader();
                        mySnackBar(res['message'], const Icon(Icons.warning));
                      }
                    } else {
                      hideLoader();
                      mySnackBar(response['message'], const Icon(Icons.warning));
                    }
                  },
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
                          if (otpTimerController.timeLeft.value == 0) {
                            otpTimerController.resetTimer();
                          }
                        },
                        child: const Text('Resend'),
                      ),
                    ],
                  ),
                  Obx(
                    () => Text(
                      "${otpTimerController.timeLeft.value ~/ 60}:${(otpTimerController.timeLeft.value % 60).toString().padLeft(2, '0')}",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
