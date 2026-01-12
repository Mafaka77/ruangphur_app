import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruang_phur/constant/sized_box.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String applicationNo = Get.arguments[0];
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sizedBoxHeight(200),
                const Image(
                  width: 100,
                  image: AssetImage('images/success.png'),
                ),
                const Text(
                    'I ruang phurh dilna hlawhtling taka thehluh a ni e'),
                sizedBoxHeight(30),
                const Text('Dilna ID'),
                Text(
                  applicationNo.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
                sizedBoxHeight(50),
                MaterialButton(
                  elevation: 0,
                  height: 70,
                  color: Colors.black,
                  minWidth: Get.width * 0.6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    Get.offAndToNamed('/');
                  },
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(color: Colors.white, letterSpacing: 2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
