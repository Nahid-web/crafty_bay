import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/ui/screens/main_bottom_nav_screen..dart';
import 'package:crafty_bay/ui/utility/app_colors.dart';
import 'package:crafty_bay/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});
  final String email;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const AppLogo(),
                  Text(
                    'Enter OTP Code',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 29),
                  ),
                  Text(
                    'A 6 Digit OTP Code has been Sent',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PinCodeTextField(
                    controller: _otpTEController,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter Otp';
                      }
                      return null ;
                    },
                    length: 6,
                    appContext: context,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      selectedColor: Colors.transparent,
                      selectedFillColor: AppColors.primaryColor,
                      activeFillColor: AppColors.primaryColor,
                      inactiveFillColor: Colors.transparent,
                      inactiveColor: AppColors.primaryColor,
                    ),
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    keyboardType: TextInputType.number,
                    textStyle: const TextStyle(color: Colors.white),
                    animationDuration: const Duration(milliseconds: 300),
                    // backgroundColor: Colors.blue.shade50,
                    enableActiveFill: true,
                    onCompleted: (v) {
                      print("Completed");
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder<VerifyOtpController>(
                    builder: (controller) {
                      return Visibility(
                        visible: controller.inProgress == false,
                        replacement: const Center(child: CircularProgressIndicator(),),
                        child: ElevatedButton(
                          onPressed: () async{
                            if(_formKey.currentState!.validate()){
                              final bool response = await controller.verifyOtp(widget.email, _otpTEController.text);
                              if(response){
                                if(controller.shouldNavigateCompleteProfile) {
                                  Get.to(()=> const CompleteProfileScreen());
                                }
                                else {
                                  Get.offAll(()=> const MainBottomNavScreen());
                                }
                              }
                              else {
                                Get.showSnackbar(GetSnackBar(
                                  title: 'Verify  OTP Failed',
                                  message: controller.errorMessage,
                                  duration: const  Duration(seconds: 2),
                                  isDismissible: true,
                                ));
                              }
                            }
                          },
                          child: const Text('Next'),
                        ),
                      );
                    }
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'This code will expire in ',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      TextSpan(
                          text: '120s',
                          style: TextStyle(color: AppColors.primaryColor)),
                    ]),
                  ),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey,
                      ),
                      child: const Text('Resend Code')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
