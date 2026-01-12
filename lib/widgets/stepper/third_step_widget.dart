import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruang_phur/constant/my_snackbar.dart';
import 'package:ruang_phur/constant/sized_box.dart';
import 'package:ruang_phur/constant/text_field_decoration.dart';
import 'package:ruang_phur/constant/upload_death_certificate.dart';
import 'package:ruang_phur/constant/upload_diltu_document.dart';
import 'package:ruang_phur/constant/upload_mitthi_document.dart';
import 'package:ruang_phur/constant/upload_motor_receipt.dart';
import 'package:ruang_phur/constant/uppertext_formatter.dart';
import 'package:ruang_phur/controllers/submit_form_controller.dart';
import 'package:ruang_phur/models/district_model.dart';
import 'package:ruang_phur/widgets/stepper/third_step_preview.dart';

class ThirdStepWidget extends GetView<SubmitFormController> {
  const ThirdStepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: controller.thirdStepFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 20,
                  width: 4,
                  color: Colors.black,
                ),
                sizedBoxWidth(10),
                const Text(
                  'Ruang Phurhna man diltu chungchang',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            sizedBoxHeight(10),
            TextFormField(
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Required';
                }
                return null;
              },
              controller: controller.diltuHming,
              decoration: textFieldDecoration('Diltu hming pum', null, ''),
            ),
            sizedBoxHeight(10),
            DropdownSearch<DistrictModel>(
              validator: (value) {
                if (value == null) {
                  return 'Required';
                }
                return null;
              },
              items: (f, cs) async => await controller.getDistrict(f),
              compareFn: (item1, item2) => item1.isEqual(item2),
              selectedItem: controller.selectedDiltuDistrict.value,
              popupProps: const PopupProps.menu(fit: FlexFit.loose),
              decoratorProps: DropDownDecoratorProps(
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Ruang phurh diltu District hming',
                  labelStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onChanged: (value) {
                controller.diltuDistrictText.value = value!.name!;
                controller.diltuDistrictId.value = value.id!;
                controller.selectedDiltuDistrict.value = value;
              },
            ),
            sizedBoxHeight(10),
            TextFormField(
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Required';
                }
                return null;
              },
              controller: controller.diltuVeng,
              decoration: textFieldDecoration('Diltu veng/khua', null, ''),
            ),
            sizedBoxHeight(10),
            TextFormField(
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Required';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              controller: controller.diltuPhoneNo,
              decoration: textFieldDecoration('Diltu phone no', null, ''),
              maxLength: 10,
            ),
            sizedBoxHeight(10),
            TextFormField(
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Required';
                }
                return null;
              },
              controller: controller.diltuBank,
              decoration: textFieldDecoration('Diltu bank hming', null, ''),
            ),
            sizedBoxHeight(10),
            TextFormField(
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Required';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              controller: controller.diltuAccNo,
              decoration: textFieldDecoration('Diltu Account Number', null, ''),
            ),
            sizedBoxHeight(10),
            TextFormField(
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Required';
                }
                return null;
              },
              controller: controller.diltuIFSC,
              decoration: textFieldDecoration('Diltu Bank IFSC Code', null, ''),
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
            ),
            sizedBoxHeight(10),

            //--------------------------------------------------------------------
            const Text('Document Upload'),
            Container(
              width: 20,
              height: 5,
              color: Colors.black,
            ),
            sizedBoxHeight(10),
            const Text(
              'Mitthi Aadhar card/Voter ID/Birth Certificate upload',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Required';
                }
                return null;
              },
              controller: controller.mitthiDocumentUrl,
              onTap: () {
                uploadMitthiDocument(context, controller);
              },
              readOnly: true,
              decoration: textFieldDecoration('Mitthi document upload na',
                  const Icon(Icons.attach_file), ''),
            ),
            sizedBoxHeight(10),
            const Text(
              'Motor hman man Voucher/Receipt',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Required';
                }
                return null;
              },
              controller: controller.motorReceiptUrl,
              onTap: () {
                uploadMotorReceipt(context, controller);
              },
              readOnly: true,
              decoration: textFieldDecoration('Motor hman man Voucher/Receipt',
                  const Icon(Icons.attach_file), ''),
            ),
            sizedBoxHeight(10),
            const Text(
              'Death certificate/VC hriatpuina lehkha',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Required';
                }
                return null;
              },
              controller: controller.deathCertificateUrl,
              onTap: () {
                uploadDeathCertificate(context, controller);
              },
              readOnly: true,
              decoration: textFieldDecoration('A thi a ni tih hriatpuina',
                  const Icon(Icons.attach_file), ''),
            ),
            sizedBoxHeight(10),
            const Text(
              'Death certificate emaw Declaration of death by the  Medical Officer lehkha/ Damdawiina thi lo tan Annexure 1.3 II in a sawi ang in  Authorised Officials hriatpuina lehkha thil tel tur a ni.',
            ),
            sizedBoxHeight(10),
            const Text(
              'Diltu Aadhar card/Voter ID thlalak upload',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Required';
                }
                return null;
              },
              controller: controller.diltuDocumentUrl,
              onTap: () {
                uploadDiltuDocument(context, controller);
              },
              readOnly: true,
              decoration: textFieldDecoration('Diltu document upload na',
                  const Icon(Icons.attach_file), ''),
            ),
            sizedBoxHeight(30),
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
                    controller.activeStep.value = 1;
                  },
                  child: const Text('Back'),
                ),
                MaterialButton(
                  elevation: 0,
                  minWidth: Get.width * 0.4,
                  height: Get.height * 0.06,
                  color: Colors.black,
                  onPressed: () {
                    // controller.activeStep.value = 2;
                    if (controller.thirdStepFormKey.currentState!.validate()) {
                      // _calculateDistance(context);
                      thirdStepPreview(context, controller);
                      FocusScope.of(context).unfocus();
                    } else {
                      mySnackBar(
                        'Please fill all required forms',
                        const Icon(
                          Icons.warning,
                          color: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Preview',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            sizedBoxHeight(20),
          ],
        ),
      ),
    );
  }

  void openDiltuDocument(
      BuildContext context, SubmitFormController controller) {}
}
