import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruang_phur/controllers/submit_form_controller.dart';

class StepperWidget extends GetView<SubmitFormController> {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.activeStep.value == 0
            ? const Image(
                image: AssetImage('images/step_1.png'),
              )
            : controller.activeStep.value == 1
                ? const Image(
                    image: AssetImage('images/step_2.png'),
                  )
                : controller.activeStep.value == 2
                    ? const Image(
                        image: AssetImage('images/step_3.png'),
                      )
                    : Container()
        // EasyStepper(
        //   activeStep: controller.activeStep.value,
        //   stepShape: StepShape.rRectangle,
        //   stepBorderRadius: 80,
        //   borderThickness: 4,
        //   padding: const EdgeInsets.all(0),
        //   stepRadius: 28,
        //   finishedStepBorderColor: Colors.deepOrange,
        //   finishedStepTextColor: Colors.deepOrange,
        //   finishedStepBackgroundColor: Colors.green,
        //   activeStepIconColor: Colors.green,
        //   showLoadingAnimation: false,
        //   activeStepBorderColor: Colors.green,
        //   showStepBorder: true,
        //   steps: [
        //     EasyStep(
        //       customStep: ClipRRect(
        //         borderRadius: BorderRadius.circular(50),
        //         child: Opacity(
        //           opacity: controller.activeStep.value >= 0 ? 1 : 0.3,
        //           child: const Text('1'),
        //         ),
        //       ),
        //       customTitle: const Text(
        //         'Mitthi Chungchang',
        //         textAlign: TextAlign.center,
        //       ),
        //     ),
        //     EasyStep(
        //       customStep: ClipRRect(
        //         borderRadius: BorderRadius.circular(15),
        //         child: Opacity(
        //           opacity: controller.activeStep.value >= 1 ? 1 : 0.3,
        //           child: const Text('2'),
        //         ),
        //       ),
        //       customTitle: const Text(
        //         'Ruang phur leh Motor',
        //         textAlign: TextAlign.center,
        //       ),
        //     ),
        //     EasyStep(
        //       customStep: ClipRRect(
        //         borderRadius: BorderRadius.circular(15),
        //         child: Opacity(
        //           opacity: controller.activeStep.value >= 2 ? 1 : 0.3,
        //           child: const Text('3'),
        //         ),
        //       ),
        //       customTitle: const Text(
        //         'Ruang phur diltu leh a man',
        //         textAlign: TextAlign.center,
        //       ),
        //     ),
        //   ],
        //   // onStepReached: (index) => setState(() => controller.activeStep.value = index),
        // ),
        );
  }
}
