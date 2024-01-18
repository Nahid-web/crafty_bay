import 'package:crafty_bay/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/ui/utility/app_colors.dart';
import 'package:crafty_bay/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
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
                  'A 4 Digit OTP Code has been Sent',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 20,
                ),
                PinCodeTextField(
                  length: 4,
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
                ElevatedButton(
                  onPressed: () {
                    Get.to(const CompleteProfileScreen());
                  },
                  child: const Text('Next'),
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
    );
  }
}
