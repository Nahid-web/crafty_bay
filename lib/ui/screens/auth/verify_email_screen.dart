import 'package:crafty_bay/ui/screens/auth/verify_otp_screen.dart';
import 'package:crafty_bay/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

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
                const AppLogo(
                  height: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Please Enter Your Email Address',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Email Address'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {
                  Get.to(const VerifyOtpScreen());
                }, child: const Text('Next'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
