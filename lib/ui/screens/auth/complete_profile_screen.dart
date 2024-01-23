import 'package:crafty_bay/ui/screens/main_bottom_nav_screen..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_logo.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

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
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 29),
                ),
                Text(
                  'A 4 Digit OTP Code has been Sent',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'First Name',
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Mobile',
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'City',
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Shipping Address',
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.offAll(const MainBottomNavScreen());
                  },
                  child: Text('Complete'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
