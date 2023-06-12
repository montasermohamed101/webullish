import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../view/pages/auth/privacy_policy.dart';
import '../../view/pages/auth/terms.dart';
import '../../view/pages/home/home_screen.dart';

class BottomNavController extends GetxController{
  List<Widget> screens = [
    HomeScreen(),
    PrivacyPolicyScreen(),
    TermsScreen(),
    TermsScreen(),
    TermsScreen(),
  ];
  int currentIndex = 0;
}