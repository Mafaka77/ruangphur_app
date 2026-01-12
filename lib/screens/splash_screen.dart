import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    Timer(const Duration(seconds: 3), () => toRoutes());

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  void toRoutes() async {
    Get.offNamedUntil('/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              height: 80, // Ensure proper image sizing
              fit: BoxFit.contain,
              image: AssetImage('images/swta_logo.png'),
            ),
            Text('Directorate of Social Welfare'),
            Text('Government of Mizoram')
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Center(
            child: FadeTransition(
              opacity: _animationController,
              child: const Image(
                height: 80,
                image: AssetImage('images/splash_logo.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
