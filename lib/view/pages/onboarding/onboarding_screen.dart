import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:webullish/controller/onboarding_controller/onboarding_controller.dart';
import 'package:webullish/home.dart';
import 'package:webullish/model/onboarding_model/content_model.dart';
import 'package:webullish/utils/app_colors.dart';

import '../../widgets/my_text.dart';
import '../../widgets/onboarding_button.dart';

class OnBoardingScreen extends StatelessWidget {


  var controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OnBoardingController>(
      init: OnBoardingController(),
        builder: (controller) => Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: (int index){
                    controller.currentIndex = index;
                    controller.update();
                  },
                    itemCount: contents.length,
                    itemBuilder: (_,index) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(contents[index].image,
                              height: MediaQuery.of(context).size.height * 0.4,
                            ),
                            MyText(
                              text: contents[index].title,
                              color: AppColors.ancientColor,
                              size: 22,
                              fontWeight: FontWeight.w700,
                            ),
                            Expanded(
                              child: MyText(
                                text: contents[index].description,
                                color: AppColors.whiteColor,
                                size: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
                Visibility(
                  visible: controller.currentIndex == contents.length - 1 ? true :false,
                child: OnBoardingButton(
                    onPressed: (){}, text:'startquickly !',
                    color: AppColors.whiteColor,
                   fontWeight: FontWeight.w700,
                  size: 22,
           ),
              ) ,
                const SizedBox(height: 20),
                Visibility(
                  visible: controller.currentIndex == contents.length - 1 ? true :false,
                child: OnBoardingButton(
                    onPressed: (){}, text:'Log in as a guest',
                    color: AppColors.primaryColor,
                   fontWeight: FontWeight.w700,
                  size: 22,
           ),
              ) ,
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: (){
                    controller.saveOnboardingStatus(true);
                  Get.offAll(  HomeScreen());
                  }, child: MyText(
                    text:'Skip',
                    color: AppColors.whiteColor,
                    size: 20,
                    fontWeight: FontWeight.w700,
                  )),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(contents.length, (index) => buildDot(index,context),
                      ),
                    ),
                  ),
                  buildDot2(controller.currentIndex,context),

                ],
              ),

            ],
          ),
        ),
      ),
    ));
  }
  Widget buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: controller.currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:controller.currentIndex == index ? AppColors.ancientColor : AppColors.whiteColor,
      ),
    );
  }

  Widget buildDot2(int index, BuildContext context) {
    if (index == contents.length - 1) {
      return TextButton(onPressed: (){
        controller.saveOnboardingStatus(true);
      }, child: MyText(
        text:'Done',
        color: AppColors.ancientColor,
        size: 20,
        fontWeight: FontWeight.w700,
      ));
    } else {
      return   InkWell(
        onTap: (){
          if(controller.currentIndex == contents.length -1){}
          controller.pageController .nextPage(duration: Duration(milliseconds: 100),
              curve: Curves.bounceIn);
        },
        child: Container(
          margin: EdgeInsets.only(right: 5),
          child: Icon(Icons.arrow_forward, color: Colors.white),
        ),
      );
    }
  }

}

