import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:webullish/model/users/user_model.dart';
import 'package:webullish/utils/app_colors.dart';
import 'package:webullish/view/pages/auth/login_screen.dart';
import 'package:webullish/view/widgets/home_widgets/color_container.dart';
import 'package:webullish/view/widgets/my_text.dart';

import '../../../api/class/handling_data_view.dart';
import '../../../controller/home/home_controller.dart';
import '../../../model/follow_us_model/follow_us_model.dart';
import '../../../model/magazine_model/magazine_model.dart';
import '../../../api/services/api.dart';
import '../../widgets/home_widgets/analytics_container.dart';
import '../../widgets/home_widgets/team_container.dart';

class HomeScreen extends StatelessWidget {


  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // controller.startTimer();
    // controller.fetchMagazine();
    // print(controller.magazineModel!.name);
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => Scaffold(
          key: controller.scaffoldKey,
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                MyText(
                  text: '${controller.greeting}',
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w500,
                  size: 17,
                ),
                controller.currentUser.name == null ? Center(child: CircularProgressIndicator()):  MyText(
                  text: ' : ${controller.currentUser.name?? ""}',
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w500,
                  size: 17,
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () async{
                    // SharedPreferences prefs = await SharedPreferences.getInstance();
                    // prefs.clear();
                    // Get.offAll( LoginScreen());
                     controller.showBottomSheet(context);
                  },
                  icon: Icon(
                    Icons.settings_outlined,
                    color: AppColors.ancientColor,
                  )),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  color: AppColors.blue,
                  child:ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    controller: controller.scrollController,
                    itemCount: controller.listNotifications.length,
                    itemBuilder: (context, index) {
                      final notification = controller.listNotifications[index];
                      return controller.listNotifications.isEmpty ? Center(child: Text('Loading')): Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            MyText(
                              text: '${notification.name}',
                              color: AppColors.whiteColor,
                              size: 17,
                            ),
                            MyText(
                              text: ' ${notification.description}',
                              color: AppColors.whiteColor,
                              size: 17,
                            ),
                            Image.asset(
                              'assets/images/logo2.png',
                              color: AppColors.ancientColor,
                              height: 30,
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0),
                  child: MyText(
                    text: 'Daily ads',
                    color: AppColors.ancientColor,
                    fontWeight: FontWeight.bold,
                    size: 22,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.chewieControllers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Chewie(
                          controller: controller.chewieControllers[index],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: 'Follow us on',
                        color: AppColors.ancientColor,
                        fontWeight: FontWeight.bold,
                        size: 22,
                        textAlign: TextAlign.start,
                      ),
                      MyText(
                        text: 'Find us on all social media platforms',
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w400,
                        size: 17,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),

                Container(
                  height: 120,
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child:  FutureBuilder<void>(
                    future: controller.getFollowUsPages(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While the data is loading, display a progress indicator.
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        // If an error occurred, display the error message.
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        // Data has been loaded successfully.
                        final followUpPages = snapshot.data as List<FollowUsPagesModel>;
                        final followUpPage = followUpPages.isNotEmpty ? followUpPages[0] : null;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.socialIcon.length,
                          itemBuilder: (context, index) {
                            final socialUrl = followUpPage?.getUrl(controller.socialName[index].toLowerCase()) ?? '';
                            return InkWell(
                              onTap: () async {
                                if (socialUrl.isNotEmpty) {
                                  await launch(socialUrl);
                                }
                              },
                              child: socialIcon(
                                color: controller.socialColor[index],
                                image: controller.socialIcon[index],
                                name: controller.socialName[index],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: 'Weekly Magazine',
                        color: AppColors.ancientColor,
                        fontWeight: FontWeight.bold,
                        size: 22,
                        textAlign: TextAlign.start,
                      ),
                      MyText(
                        text: 'Stay Bullish for the today ahead',
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w400,
                        size: 17,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                controller.magazineModel.isEmpty
                    ? CircularProgressIndicator()
                    : Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.magazineModel.length,
                    itemBuilder: (context, index) {
                      final Magazine magazine = controller.magazineModel[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          children: [
                            Image.network(
                              magazine.image == null
                                  ? 'https://img.freepik.com/free-photo/cloud-sky-twilight-times_74190-4017.jpg'
                                  : magazine.image,
                            ),
                            Positioned(
                              right: 10,
                              bottom: 10,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    MyText(
                                      text: '${magazine.name == null ? "" : magazine.name}',
                                      color: AppColors.ancientColor,
                                      size: 13,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    MyText(
                                      text: magazine.description,
                                      color: AppColors.whiteColor,
                                      size: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // controller.magazineModel.isEmpty? CircularProgressIndicator():   Container(
                //   height: 120,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: controller.magazineModel.length,
                //     itemBuilder: (context, index) {
                //       final Magazine magazine = controller.magazineModel[index];
                //       return ListTile(
                //         title: Text(magazine.name),
                //         subtitle: Text(magazine.title),
                //       );
                //     },
                //   ),
                // ),



                const SizedBox(height: 34),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: 'See our analytics',
                        color: AppColors.ancientColor,
                        fontWeight: FontWeight.bold,
                        size: 22,
                        textAlign: TextAlign.start,
                      ),
                      MyText(
                        text: 'Stay Bullish for the today ahead',
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w400,
                        size: 17,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 22),
                //   height: 250,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 10,
                //     itemBuilder: (context, index) => AnalyticsContainer(
                //         image:
                //             'https://cdn.britannica.com/32/93932-050-B213E0FB/ocean-water-beach-The-Bahamas-Grand-Bahama.jpg',
                //         title: 'name......ect',
                //         description: 'description......ect'),
                //   ),
                // ),
                // const SizedBox(height: 28),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 44.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       MyText(
                //         text: 'Live training',
                //         color: AppColors.ancientColor,
                //         fontWeight: FontWeight.bold,
                //         size: 22,
                //         textAlign: TextAlign.start,
                //       ),
                //       MyText(
                //         text: 'Watch us closely and get all new',
                //         color: AppColors.whiteColor,
                //         fontWeight: FontWeight.w400,
                //         size: 17,
                //         textAlign: TextAlign.start,
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 21),
                // Container(
                //   width: 200,
                //   height: 100,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: controller.socialName.length,
                //     itemBuilder: (context, index) => Container(
                //       width: 250,
                //       decoration: const BoxDecoration(
                //           // color: AppColors.ancientColor,
                //           // borderRadius: BorderRadius.only(
                //           //   topRight:  Radius.circular(14),
                //           //   topLeft:  Radius.circular(14),
                //           // ),
                //           image: DecorationImage(
                //         image: AssetImage('assets/images/rectangle.png'),
                //       )),
                //       child: Stack(
                //         children: [
                //           // Positioned(child: Image.asset('assets/images/rectangle.png')),
                //           Positioned(
                //               left: -10,
                //               top: 17,
                //               child: Image.asset(
                //                 '${controller.socialIcon[index]}',
                //                 color: Colors.white,
                //                 width: 80,
                //                 height: 65,
                //               )),
                //           Center(
                //               child: MyText(
                //             text: 'Live ${controller.socialName[index]}',
                //             color: AppColors.whiteColor,
                //             fontWeight: FontWeight.bold,
                //             size: 17,
                //           ))
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 44.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       MyText(
                //         text: 'See our analytics',
                //         color: AppColors.ancientColor,
                //         fontWeight: FontWeight.bold,
                //         size: 22,
                //         textAlign: TextAlign.start,
                //       ),
                //       MyText(
                //         text: 'Stay Bullish for the today ahead',
                //         color: AppColors.whiteColor,
                //         fontWeight: FontWeight.w400,
                //         size: 17,
                //         textAlign: TextAlign.start,
                //       ),
                //     ],
                //   ),
                // ),
                // Container(
                //   height: 200,
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     scrollDirection: Axis.horizontal,
                //     itemCount: controller.chewieControllers.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Chewie(
                //           controller: controller.chewieControllers[index],
                //         ),
                //       );
                //     },
                //   ),
                // ),
                // const SizedBox(height: 25),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 44.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       MyText(
                //         text: 'Recent Achievements',
                //         color: AppColors.ancientColor,
                //         fontWeight: FontWeight.bold,
                //         size: 22,
                //         textAlign: TextAlign.start,
                //       ),
                //       MyText(
                //         text:
                //             'Despite the constant challenge in the stock market, we manage to pull off memorable achievements',
                //         color: AppColors.whiteColor,
                //         fontWeight: FontWeight.w400,
                //         size: 17,
                //         textAlign: TextAlign.start,
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 25),
                //
                // /// Recent Achievement
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 27),
                //   // width: 250,
                //   height: MediaQuery.of(context).size.height * .3,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 3,
                //     itemBuilder: (context, index) => Container(
                //       margin: EdgeInsets.all(10),
                //       width: 300,
                //       padding: EdgeInsets.symmetric(
                //           horizontal: 17, vertical: 24),
                //       decoration: BoxDecoration(
                //         color: AppColors.brownColor,
                //         border: Border.all(
                //           color: AppColors.ancientColor,
                //           width: 2,
                //         ),
                //         borderRadius:
                //             BorderRadius.all(Radius.circular(18)),
                //       ),
                //       child: ListView(
                //         // crossAxisAlignment: CrossAxisAlignment.stretch,
                //         children: [
                //           MyText(
                //             text:
                //                 'We did research, and wrote about CCIV( Now LCID) prior to the merger while trading at \$10.04. LCID traded over 400% profits shortly after.',
                //             color: AppColors.ancientColor,
                //             size: 17,
                //             fontWeight: FontWeight.w400,
                //             textAlign: TextAlign.start,
                //           ),
                //           MyText(
                //             text: 'november, 2022',
                //             color: AppColors.whiteColor,
                //             size: 17,
                //             fontWeight: FontWeight.w400,
                //             textAlign: TextAlign.end,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 32),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 44.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       MyText(
                //         text: 'Team & Advisors',
                //         color: AppColors.ancientColor,
                //         fontWeight: FontWeight.bold,
                //         size: 22,
                //         textAlign: TextAlign.start,
                //       ),
                //       MyText(
                //         text:
                //             'Our team of top tier technology and investment experts are ready to work day and night to create a welcoming atmosphere and expansive access to financial services, equity analysis and maximized personal potential.',
                //         color: AppColors.whiteColor,
                //         fontWeight: FontWeight.w400,
                //         size: 17,
                //         textAlign: TextAlign.start,
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 26),
                // Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 22),
                //   height: 200,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 10,
                //     itemBuilder: (context, index) => TeamContainer(
                //         image:
                //             'https://cdn.britannica.com/32/93932-050-B213E0FB/ocean-water-beach-The-Bahamas-Grand-Bahama.jpg',
                //         title: 'Hero',
                //         description: 'Founder & Stock Trader'),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 44.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //     children: [
                //       MyText(
                //         text: 'HOW ARE WE ?',
                //         color: AppColors.ancientColor,
                //         fontWeight: FontWeight.w700,
                //         size: 22,
                //         textAlign: TextAlign.start,
                //       ),
                //       const SizedBox(height: 35),
                //       MyText(
                //         text: 'webullish.com tap',
                //         color: AppColors.whiteColor,
                //         fontWeight: FontWeight.w700,
                //         size: 22,
                //         textAlign: TextAlign.start,
                //       ),
                //       const SizedBox(height: 35),
                //       MyText(
                //         text: 'who are we tap',
                //         color: AppColors.whiteColor,
                //         fontWeight: FontWeight.w700,
                //         size: 22,
                //         textAlign: TextAlign.start,
                //       ),
                //       const SizedBox(height: 62),
                //       MyText(
                //         text: 'Why webullish',
                //         color: AppColors.ancientColor,
                //         fontWeight: FontWeight.w700,
                //         size: 22,
                //         textAlign: TextAlign.start,
                //       ),
                //     ],
                //   ),
                // ),
                //
                // /// Why webullish
                // ColorContainer(
                //     title: 'Easy To Follow',
                //     description:
                //         'Our stock alerts are formatted in such a way that both new and experienced stock traders can greatly benefit from our research. Option traders also stand to benefit from our streamlined analyses.',
                //     color: AppColors.blueBrownColor),
                // const SizedBox(height: 34),
                // ColorContainer(
                //     title: 'Reliability',
                //     description:
                //         'Prior to releasing any information, each alert is verified for authenticity by our group of experts, ensuring that no information is too hastily published and can be trusted without a shadow of a doubt.',
                //     color: AppColors.blueBrownColor),
              ],
            ),
          ),
        ),

    );
  }

  Widget socialIcon(
      {required String image, required Color color, required String name}) {
    return SizedBox(
      height: 150,
      width: 120,
      child: Stack(
        children: [
          Positioned(
            top: 4,
            left: 5,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 45,
            ),
          ),
          Positioned(
            top: 25,
            left: 25,
            child: Image.asset(
              '$image',
              width: 50,
              height: 50,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/group.png',
              width: 100,
              // height: 90,
            ),
          ),
          Positioned(
            top: 100,
            left: 10,
            right: 30,
            // bottom: 0,
            child: MyText(
              text: name,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}

//https://www.fluttercampus.com/video.mp4

// class VideoListScreen extends StatefulWidget {
//   @override
//   _VideoListScreenState createState() => _VideoListScreenState();
// }
//
// class _VideoListScreenState extends State<VideoListScreen> {
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chewie Example'),
//       ),
//       body: GridView.count(
//         crossAxisCount: 2,
//         children: chewieControllers
//             .map((chewieController) => Chewie(
//           controller: chewieController,
//         ))
//             .toList(),
//       ),
//     );
//   }
// }
