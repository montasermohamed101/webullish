import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullish/controller/auth/register_controller.dart';
import 'package:webullish/view/pages/auth/login_screen.dart';
import 'package:webullish/view/pages/auth/privacy_policy.dart';
import 'package:webullish/view/pages/auth/terms.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/my_drop_down_menu.dart';
import '../../widgets/my_text.dart';
import '../../widgets/my_text_form_field.dart';
import '../../widgets/onboarding_button.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<RegisterController>(
      init: RegisterController(),
        builder: (controller) => Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 83.0,horizontal: 44),
              child: Form(
                key: controller.registerFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(child: Image.asset('assets/images/logo.png')),
                    const SizedBox(height: 68),
                    MyText(text: 'Register Now',
                      color: AppColors.whiteColor,
                      size: 22,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 29),
                    MyTextFormField(
                      controller: controller.nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the name ';
                        }
                        if (value.length > 25) {
                          return 'name cannot be longer than 25 characters';
                        }
                        if (value.length < 2) {
                          return 'name  must have at least 2 characters';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      hintText: 'your name',
                      maxLines: 1,
                      obscureText: false,
                      suffixIcon: Icon(Icons.email_outlined,color: AppColors.ancientColor,),
                    ),
                    const SizedBox(height: 20),
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
                      hintText: 'youremail@mail.com',
                      obscureText: controller.isVisibility,
                      maxLines: 1,
                      suffixIcon: InkWell(
                          onTap: (){
                            controller.visibility();
                          },
                          child: Icon(controller.isVisibility ?Icons.visibility_off  :Icons.visibility,color: AppColors.ancientColor,)),
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
                    const SizedBox(height: 20),
                    MyDropDownMenu(
                        myList: controller.items,
                        onChanged:  (val) {
                          controller.country = val!;
                        }
                    ),
                    const SizedBox(height: 39),
                    MyButton(text: 'Sign Up',
                      onPressed: (){},
                      size: 22,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 34),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(text: 'If you have an account?',
                          color: AppColors.whiteColor,
                          size: 17,
                          fontWeight: FontWeight.w400,

                        ),
                        TextButton(
                          onPressed: (){
                            Get.offAll(LoginScreen());
                          },
                          child: MyText(text: 'Sign In here',
                            color: AppColors.ancientColor,
                            size: 17,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    MyText(text: 'By clicking Sing up, you agree to our',
                      color: AppColors.whiteColor,
                      size: 17,
                      fontWeight: FontWeight.w500,

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: (){
                            Get.to(TermsScreen());
                          },
                          child: MyText(text: 'Terms',
                            color: AppColors.ancientColor,
                            size: 17,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        MyText(text: 'and',
                          color: AppColors.whiteColor,
                          size: 17,
                          fontWeight: FontWeight.w400,
                        ),
                        TextButton(
                          onPressed: (){
                            Get.to(PrivacyPolicyScreen());
                          },
                          child: MyText(text: 'Privacy Policy',
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
