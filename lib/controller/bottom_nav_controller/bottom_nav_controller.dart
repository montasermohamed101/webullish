import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:webullish/view/pages/alert/alert_screen.dart';
import 'package:webullish/view/pages/edit_delete/edit_profile.dart';
import 'package:webullish/view/pages/faq/faq.dart';

import '../../view/pages/home/home_screen.dart';
import '../../view/pages/perofrmance/performance_january.dart';

class BottomNavController extends GetxController{

  List<Widget> screens = [
    const HomeScreen(),
    const PerformanceJanuary(),
    const AlertScreen(),
    const FAQ(),
    EditProfile(),
  ];
  int currentIndex = 0;
}