import 'package:crafty_bay/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>const ProductListScreen(categoryName: 'Electronics',));
      },
      child: Column(
        children: [
          Card(
            color: AppColors.primaryColor.withOpacity(0.1),
            elevation: 0,
            child: const Padding(
              padding:  EdgeInsets.all(20),
              child: Icon(
                Icons.tv_outlined, size: 35,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Text('Electronics', style: TextStyle(color: AppColors.primaryColor),),
        ],
      ),
    );
  }
}