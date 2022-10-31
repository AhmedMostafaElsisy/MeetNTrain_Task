import '../Data/Models/user_base_model.dart';
import 'Responsive_UI/device_info.dart';

class SharedText {
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static UserModel? currentUser;

  static DeviceInfo? deviceType;

  static String currentLocale = 'en';
  static String userToken = '';
}
