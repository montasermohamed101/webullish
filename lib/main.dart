import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webullish/view/pages/auth/privacy_policy.dart';
import 'package:webullish/view/pages/home/home_screen.dart';

bool? show;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('onBoarding') ?? false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      debugShowCheckedModeBanner: false,
      // home:show! == true ? LoginScreen() :  OnBoardingScreen(),
      home:HomeScreen(),
    );
  }
}

