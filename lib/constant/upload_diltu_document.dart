import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ruang_phur/constant/my_snackbar.dart';
import 'package:ruang_phur/constant/reusable.dart';
import 'package:ruang_phur/controllers/submit_form_controller.dart';

uploadDiltuDocument(BuildContext context, SubmitFormController controller) {
  return showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      context: context,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: Get.height * 0.1,
          width: Get.width,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 1,
            ),
            children: [
              InkWell(
                onTap: () {
                  openGallery(controller, context);
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image_rounded),
                    Text('Gallery'),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  openCamera(controller, context);
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.camera_alt_outlined), Text('Camera')],
                ),
              ),
            ],
          ),
        );
      });
}

void openCamera(SubmitFormController controller, BuildContext context) async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(
    source: ImageSource.camera,
    imageQuality: 50,
  );
  if (image != null) {
    controller.diltuDocumentFile = image;
    controller.uploadDiltuDocument(() {
      showLoader(context);
    }, (String message) {
      mySnackBar(message, const Icon(Icons.check));
      hideLoader();
    }, (String message) {
      mySnackBar(message, const Icon(Icons.warning));
      hideLoader();
    });
    // controller.attachmentName.text = image.name;
    // controller.isAttachment.value = true;
    Get.back();
  }
}

void openGallery(SubmitFormController controller, BuildContext context) async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(
    source: ImageSource.gallery,
    imageQuality: 50,
  );
  if (image != null) {
    controller.diltuDocumentFile = image;
    controller.uploadDiltuDocument(() {
      showLoader(context);
    }, (String message) {
      mySnackBar(message, const Icon(Icons.check));
      hideLoader();
    }, (String message) {
      mySnackBar(message, const Icon(Icons.warning));
      hideLoader();
    });
    // controller.attachmentName.text = image.name;
    // controller.isAttachment.value = true;
    Get.back();
  }
}
