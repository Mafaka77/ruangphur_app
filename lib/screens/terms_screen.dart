import 'package:flutter/material.dart';
import 'package:ruang_phur/constant/my_appbar.dart';
import 'package:ruang_phur/constant/sized_box.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms of Use',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              sizedBoxHeight(10),
              Text(
                'Welcome to Ruangphur! By using our app, you agree to the following terms and conditions:',
                style: TextStyle(fontSize: 16),
              ),
              sizedBoxHeight(20),
              Text(
                'General Use',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              sizedBoxHeight(10),
              Text(
                '1. You agree to use the app in compliance with all applicable laws and regulations.\n'
                '2. You are responsible for maintaining the confidentiality of your account information.',
                style: TextStyle(fontSize: 14),
              ),
              sizedBoxHeight(20),
              Text(
                'User Responsibilities',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              sizedBoxHeight(10),
              Text(
                '1. You are responsible for the correctness of the information you provide..\n'
                '2. Submitting false or misleading information may lead to disqualification from the services offered or legal consequences..',
                style: TextStyle(fontSize: 14),
              ),
              sizedBoxHeight(20),
              Text(
                'Intellectual Property',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              sizedBoxHeight(10),
              Text(
                'All content, branding, and logos within the app are the property of the Ruangphur project or respective government agencies and are protected by applicable laws.\n',
                style: TextStyle(fontSize: 14),
              ),
              sizedBoxHeight(20),
              Text(
                'Availability and Changes',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              sizedBoxHeight(10),
              Text(
                '1. The app may be temporarily unavailable due to maintenance or technical issues.\n'
                '2. We reserve the right to modify or discontinue any part of the app at any time without prior notice.',
                style: TextStyle(fontSize: 14),
              ),
              sizedBoxHeight(20),
              Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              sizedBoxHeight(10),
              Text(
                'Information We Collect',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              sizedBoxHeight(10),
              Text(
                '1. Personal Information: We collect personal information such as your name, email address, and phone number when you register or use our services.\n'
                '2. Usage Data: We collect data about how you use the app, including your interactions with features and content.',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                  'Note: We do not collect login credentials, passwords, or track your location or device usage.',
                  style: TextStyle(fontSize: 14)),
              sizedBoxHeight(20),
              Text(
                'How We Use Your Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              sizedBoxHeight(10),
              Text(
                '1. Processing your application.\n'
                '2. Communicating with you regarding the application.',
                style: TextStyle(fontSize: 14),
              ),
              sizedBoxHeight(20),
              Text(
                'Data Security',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              sizedBoxHeight(10),
              Text(
                'We implement a variety of security measures to maintain the safety of your personal information. However, no method of transmission over the internet or method of electronic storage is 100% secure.',
                style: TextStyle(fontSize: 14),
              ),
              sizedBoxHeight(20),
              Text(
                'Your Rights',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              sizedBoxHeight(10),
              Text(
                '1. Request correction of incorrect information.\n'
                '2. Withdraw your application (if applicable before final submission deadlines).',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
