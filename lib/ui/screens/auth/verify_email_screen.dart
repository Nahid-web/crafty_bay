import 'package:crafty_bay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:crafty_bay/ui/screens/auth/verify_otp_screen.dart';
import 'package:crafty_bay/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailTEController = TextEditingController();
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
                    controller: _emailTEController,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter an Email';
                      }
                      return null ;
                    },
                    decoration: const InputDecoration(hintText: 'Email Address'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<SendEmailOtpController>(
                    builder: (controller) {
                      return Visibility(
                        visible: controller.inProgress == false,
                        replacement: const Center(child: CircularProgressIndicator(),),
                        child: ElevatedButton(onPressed: () async{
                          if(_formKey.currentState!.validate()){
                            final bool result = await controller.sendOtpToEmail(_emailTEController.text.trim());
                            if(result){
                              Get.to(()=>VerifyOtpScreen(email: _emailTEController.text.trim(),));
                            }
                            else {
                              Get.showSnackbar(GetSnackBar(
                                title: 'Send OTP Failed',
                                message: controller.errorMessage,
                                duration: const  Duration(seconds: 2),
                                isDismissible: true,
                              ));
                            }
                          }
                        }, child: const Text('Next')),
                      );
                    }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
