import 'package:flutter/material.dart';
import 'package:ruang_phur/constant/my_appbar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: const SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
