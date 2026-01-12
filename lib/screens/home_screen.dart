import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruang_phur/constant/colors.dart';
import 'package:ruang_phur/constant/sized_box.dart';
import 'package:ruang_phur/controllers/home_controller.dart';
import 'package:ruang_phur/widgets/home_widget/button_grid.dart';
import 'package:ruang_phur/widgets/home_widget/app_bar_widget.dart';
import 'package:ruang_phur/widgets/home_widget/faq_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: MyColors.stepperBackgroundColor,
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 40),
                      // height: Get.height * 0.55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppBarWidget(),
                          sizedBoxHeight(30),
                          const Text(
                            'Chibai! In chhiattawh naah Mizoram Sorkar a awm e.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 27,
                            ),
                          ),
                          Text(
                            'Mitthi ruang chu i duhna taka phur thleng turin dilna document dik tak upload turin ngen leh hriattir i ni e.',
                            style: TextStyle(
                              fontSize: 18,
                              color: MyColors.lightBlack,
                            ),
                          ),
                          sizedBoxHeight(20),
                          const ButtonGrid(),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Image(
                        image: AssetImage('images/info.png'),
                      ),
                    ),
                    const FaqWidget(),
                    sizedBoxHeight(30),
                    const Center(
                      child: Image(
                        height: 60,
                        image: AssetImage('images/swta_logo.png'),
                      ),
                    ),
                    const Center(
                      child: Text('An initiative of'),
                    ),
                    const Center(
                      child: Text(
                          'Department of Social Welfare & Tribal Affairs and WCD,'),
                    ),
                    const Center(
                      child: Text('Government of Mizoram'),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
