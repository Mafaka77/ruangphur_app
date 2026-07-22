import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruang_phur/constant/label_style.dart';
import 'package:ruang_phur/constant/sized_box.dart';
import 'package:ruang_phur/controllers/submit_form_controller.dart';

secondStepPreview(BuildContext context, SubmitFormController controller) {
  return showBottomSheet(
    enableDrag: true,
    showDragHandle: true,
    context: context,
    builder: (_) {
      return SingleChildScrollView(
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxHeight(10),
              const Center(
                child: Text(
                  'Ruang phurh leh Motor chungchang',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              sizedBoxHeight(20),
              Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Ruang phurh tanna'),
                  Container(height: 5, width: 20, color: Colors.black),
                  sizedBoxHeight(10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('District'),
                        Text(
                          controller.sourceDistrictText.value,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        sizedBoxHeight(10),
                        Text(controller.transportMode.value == 'road' ? 'Ruang chhuahna veng/khua thlanna (Map)' : 'Ruang chhuahna Veng/Khua'),
                        Text(
                          controller.startingAddress.text,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBoxHeight(10),
                  const Divider(),
                  sizedBoxHeight(10),
                  const Text('Ruang dahna hmun tur'),
                  Container(height: 5, width: 20, color: Colors.black),
                  sizedBoxHeight(10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('District'),
                        Text(
                          controller.destinationDistrictText.value,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        sizedBoxHeight(10),
                        Text(controller.transportMode.value == 'road' ? 'Ruang dahna veng/khua thlanna (Map)' : 'Ruang dahna Veng/Khua'),
                        Text(
                          controller.destinationAddress.text,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              sizedBoxHeight(10),
              const Divider(),
              Obx(() {
                final isRoad = controller.transportMode.value == 'road';
                final costVal = double.tryParse(controller.motorHmanMan.value) ?? 0.0;
                final waitChargeVal = controller.waitingCharge.value.toDouble();
                final totalEstimated = costVal + (isRoad ? 0.0 : waitChargeVal);
                
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (isRoad)
                            Column(
                              children: [
                                Text(
                                  controller.kilometer.value,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text('Kilometer'),
                              ],
                            )
                          else
                            Column(
                              children: [
                                Text(
                                  controller.startingAddress.text.isNotEmpty && controller.destinationAddress.text.isNotEmpty
                                      ? '${controller.startingAddress.text} to ${controller.destinationAddress.text}'
                                      : 'Pending Selection',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text('Boat Route'),
                              ],
                            ),
                          Column(
                            children: [
                              Text(
                                'Rs ${controller.motorHmanMan.value}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(isRoad ? 'Motor hman man' : 'Boat transport cost'),
                            ],
                          ),
                        ],
                      ),
                      if (!isRoad && controller.waitingCharge.value > 0) ...[
                        sizedBoxHeight(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '${controller.waitingHours.text} hrs',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text('Waiting Time'),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Rs ${controller.waitingCharge.value}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text('Waiting Charge'),
                              ],
                            ),
                          ],
                        ),
                      ],
                      sizedBoxHeight(10),
                      const Divider(),
                      sizedBoxHeight(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Rs ${totalEstimated.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              const Text('Total Estimated Cost', style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
              const Divider(),
              Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.transportMode.value == 'road' ? 'Ruang phurhna motor' : 'Ruang phurhna lawng',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(height: 5, width: 20, color: Colors.black),
                  sizedBoxHeight(10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.transportMode.value == 'road' ? 'Motor registration number' : 'Lawng hming/number',
                        ),
                        Text(
                          controller.motorRegistrationNo.text,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        sizedBoxHeight(10),
                        Text(
                          controller.transportMode.value == 'road' ? 'Motor neitu/khalhtu hming' : 'Lawng khalhtu hming',
                        ),
                        Text(
                          controller.motorNeitu.text,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        sizedBoxHeight(10),
                        Text(
                          controller.transportMode.value == 'road' ? 'Motor neitu/khalhtu phone number' : 'Lawng khalhtu phone number',
                        ),
                        Text(
                          controller.motorNeituPhone.text,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              sizedBoxHeight(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    elevation: 0,
                    minWidth: Get.width * 0.4,
                    height: Get.height * 0.06,
                    shape: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Edit'),
                  ),
                  MaterialButton(
                    elevation: 0,
                    minWidth: Get.width * 0.4,
                    height: Get.height * 0.06,
                    color: Colors.black,
                    onPressed: () {
                      // previewFirstStep(context, controller);
                      controller.activeStep.value = 2;
                      Get.back();
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              sizedBoxHeight(30),
            ],
          ),
        ),
      );
    },
  );
}
