import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullish/constants/api_links.dart';
import 'package:webullish/services/api.dart';
import 'package:webullish/view/pages/initial_screen.dart';
import 'package:webullish/view/widgets/my_text.dart';

import '../../model/auth_model/register_model.dart';
import '../../utils/app_colors.dart';

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

  sendToApi(RegisterModel model,BuildContext context){
    postRequest(ApiConst.registerUrl, model.toJson()).then((value) {
      if(value['error'] == null){
        print('Success');
        Get.offAll(InitialScreen());
      }
      else{
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Registration failed'),
              content: Text('The email has already been taken.'),
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