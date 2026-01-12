import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruang_phur/constant/colors.dart';
import 'package:ruang_phur/constant/my_appbar.dart';
import 'package:ruang_phur/constant/sized_box.dart';
import 'package:ruang_phur/controllers/submit_form_controller.dart';
import 'package:ruang_phur/widgets/stepper/first_step_widget.dart';
import 'package:ruang_phur/widgets/stepper/second_step_widget.dart';
import 'package:ruang_phur/widgets/stepper/third_step_widget.dart';
import 'package:ruang_phur/widgets/stepper_widget.dart';

class SubmitFormScreen extends StatelessWidget {
  const SubmitFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubmitFormController>(
      init: SubmitFormController(),
      builder: (controller) {
        return Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: myAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: MyColors.stepperBackgroundColor,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Text(
                      //   'Ruang Phur Report Form',
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // sizedBoxHeight(10),
                      const StepperWidget(),
                    ],
                  ),
                ),
                Obx(
                  () => controller.activeStep.value == 0
                      ? const FirstStepWidget()
                      : controller.activeStep.value == 1
                      ? const SecondStepWidget()
                      : controller.activeStep.value == 2
                      ? const ThirdStepWidget()
                      : Container(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
