import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:webullish/view/pages/alert/alert_screen.dart';
import 'package:webullish/view/pages/edit_delete/edit_profile.dart';
import 'package:webullish/view/pages/faq/faq.dart';
import 'package:webullish/view/pages/perofrmance/webullish_performance.dart';

import '../../view/pages/home/home_screen.dart';

class BottomNavController extends GetxController{

  List<Widget> screens = [
    HomeScreen(),
    const Webullish_Performance(),
    AlertScreen(),
    FAQ(),
    EditProfile(),
  ];
  int currentIndex = 0;
}