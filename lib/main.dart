import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Constants/app_theme.dart';
import 'Data/Remote_Data/Network/Dio_Exception_Handling/dio_helper.dart';
import 'Helpers/Observers/bloc_observer.dart';
import 'Helpers/Responsive_UI/ui_components.dart';
import 'Helpers/shared_texts.dart';
import 'Presentation/Routes/route_generator.dart';
import 'Presentation/Screens/Schedule_screen/schedule_screen.dart';
import 'multi_bloc_provider_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    DioHelper.init();
  }

  @override
  Widget build(BuildContext context) {
    return const MultiBlocProvidersPage(
      body: HomeMaterialApp(),
    );
  }
}

class HomeMaterialApp extends StatelessWidget {
  const HomeMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      title: 'MeetNTrain Task',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      /// widget that calculate width and height and type
      home: InfoComponents(
        builder: (infoComponentsContext, deviceInfo) {
          SharedText.screenHeight = deviceInfo.screenHeight;
          SharedText.screenWidth = deviceInfo.screenWidth;
          SharedText.deviceType = deviceInfo;

          return const ScheduleScreen();
        },
      ),
    );
  }
}
