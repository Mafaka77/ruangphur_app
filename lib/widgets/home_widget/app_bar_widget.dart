import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: const Image(
        image: AssetImage('images/logov2.png'),
      ),
      leadingWidth: 120,
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed('/drawer-screen');
          },
          icon: const Icon(Icons.menu),
        ),
      ],
    );
  }
}
