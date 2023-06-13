import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webullish/constants/api_links.dart';
import 'package:webullish/model/auth_model/login_model.dart';
import 'package:webullish/services/api.dart';

import '../../view/pages/initial_screen.dart';

class LoginController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  bool isVisibility = true;

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  login({required LoginModel model,required BuildContext context}) {
    postRequest(ApiConst.loginUrl, model.toJson()).then((value) async{
      if(value['error'] == null){
        String accessToken = value['token'];
        print('Access token: $accessToken');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', value['token']);

        // Navigate to home screen
        Get.offAll(InitialScreen());
      }else{
        print(value['message']);
        print('Failed');
      }
    });
  }

}