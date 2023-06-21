import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webullish/constants/api_links.dart';
import 'package:webullish/model/auth_model/response/register_response.dart';
import 'package:webullish/services/api.dart';
import 'package:webullish/view/pages/initial_screen.dart';

import '../../model/auth_model/request/register_model.dart';

class RegisterController extends GetxController{

  final registerFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  String country = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  bool isVisibility = true;
  void visibility() {
    isVisibility = !isVisibility;
    update();
  }
  var id;
  sendToApi(RegisterModel model,BuildContext context){
    postRequest(ApiConst.registerUrl, model.toJson()).then((value) async{
      var response = RegisterResponse.fromJson(value);
      print(value);
      if(value['error'] == null){
        print('Success');
        id = value["user"]['id'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await  prefs.setInt('id',id);
        Get.offAll(const InitialScreen());
      }
      else{
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Registration failed'),
              // content: Text(response.message.toString()),
              content: const Text('Account is Taken try new account'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }






  // sendToApi2(RegisterModel model,BuildContext context) async {
  //   var response = await postRequest2(ApiConst.registerUrl, model.toJson());
  //   if (response.containsKey('status') && response['status'] == true) {
  //     print('User created successfully');
  //     Get.offAll(InitialScreen());
  //     print(response['user']);
  //   } else if (response.containsKey('error')) {
  //      showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title:  MyText(text: 'Alert',color: AppColors.redColor,
  //             size: 18,
  //           ),
  //           content:  MyText(text: "${response['error']}",color: AppColors.primaryColor,
  //             size: 18,
  //           ),
  //           actions: [
  //             TextButton(
  //               onPressed: () => Navigator.pop(context),
  //               child: MyText(text: 'OK',color: AppColors.ancientColor,
  //               size: 18,
  //               ),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   } else {
  //     print('Unknown error occurred');
  //   }
  // }
}