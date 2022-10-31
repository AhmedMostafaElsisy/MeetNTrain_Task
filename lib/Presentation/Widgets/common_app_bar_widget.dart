import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants/app_constants.dart';
import '../../Helpers/shared.dart';
import 'common_asset_image_widget.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool withBack;
  final bool withLogo;
  final bool centerTitle;
  final Widget? titleWidget;
  final Widget? logoWidget;
  final String? sourcePage;
  final Widget? leadingWidget;
  final bool canClick;
  final Function()? onTapFunction;

  const CommonAppBar({
    Key? key,
    this.withBack = true,
    this.titleWidget = const SizedBox(),
    this.withLogo = true,
    this.centerTitle = true,
    this.sourcePage = '',
    this.leadingWidget,
    this.logoWidget,
    this.canClick = true,
    this.onTapFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppConstants.lightWhiteColor,
      elevation: 0.0,
      centerTitle: centerTitle,
      automaticallyImplyLeading: withBack,

      /// arrow icon to back for previous screen
      /// also this widget is rotate in ar
      leading: withBack
          ? FittedBox(
              child: Row(
                children: [
                  InkWell(
                    onTap: onTapFunction ??
                        () {
                          if (canClick) {
                            Navigator.pop(context);
                          }
                        },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.pagePadding),
                        child: Container(
                          width: getWidgetHeight(40),
                          height: getWidgetHeight(40),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppConstants.lightWhiteColor,
                              border: Border.all(
                                  color: AppConstants.lightBlackColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.arrow_back,
                                size: 20,
                                color: AppConstants.lightBlackColor,
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            )
          : leadingWidget,
      title: titleWidget,
      actions: [
        if (withLogo)
          logoWidget ??
              commonAssetImageWidget(
                imageString: 'suez_logo.png',
                height: 30,
                width: 40,
                fit: BoxFit.contain,
                imageColor: AppConstants.mainColor,
              ),
        getSpaceWidth(20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
