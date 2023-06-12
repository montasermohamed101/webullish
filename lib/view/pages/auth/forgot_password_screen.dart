import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullish/utils/app_colors.dart';

import '../../../controller/auth/forgot_password_controller.dart';
import '../../widgets/my_text.dart';
import '../../widgets/my_text_form_field.dart';
import '../../widgets/onboarding_button.dart';

class ForgotPasswordScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ForgotPasswordController>(
      init: ForgotPasswordController(),
        builder: (controller)=> Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 83.0,horizontal: 44),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(child: Image.asset('assets/images/logo.png')),
                    const SizedBox(height: 55),
                    MyText(text: 'Forgot Password',
                      color: AppColors.whiteColor,
                      size: 22,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 29),
                    MyTextFormField(
                      controller: controller.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (value!.length < 12) {
                          return 'Email must have at least 2 characters';
                        }
                        if (!value.contains('@')) {
                          return 'Invalid email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'mail@mail.com',
                      maxLines: 1,
                      obscureText: false,
                      suffixIcon: Icon(Icons.email_outlined,color: AppColors.ancientColor,),
                    ),
                    const SizedBox(height: 122),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: MyButton(text: 'Forgot Password?',
                        onPressed: (){
                          if(controller.formKey.currentState!.validate()){
                            controller.formKey.currentState!.save();

                          }else{

                          }
                        },
                        size: 22,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
