
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value){
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Get.find<MainBottomNavController>().backToHome();
            },
            style: IconButton.styleFrom(
              backgroundColor: Colors.transparent
            ),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            'Categories',

          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            itemCount: 50,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                childAspectRatio: 0.8,
                mainAxisSpacing: 20

              ),
              itemBuilder: (context, index) {
                return const CategoryItem();
              },),
        ),
      ),
    );
  }
}
