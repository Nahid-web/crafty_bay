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

  final TextEditingController _cusNameTEC = TextEditingController();
  final TextEditingController _cusAddressTEC = TextEditingController();
  final TextEditingController _cusCityTEC = TextEditingController();
  final TextEditingController _cusStateTEC = TextEditingController();
  final TextEditingController _cusPostCodeTEC = TextEditingController();
  final TextEditingController _cusPhoneTEC = TextEditingController();
  final TextEditingController _shippingAddressTEC = TextEditingController();

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
                  // Text(
                  //   'Enter OTP Code',
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .titleLarge
                  //       ?.copyWith(fontSize: 29),
                  // ),
                  // Text(
                  //   'A 4 Digit OTP Code has been Sent',
                  //   style: Theme.of(context).textTheme.titleSmall,
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _cusNameTEC,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Customer Name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Customer Name',
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _cusAddressTEC,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Last Name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Customer Address',
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _cusCityTEC,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Your City';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Customer City',
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _cusStateTEC,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Your City';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Customer State',
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _cusPostCodeTEC,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your PostCode';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'PostCode',
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _cusPhoneTEC,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Phone Number';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Phone Number',
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _shippingAddressTEC,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your shipping Address';
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
                          Get.offAll(()=>const MainBottomNavScreen());
                          final createProfileParams = CreateProfileParams(
                              cusName: _cusNameTEC.text.trim(),
                              cusAdd: _cusAddressTEC.text.trim(),
                              cusCity: _cusCityTEC.text.trim(),
                              cusState: _cusCityTEC.text.trim(),
                              cusPostcode: _cusPostCodeTEC.text.trim(),
                              cusCountry: _cusStateTEC.text.trim(),
                              cusPhone: _cusPhoneTEC.text.trim(),
                              cusFax: _cusPhoneTEC.text.trim(),
                              shipName: _cusNameTEC.text.trim(),
                              shipAdd: _shippingAddressTEC.text.trim(),
                              shipCity: _cusCityTEC.text.trim(),
                              shipState: _cusStateTEC.text.trim(),
                              shipPostcode: _cusPostCodeTEC.text.trim(),
                              shipCountry: _cusCityTEC.text.trim(),
                              shipPhone: _cusPhoneTEC.text.trim(),
                          );

                          final bool result = await controller.completeProfile(
                              Get.find<VerifyOtpController>().token,
                              createProfileParams);

                          if (result) {
                            Get.showSnackbar(const GetSnackBar(
                              title: 'Success',
                              message: 'Complete Profile Success',
                              duration: Duration(seconds: 2),
                              isDismissible: true,
                            ));
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

  @override
  void dispose() {
    _cusNameTEC.dispose();
    _cusAddressTEC.dispose();
    _cusCityTEC.dispose();
    _cusPostCodeTEC.dispose();
    _cusPhoneTEC.dispose();
    _cusStateTEC.dispose();
    _shippingAddressTEC.dispose();
    super.dispose();
  }
}
