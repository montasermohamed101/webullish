import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/edit_delete_controller/edit_profile_controller.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/my_text.dart';
import '../../widgets/my_text_form_field.dart';
import '../../widgets/onboarding_button.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
        init: EditProfileController(),
        builder: (controller) => Scaffold(
              backgroundColor: AppColors.primaryColor,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: MyText(
                  text: 'Edit Profile',
                  color: AppColors.ancientColor,
                  fontWeight: FontWeight.bold,
                  size: 22,
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: Image.asset('assets/images/back_arrow.png'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                elevation: 0,
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 83.0, horizontal: 44),
                  child: Form(
                    key: controller.editProfileFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 68),
                        MyText(
                          text: 'Edit Your Information',
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
                          suffixIcon: Icon(
                            Icons.person_outline_outlined,
                            color: AppColors.ancientColor,
                          ),
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
                          obscureText: false,
                          maxLines: 1,
                          suffixIcon: InkWell(
                              onTap: () {
                                controller.visibility();
                              },
                              child: Icon(
                                     Icons.email_outlined,
                                color: AppColors.ancientColor,
                              )),
                        ),
                        const SizedBox(height: 20),
                        MyTextFormField(
                          controller: controller.phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the Phone ';
                            }
                            if (value.length > 25) {
                              return 'Phone cannot be longer than 25 characters';
                            }
                            if (value.length < 2) {
                              return 'Phone  must have at least 2 characters';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          hintText: 'Phone',
                          obscureText:false,
                          maxLines: 1,
                          suffixIcon: InkWell(
                              onTap: () {
                                controller.visibility();
                              },
                              child: Icon(
                                Icons.phone_in_talk,
                                color: AppColors.ancientColor,
                              )),
                        ),
                        const SizedBox(height: 20),
                        MyTextFormField(
                          controller: controller.passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the Password';
                            }
                            if (value.length < 2) {
                              return 'Password must have at least 2 characters';
                            }
                            if (value.length > 25) {
                              return 'Password cannot be longer than 25 characters';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          hintText: 'password',
                          obscureText: controller.isVisibility,
                          maxLines: 1,
                          suffixIcon: InkWell(
                              onTap: () {
                                controller.visibility();
                              },
                              child: Icon(
                                controller.isVisibility
                                    ? Icons.lock_outline
                                    : Icons.lock_open,
                                color: AppColors.ancientColor,
                              )),
                        ),
                        const SizedBox(height: 20),
                        MyTextFormField(
                          controller: controller.rePasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value.length < 2) {
                              return 'Password must have at least 2 characters';
                            }
                            if (value.length > 25) {
                              return 'Password cannot be longer than 25 characters';
                            }
                            // Check if the confirm password matches the password
                            if (value != controller.passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          hintText: 'password',
                          obscureText: controller.isVisibility,
                          maxLines: 1,
                          suffixIcon: InkWell(
                              onTap: () {
                                controller.visibility();
                              },
                              child: Icon(
                                controller.isVisibility
                                    ? Icons.lock_outline
                                    : Icons.lock_open,
                                color: AppColors.ancientColor,
                              )),
                        ),
                        const SizedBox(height: 39),
                        MyButton(
                          text: 'Update Information',
                          onPressed: () {
                            if(controller.editProfileFormKey.currentState!.validate()){
                              controller.editProfileFormKey.currentState!.save();
                              print('Success');
                            }else{
                              print('Not');
                              // showDialog(context: context, builder: (_) => AlertDialog(
                              //   title: Text('Please Enter all Fields'),
                              // ));
                            }
                          },
                          size: 22,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
