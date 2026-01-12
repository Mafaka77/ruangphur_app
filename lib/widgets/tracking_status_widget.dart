import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ruang_phur/constant/sized_box.dart';
import 'package:ruang_phur/controllers/tracking_controller.dart';

class TrackingStatusWidget extends GetView<TrackingController> {
  const TrackingStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Wrap(
              children: [
                const Text('Status: '),
                Text(
                  controller.trackingData['status'] == 'Pending'
                      ? 'Form Submitted'
                      : controller.trackingData['status'] == 'Processing'
                          ? 'Bill in Process'
                          : controller.trackingData['status'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          sizedBoxHeight(5),
          Obx(
            () => Wrap(
              children: [
                const Text('Applied Date: '),
                Text(
                  DateFormat('yyyy-MM-dd').format(
                    DateTime.parse(controller.trackingData[
                        'createdAt']), // Convert String to DateTime
                  ),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          sizedBoxHeight(5),
          Obx(
            () => Wrap(
              children: [
                const Text('Dilna ID: '),
                Text(
                  controller.trackingData['application_no'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          sizedBoxHeight(20),
          const Text(
            'Current Status',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Obx(
            () => controller.trackingData['status'] == 'Rejected'
                ? Text('Application Rejected')
                : Stepper(
                    physics: const NeverScrollableScrollPhysics(),
                    currentStep: controller.currentStep.value,
                    controlsBuilder: (context, details) {
                      return Container();
                    },
                    stepIconBuilder: (stepIndex, stepState) {
                      return Image(
                        image: stepState == StepState.complete
                            ? const AssetImage('images/active_step.png')
                            : const AssetImage('images/inactive_step.png'),
                        color: stepState == StepState.complete
                            ? Colors.green
                            : Colors.white,
                      );
                    },
                    steps: [
                      Step(
                        stepStyle: const StepStyle(
                          indexStyle: TextStyle(fontSize: 0),
                          color: Colors.white,
                        ),
                        title: const Text("Form Submitted"),
                        content: Container(),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "I ruang phurh dilna chu thehluh fel a ni tawh e, District lama thuneitu ten verify turin a thang mek",
                            ),
                            Wrap(
                              children: [
                                Text(
                                  DateFormat('yyyy-MM-dd').format(
                                    DateTime.parse(
                                      controller.trackingData['createdAt'],
                                    ), // Convert String to DateTime
                                  ),
                                  style: const TextStyle(color: Colors.green),
                                ),
                                const Text('   |   '),
                                Text(
                                  DateFormat('hh:mm a').format(
                                    DateTime.parse(
                                      controller.trackingData['createdAt'],
                                    ), // Convert String to DateTime
                                  ),
                                  style: const TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ],
                        ),
                        isActive: controller.currentStep.value == 0,
                        state: controller.currentStep.value >= 0
                            ? StepState.complete
                            : StepState.indexed,
                      ),
                      Step(
                        title: const Text("Verified"),
                        stepStyle: const StepStyle(
                          indexStyle: TextStyle(fontSize: 0),
                          color: Colors.white,
                        ),
                        content: Container(),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                "District thuneitu te atangin verify a ni a, Directorate lamah thawn a ni."),
                            controller.trackingData['verified_at'] == null
                                ? Container()
                                : Wrap(
                                    children: [
                                      Text(
                                        DateFormat('yyyy-MM-dd').format(
                                          DateTime.parse(
                                            controller
                                                .trackingData['verified_at'],
                                          ), // Convert String to DateTime
                                        ),
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                      const Text('   |   '),
                                      Text(
                                        DateFormat('hh:mm a').format(
                                          DateTime.parse(
                                            controller
                                                .trackingData['verified_at'],
                                          ), // Convert String to DateTime
                                        ),
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                        isActive: controller.currentStep.value == 1,
                        state: controller.currentStep.value >= 1
                            ? StepState.complete
                            : StepState.indexed,
                      ),
                      Step(
                        title: const Text("Application under process"),
                        stepStyle: const StepStyle(
                          indexStyle: TextStyle(fontSize: 0),
                          color: Colors.white,
                        ),
                        content: Container(),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                "Directorate kutah a awm mek a, bank lama deposit turin file tih kal a ni."),
                            controller.trackingData['approved_at'] == null
                                ? Container()
                                : Wrap(
                                    children: [
                                      Text(
                                        DateFormat('yyyy-MM-dd').format(
                                          DateTime.parse(
                                            controller
                                                .trackingData['approved_at'],
                                          ), // Convert String to DateTime
                                        ),
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                      const Text('   |   '),
                                      Text(
                                        DateFormat('hh:mm a').format(
                                          DateTime.parse(
                                            controller
                                                .trackingData['approved_at'],
                                          ), // Convert String to DateTime
                                        ),
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                        isActive: controller.currentStep.value == 2,
                        state: controller.currentStep.value >= 2
                            ? StepState.complete
                            : StepState.indexed,
                      ),
                      Step(
                        title: const Text("Bill in Process"),
                        stepStyle: const StepStyle(
                          indexStyle: TextStyle(fontSize: 0),
                          color: Colors.white,
                        ),
                        content: Container(),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                "I ruang phurh dilna chu bank lamah process mek a ni."),
                            controller.trackingData['processed_at'] == null
                                ? Container()
                                : Wrap(
                                    children: [
                                      Text(
                                        DateFormat('yyyy-MM-dd').format(
                                          DateTime.parse(
                                            controller
                                                .trackingData['processed_at'],
                                          ), // Convert String to DateTime
                                        ),
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                      const Text('   |   '),
                                      Text(
                                        DateFormat('hh:mm a').format(
                                          DateTime.parse(
                                            controller
                                                .trackingData['processed_at'],
                                          ), // Convert String to DateTime
                                        ),
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                        isActive: controller.currentStep.value == 3,
                        state: controller.currentStep.value >= 3
                            ? StepState.complete
                            : StepState.indexed,
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
