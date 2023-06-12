import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  bool isVisibility = true;

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }
}