import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/read_profile_data_controller.dart';
import 'package:crafty_bay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(SendEmailOtpController());
    Get.put(VerifyOtpController());
    Get.put(ReadProfileDataController());
  }
}