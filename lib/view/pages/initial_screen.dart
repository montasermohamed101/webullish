import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullish/controller/bottom_nav_controller/bottom_nav_controller.dart';
import 'package:webullish/view/pages/auth/privacy_policy.dart';
import 'package:webullish/view/pages/home/home_screen.dart';

import '../../utils/app_colors.dart';
import 'auth/terms.dart';

class InitialScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  GetBuilder<BottomNavController>(
      init: BottomNavController(),
        builder: (controller) =>Scaffold(
         body: controller.screens[controller.currentIndex],
          bottomNavigationBar:Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColors.blueBrownColor
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.currentIndex,
              onTap: (index) {
                controller.currentIndex = index;
                controller.update();
              },
              items:  <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Image.asset("assets/images/nav/home.png",color: controller.currentIndex !=0 ?AppColors.navUnSelectedColor:AppColors.navSelectedColor,height: 50),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/images/nav/performance.png",height: 50,color: controller.currentIndex !=1 ?AppColors.navUnSelectedColor:AppColors.navSelectedColor,),
                  label: 'Performance',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/images/nav/notification.png",height: 50,color: controller.currentIndex !=2 ?AppColors.navUnSelectedColor:AppColors.navSelectedColor,),
                  label: 'Swing Alerts',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/images/nav/video.png",height: 50,color: controller.currentIndex !=3 ?AppColors.navUnSelectedColor:AppColors.navSelectedColor,),
                  label: 'Extras',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/images/nav/profile.png",height: 50,color: controller.currentIndex !=4 ?AppColors.navUnSelectedColor:AppColors.navSelectedColor,),
                  label: 'Profile',
                ),

              ],
              selectedItemColor: AppColors.navSelectedColor,

              unselectedItemColor: AppColors.navUnSelectedColor,
            ),
          ),
    ));
  }
}
