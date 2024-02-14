import 'package:crafty_bay/presentation/state_holders/review_list_controller.dart';
import 'package:crafty_bay/ui/screens/create_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<ReviewListController>().getReviewList(widget.productId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: GetBuilder<ReviewListController>(builder: (reviewListController) {
        if (reviewListController.inProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount:
                      reviewListController.reviewListModel.reviewList?.length ??
                          0,
                  itemBuilder: (context, index) {
                    final review =
                        reviewListController.reviewListModel.reviewList?[index];
                    return Card(
                      color: Colors.white,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        // leading: const Icon(Icons.person_outline),
                        title: Wrap(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey.shade300,
                              child: const Icon(
                                Icons.person_outline,
                                size: 12,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(review?.profile?.cusName ?? ''),
                          ],
                        ),
                        subtitle: Text(review?.description ?? ''),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reviews (${reviewListController.reviewListModel.reviewList?.length ?? 0})',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.to(() =>
                              CreateReviewScreen(productId: widget.productId));
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                        ),
                        icon: const Icon(
                          Icons.add,
                        ))
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
