import 'package:flutter/material.dart';

import '../Screens/Schedule_screen/schedule_screen.dart';
import 'route_names.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.schedulePageRoute:
        return MaterialPageRoute(builder: (_) => const ScheduleScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: SafeArea(child: Text('presentation.Route Error'))));
    }
  }
}
