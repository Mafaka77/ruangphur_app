import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruang_phur/constant/my_snackbar.dart';
import 'package:ruang_phur/constant/reusable.dart';
import 'package:ruang_phur/constant/sized_box.dart';
import 'package:ruang_phur/controllers/submit_form_controller.dart';

thirdStepPreview(BuildContext context, SubmitFormController controller) {
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
                  'Ruang Phurh Diltu leh a man Chungchang',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )),
                sizedBoxHeight(20),
                const Text('Diltu'),
                Container(
                  height: 5,
                  width: 20,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Hming'),
                      Text(
                        controller.diltuHming.text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizedBoxHeight(10),
                      const Text('District'),
                      Text(
                        controller.diltuDistrictText.value,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizedBoxHeight(10),
                      const Text('Veng/Khua'),
                      Text(
                        controller.diltuVeng.text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizedBoxHeight(10),
                      const Text('Phone Number'),
                      Text(
                        controller.diltuPhoneNo.text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizedBoxHeight(10),
                    ],
                  ),
                ),
                sizedBoxHeight(10),
                const Divider(),
                sizedBoxHeight(10),
                const Text('Bank Details'),
                Container(
                  height: 5,
                  width: 20,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Bank Hming'),
                      Text(
                        controller.diltuBank.text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizedBoxHeight(10),
                      const Text('Bank Account Number'),
                      Text(
                        controller.diltuAccNo.text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizedBoxHeight(10),
                      const Text('IFSC Code'),
                      Text(
                        controller.diltuIFSC.text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizedBoxHeight(10),
                    ],
                  ),
                ),
                const Divider(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Document thil tel te'),
                    Text('5/5'),
                  ],
                ),
                Container(
                  height: 5,
                  width: 20,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(size: 20, Icons.check_circle_sharp),
                          sizedBoxWidth(5),
                          const Text(
                              'Mitthi Aadhaar/Voter ID/Birth Certificate'),
                        ],
                      ),
                      sizedBoxHeight(10),
                      const Row(
                        children: [
                          Icon(size: 20, Icons.check_circle_sharp),
                          Text('Motor hman man Voucher/Receipt'),
                        ],
                      ),
                      sizedBoxHeight(10),
                      const Row(
                        children: [
                          Icon(size: 20, Icons.check_circle_sharp),
                          Text('Death Certificate'),
                        ],
                      ),
                      sizedBoxHeight(10),
                      const Row(
                        children: [
                          Icon(size: 20, Icons.check_circle_sharp),
                          Text('Diltu Aadhaar/Voter ID'),
                        ],
                      )
                    ],
                  ),
                ),
                sizedBoxHeight(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.declarationCheckBox.value,
                          onChanged: (value) {
                            controller.declarationCheckBox.value =
                                value ?? false;
                          }),
                    ),
                    const Flexible(
                      child: Text(
                          'Kei Zorampianga Fanai hian heng dilna leh document upload-te hi thu diktak a ni tih ka nemnghet e, engmah thil dik lo a awm lo e.'),
                    )
                  ],
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
                        if (controller.declarationCheckBox.value == false) {
                          mySnackBar('Please check declaration',
                              const Icon(Icons.warning));
                        } else {
                          controller.sendOtp(() {
                            showLoader(context);
                          }, (String message) {
                            hideLoader();
                            mySnackBar(message, const Icon(Icons.check));
                            Get.toNamed('/otp-screen');
                          }, (String message) {
                            hideLoader();
                            mySnackBar(message, const Icon(Icons.warning));
                          });

                          // controller.sendOtp(() {
                          //   showLoader(context);
                          // }, () {
                          //   hideLoader();

                          // }, () {
                          //   hideLoader();
                          // });
                        }

                        // Get.back();
                      },
                      child: const Text(
                        'Send OTP & Submit',
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
