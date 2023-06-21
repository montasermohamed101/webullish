// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../model/alert_model/model.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/dino_data.dart';
import '../../widgets/my_text.dart';


class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  // AlertScreen({Key? key, this.userame}) : super(key: key);
  //
  // String? userame;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: MyText(text:'Swing Alerts',color: AppColors.ancientColor,
          fontWeight: FontWeight.bold,
          size: 22,
        ),
        centerTitle: true,
        // leading: IconButton(
        //   icon: Image.asset('assets/images/back_arrow.png'),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child:ListView.builder(
                controller: scrollController,
                itemExtent: 100,
                shrinkWrap: true,
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                itemCount: dinoDataList.length,
                itemBuilder: ((context, index) {
                  return ItemList(dinoData: dinoDataList[index]);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
