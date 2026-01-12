import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:ruang_phur/constant/colors.dart';

showLoader(BuildContext context) {
  return Loader.show(context,
      overlayColor: Colors.transparent,
      progressIndicator: Platform.isIOS
          ? const CupertinoActivityIndicator(
              color: Colors.black,
              radius: 12,
            )
          : const CircularProgressIndicator(
              color: Colors.black,
            ),
      themeData: Theme.of(context).copyWith(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.green)));
}

hideLoader() {
  return Loader.hide();
}

showDownloadSuccessSnackBar(
    String title, String message, Icon icon, String filePath) {
  return Get.rawSnackbar(
    title: title,
    message: message,
    icon: icon,
    shouldIconPulse: true,
    backgroundColor: MyColors.skyBlue,
    padding: const EdgeInsets.all(10),
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 5),
    margin: const EdgeInsets.all(20),
    mainButton: MaterialButton(
      onPressed: () {
        OpenFile.open(filePath);
      },
      child: const Text('VIEW'),
    ),
  );
}
