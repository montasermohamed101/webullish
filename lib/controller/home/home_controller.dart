import 'dart:async';
import 'dart:convert';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:webullish/constants/api_links.dart';
import 'package:webullish/model/top_notification_model/top_notification_model.dart';
import 'package:webullish/services/api.dart';
import 'package:webullish/model/users/user_model.dart';
import 'package:webullish/view/pages/edit_delete/edit_profile.dart';

import '../../model/follow_us_model/follow_us_model.dart';
import '../../utils/app_colors.dart';
import '../../view/pages/edit_delete/delete_account.dart';
import '../../view/widgets/my_text.dart';
import 'package:http/http.dart' as http;
class HomeController extends GetxController{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          widthFactor: 0.9, // Adjust the width factor as needed
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.subscriptionColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 27),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(EditProfile());
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/images/edit.png'),
                        const SizedBox(width: 10,),
                        MyText(text: 'Edit Profile', color: AppColors.ancientColor,
                          fontWeight: FontWeight.w700,
                          size: 22,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 22.0),
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: [
                        Image.asset('assets/images/signout.png'),
                        const SizedBox(width: 10,),
                        MyText(text: 'Sign out', color: AppColors.ancientColor,
                          fontWeight: FontWeight.w700,
                          size: 22,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 22.0),
                  InkWell(
                    onTap: (){
                      Get.to(DeleteAccount());
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/images/delete.png'),
                        const SizedBox(width: 10,),
                        MyText(text: 'Delete', color: AppColors.redColor,
                          fontWeight: FontWeight.w700,
                          size: 22,
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }

final List<String> socialIcon = [
  'assets/images/facebook.png',
  'assets/images/twitter.png',
  'assets/images/youtube.png',
  'assets/images/instagram.png',
  'assets/images/linked.png',
];
final List<String> socialName = [
  'facebook',
  'twitter',
  'youtube',
  'instagram',
  'linkedin',
];

final List<Color> socialColor = [
  AppColors.facebookBackground,
  AppColors.twitterBackground,
  AppColors.youtubeBackground,
  AppColors.instagramBackground,
  AppColors.linkedBackground,

];
  // String? getLinkForIndex(FollowUsPagesModel followUpPage, int index) {
  //   switch (index) {
  //     case 0: // Facebook
  //       return followUpPage.facebook;
  //     case 1: // Twitter
  //       return followUpPage.twitter;
  //     case 2: // YouTube
  //       return followUpPage.youtube;
  //     case 3: // Instagram
  //       return followUpPage.instagram;
  //     case 4: // LinkedIn
  //       return followUpPage.linkedin;
  //     default:
  //       return null;
  //   }
  // }

  final List<String> videoUrls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://www.fluttercampus.com/video.mp4',
    'https://www.fluttercampus.com/video.mp4',
  ];

  late List<VideoPlayerController> videoPlayerControllers;
  late List<ChewieController> chewieControllers;


  int? userId;

  UserDM currentUser = UserDM();

  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id');
    return userId;
  }

  Future<void> getCurrentUser() async {
    int? id = await getUserId();
    if (id == null) {
      print('Error: User ID not found');
      return;
    }

    print('User ID: $id');
    // + '?id=$id'

    final response = await getRequest(ApiConst.getUserUrl);
    print('Response: $response');
    if (response.containsKey('error')) {
      // Handle error
      print('Error: ${response['error']}');
    } else {
      final users = response['users'] as List<dynamic>;
      print('Users Montaser: $users');
      if (users.isNotEmpty) {
        final currentUserData = users.firstWhere((user) => user['id'] == id, orElse: () => null);
        if (currentUserData != null) {
          currentUser = UserDM.fromJson(currentUserData as Map<dynamic, dynamic>);
          print('User: ${currentUser.name}');
          print('User email: ${currentUser.email}');
          print('User id: ${currentUser.id}');
          // Update the UI with the current user
          update();
          // ...
        } else {
          print('Error: Current user not found');
        }
      } else {
        print('Error: Users list is empty');
      }
    }
  }

  // TopNotificationModel topNotificationModel = TopNotificationModel();
  // Future<void> getTopNotification() async {
  //   final response = getRequest(ApiConst.getTopNotificationUrl);
  //   topNotificationModel = TopNotificationModel.fromJson(topNotificationModel as Map<dynamic, dynamic>);
  //   print('User: ${topNotificationModel.name}');
  //
  //
  //   print(response);
  // }

  List<Notofocation> listNotifications = [];

  Future<void> getTopNotification() async {
    final response = await getRequest(ApiConst.getTopNotificationUrl);
    if (response.containsKey('error')) {
      print('Error: ${response['error']}');
      return;
    }
    final topNotificationModel = TopNotificationModel.fromJson(response);
    listNotifications = topNotificationModel.notofocations;
    update();
    print(listNotifications.length);
    update();
  }

  // var followUpPages = <FollowUsPagesModel>[];
  //
  // Future<void> getFollowUsPages() async {
  //   final response = await getRequest(ApiConst.getTopNotificationUrl);
  //   if (response.containsKey('error')) {
  //     print('Error: ${response['error']}');
  //     return;
  //   }
  //
  //   final followUsPagesModel = FollowUsPagesModel.fromJson(response);
  //   followUpPages.add(followUsPagesModel);
  //   print(followUpPages.length);
  //   update();
  // }


  var followUpPages = <FollowUsPagesModel>[];
  Future<List<FollowUsPagesModel>> getFollowUsPages() async {
    final response = await getRequest(ApiConst.getFollowUsPageUrl);
    if (response.containsKey('error')) {
      throw Exception('API Error: ${response['error']}');
    }
    // print('===============================================================');
    final followUpPagesJson = response['follow_up_pages'] as List<dynamic>;
    return followUpPagesJson.map((json) => FollowUsPagesModel.fromJson(json)).toList();
  }

  // Future<void> getFollowUsPages() async {
  //   final response = await getRequest(ApiConst.getFollowUsPageUrl);
  //   if (response.containsKey('error')) {
  //     print('Error: ${response['error']}');
  //     return;
  //   }
  //   final followUpPagesJson = response['follow_up_pages'] as List<dynamic>;
  //   followUpPages = followUpPagesJson.map((json) => FollowUsPagesModel.fromJson(json)).toList();
  //   // print('Follow up pages ${followUpPages[0].facebook}');
  //
  //   update();
  // }



  // Future<void> _getCurrentUser() async {
  //   final response = await getRequest(ApiConst.getUserUrl);
  //   if (response.containsKey('error')) {
  //     // Handle error
  //     print('Error: ${response['error']}');
  //   } else {
  //     final users = response['users'] as List<dynamic>;
  //     if (users.isNotEmpty) {
  //       final currentUser = UserDM.fromJson(users[0] as Map<String, dynamic>);
  //       print('User: ${currentUser.name}');
  //       user = currentUser;
  //       update();
  //     } else {
  //       print('Error: No users found in response');
  //     }
  //   }
  //   print('Response: $response');
  // }

  String greeting = '';
  void _setGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour < 12) {
      greeting = 'Good Morning';
    } else {
      greeting = 'Good Evening';
    }
  }



  ScrollController scrollController = ScrollController();
  Timer? timer;
  double scrollSpeed = 50.0;
  void _startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        scrollController.jumpTo(0.0);
      } else {
        scrollController.animateTo(
          scrollController.offset + scrollSpeed,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      }
    });
    update();
  }

  void stopTimer() {
    timer?.cancel();
  }

  @override
  void onInit() {
    _setGreeting();
    getCurrentUser();
    getTopNotification();
    getFollowUsPages();
    //Video
    // videoPlayerControllers =
    //     videoUrls.map((url) => VideoPlayerController.network(url)).toList();
    // chewieControllers = videoPlayerControllers
    //     .map((controller) => ChewieController(
    //   videoPlayerController: controller,
    //   autoPlay: false,
    //   looping: false,
    // ))
    //     .toList();
    // Future.wait(videoPlayerControllers
    //     .map((controller) => controller.initialize()));
    // //Video
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);

    _startTimer();
    update();
    super.onInit();
  }
  bool isScrolling = false;

  void _scrollListener() {
    if (scrollController.hasClients && !isScrolling) {
      isScrolling = true;
      _startTimer();
    } else if (!scrollController.hasClients && isScrolling) {
      isScrolling = false;
      stopTimer();
    }
  }
  @override
  void onClose() {
    stopTimer();
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }
  // @override
  // void dispose() {
  //   //Video
  //     videoPlayerControllers.forEach((controller) => controller.dispose());
  //     chewieControllers.forEach((chewieController) => chewieController.dispose());
  //   //Video
  //   stopTimer();
  //   super.dispose();
  // }

}
