import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruang_phur/constant/colors.dart';
import 'package:ruang_phur/constant/label_style.dart';
import 'package:ruang_phur/constant/sized_box.dart';
import 'package:ruang_phur/controllers/submit_form_controller.dart';

previewFirstStep(BuildContext context, SubmitFormController controller) {
  return showBottomSheet(
      enableDrag: true,
      showDragHandle: true,
      context: context,
      builder: (_) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: Text('Mitthi Chungchang')),
                sizedBoxHeight(20),
                const Center(
                  child: Image(
                    height: 80,
                    image: AssetImage('images/mitthi_chungchang.png'),
                  ),
                ),
                Center(child: Text(controller.mitthi_hming.text)),
                Center(
                    child: Text(
                        '${controller.relationshipType.value} ${controller.chhungte_hming.text}')),
                const Divider(
                  indent: 20,
                ),
                sizedBoxHeight(10),
                Text(
                  'Mitthi pianni leh thla',
                  style: labelStyle(),
                ),
                Text(
                  controller.dob.text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizedBoxHeight(10),
                Text(
                  'Kum',
                  style: labelStyle(),
                ),
                Text(
                  controller.dob.text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizedBoxHeight(10),
                Text(
                  'Gender',
                  style: labelStyle(),
                ),
                Text(
                  controller.gender.value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizedBoxHeight(10),
                Text(
                  'Thih ni leh darkar',
                  style: labelStyle(),
                ),
                Text(
                  controller.deathDateTime.text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizedBoxHeight(10),
                Text(
                  'Thihna hmun',
                  style: labelStyle(),
                ),
                Text(
                  controller.placeOfDeath.text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizedBoxHeight(10),
                Text(
                  'District',
                  style: labelStyle(),
                ),
                Text(
                  controller.districtText.value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizedBoxHeight(10),
                Text(
                  'Veng/Khua',
                  style: labelStyle(),
                ),
                Text(
                  controller.vengKhua.text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizedBoxHeight(10),
                Text(
                  'Assembly Constituency',
                  style: labelStyle(),
                ),
                Text(
                  controller.constituencyText.value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
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
                        controller.activeStep.value = 1;
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
