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
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxHeight(10),
                const Center(
                    child: Text(
                  'Ruang phurh leh Motor chungchang',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )),
                sizedBoxHeight(20),
                const Text('Ruang phurh tanna'),
                Container(
                  height: 5,
                  width: 20,
                  color: Colors.black,
                ),
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
                      const Text('Ruang chhuana hmun'),
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
                Container(
                  height: 5,
                  width: 20,
                  color: Colors.black,
                ),
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
                      const Text('Ruang dahna hmun'),
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
                sizedBoxHeight(10),
                const Divider(),
                Obx(() {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              controller.kilometer.value,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const Text('Kilometer'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Rs ${controller.motorHmanMan.value}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const Text('Motor hman man'),
                          ],
                        )
                      ],
                    ),
                  );
                }),
                const Divider(),
                const Text('Ruang phurhna motor'),
                Container(
                  height: 5,
                  width: 20,
                  color: Colors.black,
                ),
                sizedBoxHeight(10),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Motor registration number'),
                      Text(
                        controller.motorRegistrationNo.text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      sizedBoxHeight(10),
                      const Text('Motor neitu/khalhtu hming'),
                      Text(
                        controller.motorNeitu.text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      sizedBoxHeight(10),
                      const Text('Motor neitu/khalhtu phone number'),
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
                )
              ],
            ),
          ),
        );
      });
}
