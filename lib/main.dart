import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:webullish/bindings/initail_Bindings.dart';
import 'package:webullish/view/pages/alert/alert_screen.dart';
import 'package:webullish/view/pages/faq/faq.dart';
import 'package:webullish/view/pages/home/home_screen.dart';

import 'package:webullish/view/pages/perofrmance/performance_january.dart';
import 'package:webullish/view/pages/perofrmance/webullish_performance.dart';


bool? onBoarding;
String? accessToken;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  onBoarding = prefs.getBool('onBoarding') ?? false;
   accessToken = prefs.getString('token');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, child!),
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.resize(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ],
          breakpointsLandscape: [
            const ResponsiveBreakpoint.resize(560, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(812, name: MOBILE),
            const ResponsiveBreakpoint.resize(1024, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1120, name: TABLET),
          ],
        );
      },
      // home: onBoarding == true && accessToken != null && accessToken!.isNotEmpty
      //     ? InitialScreen()
      //     : onBoarding == true && (accessToken == null || accessToken!.isEmpty)
      //     ? LoginScreen()
      //     : OnBoardingScreen(),
      home:  Webullish_Performance(),
      initialBinding: InitailBaindings(),
    );
  }
}



