import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ruang_phur/routes/router.dart';
import 'package:ruang_phur/screens/home_screen.dart';
import 'package:ruang_phur/services/first_step_services.dart';
import 'package:ruang_phur/services/home_services.dart';
import 'package:ruang_phur/services/tracking_services.dart';

void main() {
  Get.put(FirstStepServices(), tag: 'firstStepServices');
  Get.put(TrackingServices(), tag: 'trackingServices');
  Get.put(HomeServices(), tag: 'homeServices');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          headlineSmall: GoogleFonts.notoSans(
            textStyle: const TextStyle(
                fontSize: 48, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          bodyMedium: GoogleFonts.openSans(
            textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
        ),
      ),
      initialRoute: '/splash-screen',
      getPages: getPages,
    );
  }
}
