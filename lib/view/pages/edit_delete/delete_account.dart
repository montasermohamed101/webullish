import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/edit_delete_controller/delete_account_controller.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/my_text.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeleteAccountController>(
        init: DeleteAccountController(),
        builder: (controller) => Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: MyText(
              text: 'Delete account',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 68),
                  MyText(
                    text: 'Would you like to delete your account whit us!',
                    color: AppColors.whiteColor,
                    size: 22,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20),
                  MyText(
                    text: 'All data and subscriptions about account will delete!',
                    color: AppColors.whiteColor,
                    size: 22,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 36),
                  MyText(
                    text: 'In the event that request deletion'
                        'of your account, you will not be'
                        'able to request the recovery of'
                        'your account with us.',
                    color: AppColors.redColor,
                    size: 22,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
                  ),
                  MyText(
                    text: 'YOU agree to that!',

                    color: AppColors.ancientColor,
                    size: 22,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 39),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  AppColors.ancientColor,
                        minimumSize: const Size(double.infinity, 51),
                      ),
                      onPressed: (){

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/delete.png'),
                          const SizedBox(width: 9),
                          MyText(
                            text: 'Yes,',
                            size: 22,
                            color: AppColors.redColor,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(width: 9),
                          MyText(
                            text: 'Delete Account',
                            size: 22,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
