import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruang_phur/constant/colors.dart';

class ButtonGrid extends StatelessWidget {
  const ButtonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of items per row
        crossAxisSpacing: 0,
        childAspectRatio: 2 / 2, // Adjust for square-like cards
      ),
      itemCount: 2, // Number of grid items
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: index == 0
              ? InkWell(
                  onTap: () {
                    Get.toNamed('/submit-form-screen');
                  },
                  child: const Image(
                    image: AssetImage('images/dilna.png'),
                  ),
                )
              : InkWell(
                  onTap: () {
                    Get.toNamed('/tracking-screen');
                  },
                  child: const Image(
                    image: AssetImage('images/chhuina.png'),
                  ),
                ),
        );
      },
    );
  }
}
