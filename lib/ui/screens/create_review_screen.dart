import 'package:crafty_bay/presentation/state_holders/review_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key, required this.productId});

  final int productId;

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionTEC = TextEditingController();
  final TextEditingController _ratingTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _descriptionTEC,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Description';
                  }
                  return null;
                },
                maxLines: 5,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Description',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _ratingTEC,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Fill Rating Field';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Rating',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GetBuilder<ReviewListController>(
                builder: (reviewListController) {
                  if(reviewListController.inProgress){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  return ElevatedButton(
                      onPressed: (){
                        if (_formKey.currentState!.validate()) {
                          reviewListController.createReviewList(
                              description: _descriptionTEC.value.text,
                              productId: widget.productId,
                              rating: int.tryParse(_ratingTEC.value.text) ?? 0);

                          Get.back();
                          reviewListController.getReviewList(widget.productId);
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Success',
                            message: 'Add Comment Successfully',
                            duration: Duration(seconds: 2),
                          ));
                        }
                      },
                      child: const Text('Submit'));
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _descriptionTEC.dispose();
    _ratingTEC.dispose();
    super.dispose();
  }
}
