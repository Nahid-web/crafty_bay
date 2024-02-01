
import 'package:crafty_bay/presentation/state_holders/category_controller.dart';
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
        body: RefreshIndicator(
          onRefresh: () async{
            Get.find<CategoryController>().getCategoryList();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GetBuilder<CategoryController>(
              builder: (categoryController) {
                return Visibility(
                  visible: categoryController.inProgress == false,
                  replacement: const Center(child: CircularProgressIndicator()),
                  child: GridView.builder(
                    itemCount: categoryController.categoryListModel.categoryList?.length ?? 0,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 20

                      ),
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          categoryListItem: categoryController.categoryListModel.categoryList![index],
                        );
                      },),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
