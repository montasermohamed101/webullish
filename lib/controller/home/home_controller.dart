import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:webullish/view/pages/edit_delete/edit_profile.dart';

import '../../utils/app_colors.dart';
import '../../view/pages/edit_delete/delete_account.dart';
import '../../view/widgets/my_text.dart';

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











  final List<String> newsItems = [
    'Breaking News: Flutter app reaches 1 million downloads!',
    'New feature added to the app. Check it out now!',
    'Upcoming event: Flutter conference on June 15th.',
    'Special offer: Get 50% off on all premium features.',
  ];
  final ScrollController scrollController = ScrollController();
  Timer? timer;
  double scrollSpeed = 30.0;
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

  void stopTimer() {
    timer?.cancel();
  }

  @override
  void onInit() {
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
