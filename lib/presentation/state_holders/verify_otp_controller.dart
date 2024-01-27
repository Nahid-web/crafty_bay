import 'package:crafty_bay/data/models/response_data.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/presentation/state_holders/read_profile_data_controller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class VerifyOtpController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  String _token = '';
  String get token => _token;
  bool _shouldNavigateCompleteProfile = true;
  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  Future<bool> verifyOtp(String email, String otp) async{
    _inProgress = true;
    update();
    ResponseData response = await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _inProgress = false;
    if(response.isSuccess){
      _token = response.responseBody['data'];
      await Future.delayed(const Duration(seconds: 3));
      final result = await Get.find<ReadProfileDataController>().readProfileData(token);
      if(result){
        _shouldNavigateCompleteProfile = Get.find<ReadProfileDataController>().isProfileCompleted == false;
      }
      else {
        _errorMessage = Get.find<ReadProfileDataController>().errorMessage;
        update();
        return false;
      }
      update();
      return true;
    }
    else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
    
  }
}