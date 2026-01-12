import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruang_phur/constant/colors.dart';
import 'package:ruang_phur/constant/reusable.dart';
import 'package:ruang_phur/constant/sized_box.dart';
import 'package:ruang_phur/controllers/home_controller.dart';

class DrawerScreen extends GetView<HomeController> {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
                ),
                sizedBoxHeight(50),
                ListTile(
                  dense: true,
                  onTap: () {
                    Get.toNamed('/faq-screen');
                  },
                  tileColor: MyColors.stepperBackgroundColor,
                  title: const Text('FAQs'),
                  trailing: const Icon(Icons.arrow_right),
                ),
                sizedBoxHeight(10),
                ListTile(
                  dense: true,
                  onTap: () {
                    controller.getAllDownloads(() {
                      showLoader(context);
                    }, () {
                      hideLoader();
                      Get.toNamed('/download-screen');
                    }, () {
                      hideLoader();
                    });
                  },
                  tileColor: MyColors.stepperBackgroundColor,
                  title: const Text('Downloads'),
                  trailing: const Icon(Icons.arrow_right),
                ),
                sizedBoxHeight(10),
                ListTile(
                  onTap: () {
                    Get.toNamed('/terms-screen');
                  },
                  dense: true,
                  tileColor: MyColors.stepperBackgroundColor,
                  title: const Text('Terms & Conditions'),
                  trailing: const Icon(Icons.arrow_right),
                ),
                sizedBoxHeight(10),
                ListTile(
                  dense: true,
                  tileColor: MyColors.stepperBackgroundColor,
                  title: const Text('About Us'),
                  trailing: const Icon(Icons.arrow_right),
                ),
                sizedBoxHeight(10),
                ListTile(
                  dense: true,
                  tileColor: MyColors.stepperBackgroundColor,
                  title: const Text('Contact Us'),
                  trailing: const Icon(Icons.arrow_right),
                ),
                sizedBoxHeight(50),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
        // Adjust background color if needed
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Image(
                height: 50, // Ensure proper image sizing
                fit: BoxFit.contain,
                image: AssetImage('images/msegslogo.png'),
              ),
            ),
            Center(
              child: Text('Crafted with care by'),
            ),
            Center(
              child: AutoSizeText(
                ' Mizoram State e-Governance Society (MSeGS)',
                maxFontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
