import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:webullish/view/pages/alert/alert_screen.dart';
import 'package:webullish/view/pages/edit_delete/edit_profile.dart';

import '../../view/pages/auth/terms.dart';
import '../../view/pages/home/home_screen.dart';
import '../../view/pages/perofrmance/performance_january.dart';

class BottomNavController extends GetxController{
  List<Widget> screens = [
    HomeScreen(),
    PerformanceJanuary(),
    AlertScreen(),
    TermsScreen(),
    EditProfile(),
  ];
  int currentIndex = 0;
}