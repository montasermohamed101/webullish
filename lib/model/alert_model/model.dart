import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/dino_data.dart';
import '../../view/pages/alert/detailbage.dart';

class ItemList extends StatelessWidget {
  final DinoData dinoData;

  const ItemList({super.key, required this.dinoData});

  get name => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: 150,
      child: GestureDetector(
        onTap: (() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                dinoData: dinoData,
              ),
            ),
          );
        }),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 3,
              child: Image(
                image: AssetImage(dinoData.dinoImage!),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                margin:
                    const EdgeInsets.only(bottom: 4, right: 4, left: 4, top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        dinoData.name!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Expanded(
                      child: Text(
                        dinoData.description!,
                        overflow: TextOverflow.visible,
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.grayColor),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
