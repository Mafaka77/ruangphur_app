import 'package:get/get.dart';
import 'package:ruang_phur/screens/about_us_screen.dart';
import 'package:ruang_phur/screens/download_screen.dart';
import 'package:ruang_phur/screens/drawer_screen.dart';
import 'package:ruang_phur/screens/faq_screen.dart';
import 'package:ruang_phur/screens/home_screen.dart';
import 'package:ruang_phur/screens/otp_screen.dart';
import 'package:ruang_phur/screens/splash_screen.dart';
import 'package:ruang_phur/screens/submit_form_screen.dart';
import 'package:ruang_phur/screens/success_screen.dart';
import 'package:ruang_phur/screens/terms_screen.dart';
import 'package:ruang_phur/screens/tracking_screen.dart';
import 'package:ruang_phur/screens/view_application_screen.dart';

final getPages = [
  GetPage(
    name: '/splash-screen',
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: '/',
    page: () => const HomeScreen(),
    children: [
      GetPage(
        name: '/submit-form-screen',
        page: () => const SubmitFormScreen(),
      ),
      GetPage(
        name: '/tracking-screen',
        page: () => const TrackingScreen(),
      ),
      GetPage(
        name: '/otp-screen',
        page: () => OtpScreen(),
      ),
      GetPage(
        name: '/success-screen',
        page: () => const SuccessScreen(),
      ),
      GetPage(
        name: '/application-screen',
        page: () => const ViewApplicationScreen(),
      ),
      GetPage(
        name: '/drawer-screen',
        page: () => const DrawerScreen(),
        transition: Transition.downToUp,
      ),
      GetPage(
        name: '/faq-screen',
        page: () => const FaqScreen(),
      ),
      GetPage(
        name: '/download-screen',
        page: () => const DownloadScreen(),
      ),
      GetPage(
        name: '/terms-screen',
        page: () => const TermsScreen(),
      ),
      GetPage(
        name: '/about-us-screen',
        page: () => const AboutUsScreen(),
      ),
    ],
  ),
];
