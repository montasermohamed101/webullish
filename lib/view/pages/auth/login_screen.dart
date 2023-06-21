import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullish/controller/auth/login_controller.dart';
import 'package:webullish/utils/app_colors.dart';
import 'package:webullish/view/pages/auth/register_screen.dart';
import 'package:webullish/view/widgets/my_text.dart';
import 'package:webullish/view/widgets/my_text_form_field.dart';
import 'package:webullish/view/widgets/onboarding_button.dart';

import '../../../model/auth_model/request/login_model.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) => Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 83.0,horizontal: 44),
              child: Form(
                key: controller.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(child: Image.asset('assets/images/logo.png')),
                    const SizedBox(height: 68),
                    MyText(text: 'Login today',
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
                        hintText: 'youremail@gmail.com',
                      maxLines: 1,
                      obscureText: false,
                      suffixIcon: Icon(Icons.email_outlined,color: AppColors.ancientColor,),
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                        controller: controller.passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the Password ';
                        }
                        if (value.length > 25) {
                          return 'Password cannot be longer than 25 characters';
                        }
                        if (value.length < 2) {
                          return 'Password  must have at least 2 characters';
                        }
                        return null;
                      },
                        keyboardType: TextInputType.text,
                        hintText: 'password',
                      obscureText: controller.isVisibility,
                      maxLines: 1,
                      suffixIcon: InkWell(
                          onTap: (){
                            controller.visibility();
                          },
                          child: Icon(controller.isVisibility ?Icons.lock_outline  :Icons.lock_open,color: AppColors.ancientColor,)),
                    ),
                    const SizedBox(height: 25),
                    InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: (){
                        Get.to(const ForgotPasswordScreen());
                      },
                      child: MyText(text: 'Forgot Password?',
                        color: AppColors.whiteColor,
                        size: 14,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    const SizedBox(height: 65),
                    MyButton(text: 'Login',
                        onPressed: (){
                          if(controller.loginFormKey.currentState!.validate()){
                            controller.loginFormKey.currentState!.save();
                            controller.login(
                              model: LoginModel(email: controller.emailController.text,
                                  password: controller.passwordController.text),
                              context: context
                            );
                          }else{
                          }
                        },
                        size: 22,
                        color: AppColors.whiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 68),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(text: 'Didn’t have any account?',
                        color: AppColors.whiteColor,
                        size: 17,
                        fontWeight: FontWeight.w400,

                      ),
                      TextButton(
                        onPressed: (){
                          Get.offAll(const RegisterScreen());
                        },
                        child: MyText(text: 'Sign Up here',
                          color: AppColors.ancientColor,
                          size: 17,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ],
                  ),

                  ],
                ),
              ),
            ),
          ),
    ));
  }
}
