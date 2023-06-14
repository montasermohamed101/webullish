import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webullish/constants/api_links.dart';
import 'package:webullish/services/api.dart';

import '../../model/auth_model/request/login_model.dart';
import '../../model/auth_model/response/login_response.dart';
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
  // var name;
  var id;
  login({required LoginModel model,required BuildContext context}) {
    postRequest(ApiConst.loginUrl, model.toJson()).then((value) async{
      // var response = LoginResponse.fromJson(value);
      // print('==============Value=================');
      // print(value);
      // print(response.message);
      // print(response.code.toString());
      // print('===============================');
      if(value['error'] == null){
          String accessToken = value['token'];
          id = value["user"]['id'];
          print('Access token: $accessToken');
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', value['token']);
        await  prefs.setInt('id',id);
        Get.offAll(InitialScreen());
      }else{
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Log in failed'),
              content: Text('The email or password is wrong.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }
  // login({required LoginModel model,required BuildContext context}) {
  //   postRequest(ApiConst.loginUrl, model.toJson()).then((value) async{
  //     if(value['error'] == null){
  //       String accessToken = value['token'];
  //       id = value["user"]['id'];
  //       print('Access token: $accessToken');
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       await prefs.setString('token', value['token']);
  //     await  prefs.setInt('id',id);
  //       // Navigate to home screen
  //       Get.offAll(InitialScreen());
  //     }else{
  //       print(value['message']);
  //       print('Failed');
  //     }
  //   });
  // }

}