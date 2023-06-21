import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:webullish/constants/api_links.dart';
import 'package:webullish/model/users/user_model.dart';
import 'package:webullish/view/pages/edit_delete/edit_profile.dart';
import '../../services/api.dart';
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
  'linked',
];
final List<Color> socialColor = [
  AppColors.facebookBackground,
  AppColors.twitterBackground,
  AppColors.youtubeBackground,
  AppColors.instagramBackground,
  AppColors.linkedBackground,

];

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







  final List<String> newsItems = [
    'Breaking News: Flutter app reaches 1 million downloads!',
    'New feature added to the app. Check it out now!',
    'Upcoming event: Flutter conference on June 15th.',
    'Special offer: Get 50% off on all premium features.',
  ];
  final ScrollController scrollController = ScrollController();
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
  }

  String greeting = '';
  void stopTimer() {
    timer?.cancel();
  }
  void _setGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour < 12) {
      greeting = 'Good Morning';
    } else {
      greeting = 'Good Evening';
    }
  }
  @override
  void onInit() {
    _setGreeting();
    getCurrentUser();
    //Video
    videoPlayerControllers =
        videoUrls.map((url) => VideoPlayerController.network(url)).toList();
    chewieControllers = videoPlayerControllers
        .map((controller) => ChewieController(
      videoPlayerController: controller,
      autoPlay: false,
      looping: false,
    ))
        .toList();
    Future.wait(videoPlayerControllers
        .map((controller) => controller.initialize()));
    //Video
    update();
    _startTimer();
    super.onInit();
  }
  @override
  void onClose() {
    stopTimer();
    scrollController.dispose();
    super.onClose();
  }
  @override
  void dispose() {
    //Video
      videoPlayerControllers.forEach((controller) => controller.dispose());
      chewieControllers.forEach((chewieController) => chewieController.dispose());
    //Video
    stopTimer();
    scrollController.dispose();
    super.dispose();
  }
}
