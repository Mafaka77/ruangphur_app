import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruang_phur/constant/colors.dart';
import 'package:ruang_phur/constant/my_appbar.dart';
import 'package:ruang_phur/constant/my_snackbar.dart';
import 'package:ruang_phur/constant/reusable.dart';
import 'package:ruang_phur/constant/sized_box.dart';
import 'package:ruang_phur/constant/text_field_decoration.dart';
import 'package:ruang_phur/constant/uppertext_formatter.dart';
import 'package:ruang_phur/controllers/tracking_controller.dart';
import 'package:ruang_phur/widgets/tracking_status_widget.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrackingController>(
        init: TrackingController(),
        builder: (controller) {
          return Scaffold(
            appBar: myAppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: MyColors.stepperBackgroundColor,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ruang phurh dil, chhuina/track',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                          ),
                        ),
                        sizedBoxHeight(10),
                        const Text(
                          'I ruang phurh dilna a thlen chin zawnna a ni. Mipui ten zawldawh takin min lo ngaichang zel dawn nia.',
                        ),
                        sizedBoxHeight(20),
                        const Text(
                          'Tracking ID chhu lut rawh le',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: controller.trackingId,
                          decoration: textFieldDecoration(
                            '',
                            null,
                            'I dilna thlen chin zawhna',
                          ),
                          inputFormatters: [
                            UpperCaseTextFormatter(),
                          ],
                        ),
                        sizedBoxHeight(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              height: 50,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color: Colors.black)),
                              minWidth: Get.width * 0.35,
                              onPressed: () {
                                if (controller.trackingId.text == '') {
                                  mySnackBar(
                                      'Please enter Tracking ID',
                                      const Icon(
                                        Icons.warning,
                                        color: Colors.red,
                                      ));
                                } else {
                                  controller.getAllApplication(() {
                                    showLoader(context);
                                  }, () {
                                    hideLoader();
                                    Get.toNamed('/application-screen');
                                    FocusScope.of(context).unfocus();
                                  }, () {
                                    hideLoader();
                                  });
                                }
                              },
                              child: const Text('View'),
                            ),
                            MaterialButton(
                              height: 50,
                              elevation: 0,
                              color: Colors.black,
                              minWidth: Get.width * 0.5,
                              onPressed: () {
                                if (controller.trackingId.text == '') {
                                  mySnackBar(
                                    'Please enter Tracking ID',
                                    const Icon(
                                      Icons.warning,
                                      color: Colors.red,
                                    ),
                                  );
                                } else {
                                  controller.trackById(() {}, (String message) {
                                    FocusScope.of(context).unfocus();
                                    mySnackBar(
                                        message, const Icon(Icons.check));
                                  }, (String message) {
                                    mySnackBar(
                                        message,
                                        const Icon(
                                          Icons.warning,
                                          color: Colors.red,
                                        ));
                                  });
                                }
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                'Track Now',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Obx(
                    () => controller.isSuccess.isTrue
                        ? const TrackingStatusWidget()
                        : Container(),
                  )
                ],
              ),
            ),
          );
        });
  }
}
