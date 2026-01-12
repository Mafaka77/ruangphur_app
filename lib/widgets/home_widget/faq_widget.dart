import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruang_phur/constant/sized_box.dart';
import 'package:ruang_phur/controllers/home_controller.dart';

class FaqWidget extends GetView<HomeController> {
  const FaqWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ruang Phur chungchang a zawhna leh chhana',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          sizedBoxHeight(20),
          const Text(
            'FAQs',
            style: TextStyle(fontSize: 18),
          ),
          sizedBoxHeight(10),
          Obx(
            () => ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: controller.faqList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (c, i) {
                var data = controller.faqList[i];
                return ExpansionTile(
                  backgroundColor: Colors.white,
                  dense: true,
                  maintainState: true,
                  childrenPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: const RoundedRectangleBorder(),
                  collapsedBackgroundColor: Colors.white,
                  title: Text(data.question),
                  children: [
                    AutoSizeText(
                      data.answer,
                      maxLines: 10,
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
