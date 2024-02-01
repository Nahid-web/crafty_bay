import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/ui/screens/auth/verify_email_screen.dart';
import 'package:crafty_bay/ui/screens/main_bottom_nav_screen..dart';
import 'package:crafty_bay/ui/utility/assets_path.dart';
import 'package:crafty_bay/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void moveToNextScreen() async{
    await Future.delayed(const Duration(seconds: 2));

    final bool isLoggedIn = await Get.find<AuthController>().isLoggedIn();
    if(isLoggedIn){
      Get.offAll(()=> const MainBottomNavScreen());
    }
    else{
      Get.offAll(()=> const VerifyEmailScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            AppLogo(),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(height: 20,),
            const Text('Version 1.0'),
            const SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
