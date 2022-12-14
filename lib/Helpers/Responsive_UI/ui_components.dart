import 'package:flutter/material.dart';

import 'device_info.dart';
import 'get_device_type.dart';

class InfoComponents extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceInfo deviceInfo) builder;

  const InfoComponents({Key? key, required this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        var mediaQueryData = MediaQuery.of(context);
        var deviceInfo = DeviceInfo(
            orientation: mediaQueryData.orientation,
            deviceType: getDeviceType(mediaQueryData),
            screenWidth: mediaQueryData.size.width,
            screenHeight: mediaQueryData.size.height,
            widgetHeight: constrains.maxHeight,
            widgetWidth: constrains.maxWidth);

        return builder(context, deviceInfo);
      },
    );
  }
}
