import 'package:flutter/material.dart';
import 'package:meet_n_train_task/Constants/app_constants.dart';
import 'package:meet_n_train_task/Data/Models/tag_model.dart';
import 'package:meet_n_train_task/Presentation/Widgets/common_cached_image_widget.dart';

import '../../../Helpers/shared.dart';
import '../../Widgets/common_title_text.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {Key? key,
      required this.imagePath,
      required this.tag,
      required this.spots})
      : super(key: key);
  final String imagePath;
  final TagModel tag;
  final int spots;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.75;
    double height = MediaQuery.of(context).size.height * 0.21;
    return Stack(
      children: [
        ///event image
        commonCachedImageWidget(context,
            'https://ik.imagekit.io/tnc8pizf9e/$imagePath?tr=w-$width,h-$height',
            width: 500,
            height: 170,
            fit: BoxFit.cover,
            radius: AppConstants.containerBorderRadius),

        ///event tag ( image and title)
        Positioned(
          top: 12,
          left: 12,
          child: Container(
            height: 28,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppConstants.lightWhiteColor.withOpacity(0.8)),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                      color: AppConstants.lightWhiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: commonCachedImageWidget(context,
                        'https://ik.imagekit.io/tnc8pizf9e/${tag.icon}?tr=w-22,h-22',
                        width: 22,
                        height: 22,
                        fit: BoxFit.cover,
                        radius: AppConstants.containerBorderRadius),
                  ),
                  getSpaceWidth(4),
                  CommonTitleText(
                    textKey: tag.title,
                    textFontSize: AppConstants.smallFontSize,
                    textColor: AppConstants.lightBlackColor,
                  )
                ],
              ),
            ),
          ),
        ),

        ///event spots
        Positioned(
            bottom: 10,
            left: 12,
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppConstants.lightWhiteColor.withOpacity(0.8)),
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: spots == 0
                      ? const Center(
                          child: CommonTitleText(
                            textKey: 'UnLimited spots',
                            textColor: AppConstants.primaryColor,
                            textFontSize: AppConstants.xSmallFontSize,
                            textWeight: FontWeight.w400,
                          ),
                        )
                      : Center(
                          child: CommonTitleText(
                            textKey: '$spots Spots left',
                            textColor: AppConstants.primaryColor,
                            textFontSize: AppConstants.xSmallFontSize,
                            textWeight: FontWeight.w400,
                          ),
                        )),
            ))
      ],
    );
  }
}
