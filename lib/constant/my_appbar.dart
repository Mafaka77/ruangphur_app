import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruang_phur/constant/colors.dart';

myAppBar() {
  return AppBar(
    backgroundColor: MyColors.stepperBackgroundColor,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(
        Icons.arrow_back_ios_new,
      ),
    ),
  );
}
