import 'package:crafty_bay/data/models/category_list_item.dart';
import 'package:crafty_bay/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
     required this.categoryListItem,
  });

  final CategoryListItem categoryListItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>ProductListScreen(
          categoryName: categoryListItem.categoryName ?? '',
        categoryId: categoryListItem.id,),);
      },
      child: Column(
        children: [
          Card(
            color: AppColors.primaryColor.withOpacity(0.1),
            elevation: 0,
            child: Padding(
              padding:  const EdgeInsets.all(10),
              child: Image.network(categoryListItem.categoryImg ?? '', height: 60, width: 60,),
            ),
          ),
          const SizedBox(height: 10,),
          Text(categoryListItem.categoryName ?? '', style: const TextStyle(color: AppColors.primaryColor),),
        ],
      ),
    );
  }
}