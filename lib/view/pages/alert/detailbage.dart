// ignore_for_file: deprecated_member_use

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:webullish/controller/home/home_controller.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/dino_data.dart';
import '../../widgets/my_text.dart';



class DetailPage extends StatelessWidget {
  final DinoData dinoData;
   DetailPage({super.key, required this.dinoData});

  var controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: MyText(text: dinoData.name!,color: AppColors.ancientColor,
          fontWeight: FontWeight.bold,
          size: 22,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset('assets/images/back_arrow.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Chewie(
                  controller: ChewieController(
                    videoPlayerController: VideoPlayerController.network(
                      dinoData.url!,
                    ),
                    autoPlay: false,
                    looping: false,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Information name:',
                    style: TextStyle(
                        color: AppColors.ancientColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Text(
                    dinoData.name!,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Description:',
                    style: TextStyle(
                        color: AppColors.ancientColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    dinoData.description!,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      //
      //
      //
      // CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       toolbarHeight: 80,
      //       pinned: true,
      //       bottom: PreferredSize(
      //         preferredSize: const Size.fromHeight(16),
      //         child: Container(
      //           width: double.maxFinite,
      //           padding: const EdgeInsets.only(top: 4, bottom: 8),
      //           decoration: const BoxDecoration(
      //             color: Color.fromARGB(255, 237, 249, 255),
      //             borderRadius: BorderRadius.only(
      //               topRight: Radius.circular(25),
      //               topLeft: Radius.circular(25),
      //             ),
      //           ),
      //           alignment: Alignment.center,
      //           child: Text(
      //             dinoData.name!,
      //             style: const TextStyle(
      //                 fontFamily: "Mali",
      //                 fontSize: 25,
      //                 color: Colors.black,
      //                 fontWeight: FontWeight.w700),
      //           ),
      //         ),
      //       ),
      //       backgroundColor: const Color.fromARGB(255, 64, 73, 105),
      //       expandedHeight: 230,
      //       flexibleSpace: FlexibleSpaceBar(
      //         background: Image.asset(
      //           dinoData.dinoImage!,
      //           width: double.maxFinite,
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //     ),
      //     SliverToBoxAdapter(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         children: [
      //           Container(
      //               margin: const EdgeInsets.only(left: 20, right: 20, top: 6),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     children: [
      //                       Container(
      //                         alignment: Alignment.topLeft,
      //                         width: 100,
      //                         child: const Text(
      //                           'CDC alert',
      //                           style: TextStyle(
      //                               fontFamily: 'Mali',
      //                               fontWeight: FontWeight.w600,
      //                               fontSize: 18,
      //                               color: Colors.black),
      //                         ),
      //                       ),
      //                       Container(
      //                         alignment: Alignment.topCenter,
      //                         width: 14,
      //                         child: const Text(
      //                           ':',
      //                           style: TextStyle(
      //                               fontFamily: 'Mali',
      //                               fontWeight: FontWeight.w600,
      //                               fontSize: 18,
      //                               color: Colors.black),
      //                         ),
      //                       ),
      //                       Expanded(
      //                         child: Container(
      //                           alignment: Alignment.topLeft,
      //                           child: Text(
      //                             dinoData.name!,
      //                             style: const TextStyle(
      //                                 fontFamily: 'Mali',
      //                                 fontWeight: FontWeight.w600,
      //                                 fontSize: 18,
      //                                 color: Colors.black),
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     children: [
      //                       Container(
      //                         alignment: Alignment.topLeft,
      //                         width: 100,
      //                         child: const Text(
      //                           'description',
      //                           style: TextStyle(
      //                               fontFamily: 'Mali',
      //                               fontWeight: FontWeight.w600,
      //                               fontSize: 18,
      //                               color: Colors.black),
      //                         ),
      //                       ),
      //                       Container(
      //                         alignment: Alignment.topCenter,
      //                         width: 14,
      //                         child: const Text(
      //                           ':',
      //                           style: TextStyle(
      //                               fontFamily: 'Mali',
      //                               fontWeight: FontWeight.w600,
      //                               fontSize: 18,
      //                               color: Colors.black),
      //                         ),
      //                       ),
      //                       Expanded(
      //                         child: Container(
      //                           alignment: Alignment.topLeft,
      //                           child: Text(
      //                             dinoData.description!,
      //                             style: const TextStyle(
      //                                 fontFamily: 'Mali',
      //                                 fontWeight: FontWeight.w600,
      //                                 fontSize: 18,
      //                                 color: Colors.black),
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     children: [
      //                       Container(
      //                         alignment: Alignment.topLeft,
      //                         width: 100,
      //                         child: const Text(
      //                           'time',
      //                           style: TextStyle(
      //                               fontFamily: 'Mali',
      //                               fontWeight: FontWeight.w600,
      //                               fontSize: 18,
      //                               color: Colors.black),
      //                         ),
      //                       ),
      //                       Container(
      //                         alignment: Alignment.topCenter,
      //                         width: 14,
      //                         child: const Text(
      //                           ':',
      //                           style: TextStyle(
      //                               fontFamily: 'Mali',
      //                               fontWeight: FontWeight.w600,
      //                               fontSize: 18,
      //                               color: Colors.black),
      //                         ),
      //                       ),
      //                       Expanded(
      //                         child: Container(
      //                           alignment: Alignment.topLeft,
      //                           child: Text(
      //                             dinoData.text!,
      //                             style: const TextStyle(
      //                                 fontFamily: 'Mali',
      //                                 fontWeight: FontWeight.w600,
      //                                 fontSize: 18,
      //                                 color: Colors.black),
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               )),
      //           Container(
      //             margin: const EdgeInsets.all(20),
      //             child: Text(
      //               dinoData.description!,
      //               style: const TextStyle(
      //                 fontFamily: "Mali",
      //                 fontSize: 15,
      //                 color: Colors.black,
      //               ),
      //             ),
      //           ),
      //           Container(
      //             margin: const EdgeInsets.symmetric(vertical: 5),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 GestureDetector(
      //                   onTap: () async {
      //                     var url = dinoData.url;
      //                     if (await canLaunch(url!)) {
      //                       await launch(url);
      //                     } else {
      //                       throw 'Could not launch $url';
      //                     }
      //                   },
      //                   child: Container(
      //                     alignment: Alignment.center,
      //                     margin: const EdgeInsets.only(right: 5),
      //                     padding: const EdgeInsets.only(left: 1, right: 16),
      //                     height: 38,
      //                     width: 210,
      //                     decoration: BoxDecoration(
      //                       color: const Color.fromARGB(255, 64, 73, 105),
      //                       borderRadius: BorderRadius.circular(50),
      //                       boxShadow: [
      //                         BoxShadow(
      //                             color: const Color.fromARGB(255, 64, 73, 105)
      //                                 .withOpacity(0.3),
      //                             blurRadius: 4,
      //                             spreadRadius: 1)
      //                       ],
      //                     ),
      //                     child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: const [
      //                         Icon(
      //                           Icons.play_circle_fill_rounded,
      //                           color: Colors.white,
      //                           size: 36,
      //                         ),
      //                         Text(
      //                           "Tonton Videonya",
      //                           style: TextStyle(
      //                               fontFamily: "Mali",
      //                               fontSize: 18,
      //                               fontWeight: FontWeight.w500,
      //                               color: Colors.white),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   width: 10,
      //                 ),
      //                 // Container(
      //                 //   width: 38,
      //                 //   height: 38,
      //                 //   decoration: const BoxDecoration(
      //                 //     color: Color.fromARGB(255, 237, 249, 255),
      //                 //     borderRadius: BorderRadius.all(Radius.circular(10)),
      //                 //     boxShadow: [
      //                 //       BoxShadow(
      //                 //           color: Color.fromARGB(255, 183, 199, 207),
      //                 //           offset: Offset(2, 2),
      //                 //           blurRadius: 4,
      //                 //           spreadRadius: 1),
      //                 //       BoxShadow(
      //                 //           color: Color.fromARGB(255, 255, 255, 255),
      //                 //           offset: Offset(-2, -2),
      //                 //           blurRadius: 4,
      //                 //           spreadRadius: 1)
      //                 //     ],
      //                 //   ),
      //                 //   child: FavoriteButton(
      //                 //     isFavorite: false,
      //                 //     iconSize: 36,
      //                 //     iconColor: const Color.fromARGB(255, 64, 73, 105),
      //                 //     iconDisabledColor: Color.fromARGB(255, 187, 187, 187),
      //                 //     valueChanged: (_isFavorite) {
      //                 //       print('Is Favorite $_isFavorite)');
      //                 //     },
      //                 //   ),
      //                 // ),
      //               ],
      //             ),
      //           ),
      //           const SizedBox(height: 20),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
