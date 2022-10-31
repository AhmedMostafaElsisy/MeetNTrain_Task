import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Constants/app_constants.dart';
import '../../Helpers/shared.dart';
import 'common_asset_image_widget.dart';

Widget commonCachedImageWidget(BuildContext context, String imageUrl,
    {double radius = 10.0,
    BoxFit fit = BoxFit.contain,
    double? height,
    double? width,
    bool? isProfileImage = false,
    bool? isCircular = false}) {
  double imageHeight = getWidgetHeight(height!);
  double imageWidth =
      isCircular! ? getWidgetHeight(height) : getWidgetWidth(width!);

  return CachedNetworkImage(
    imageUrl: imageUrl,
    imageBuilder: (context, imageProvider) => Container(
      height: imageHeight,
      width: imageWidth,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        image: DecorationImage(
          image: imageProvider,
          fit: fit,
        ),
      ),
    ),
    placeholder: (context, img) => Container(
      height: imageHeight,
      width: imageWidth,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        image: DecorationImage(
          image: const AssetImage("assets/images/loading.gif"),
          fit: fit,
        ),
      ),
    ),
    errorWidget: (context, url, error) => isProfileImage!
        ? commonAssetImageWidget(
            imageString: "avatar.png",
            height: imageHeight,
            width: imageWidth,
            radius: radius,
            fit: BoxFit.contain)
        : commonAssetImageWidget(
            imageString: 'pending.png',
            fit: BoxFit.contain,
            radius: radius,
            height: imageHeight,
            imageColor: AppConstants.mainColor,
            width: imageWidth,
          ),
  );
}
