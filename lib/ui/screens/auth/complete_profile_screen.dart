import 'package:crafty_bay/data/models/create_profile_params.dart';
import 'package:crafty_bay/presentation/state_holders/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay/ui/screens/main_bottom_nav_screen..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_logo.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameTEC = TextEditingController();
  final TextEditingController _lastNameTEC = TextEditingController();
  final TextEditingController _mobileTEC = TextEditingController();
  final TextEditingController _cityTEC = TextEditingController();
  final TextEditingController _addressTEC = TextEditingController();

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
                    controller: _firstNameTEC,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter First Name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _lastNameTEC,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Last Name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Last Name',
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _mobileTEC,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an Email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Mobile',
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _cityTEC,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an Email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
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
                    controller: _addressTEC,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an Email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Shipping Address',
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GetBuilder<CompleteProfileController>(builder: (controller) {
                    return Visibility(
                      visible: controller.inProgress == false,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          Get.offAll(const MainBottomNavScreen());
                          final createProfileParams = CreateProfileParams(
                            firstName: _firstNameTEC.text.trim(),
                            lastName: _lastNameTEC.text.trim(),
                            mobile: _mobileTEC.text.trim(),
                            city: _mobileTEC.text.trim(),
                            shippingAddress: _addressTEC.text.trim(),
                          );

                          final bool result = await controller.completeProfile(
                              Get.find<VerifyOtpController>().token,
                              createProfileParams);

                          if (result) {
                            Get.offAll(() => const MainBottomNavScreen());
                          } else {
                            Get.showSnackbar(
                              GetSnackBar(
                                title: 'Complete profile failed',
                                message: controller.errorMessage,
                                duration: const Duration(seconds: 2),
                                isDismissible: true,
                              ),
                            );
                          }
                        },
                        child: const Text('Complete'),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
