import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingController extends GetxController{
  int currentIndex = 0;
  late PageController pageController;
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  void saveOnboardingStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoarding', status);
    update();
  }

}