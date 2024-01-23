
import 'package:crafty_bay/ui/screens/main_bottom_nav_screen..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_card_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.categoryName });
  final String? categoryName;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.offAll(()=> const MainBottomNavScreen());
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          widget.categoryName ?? 'Product',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: 50,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.6,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,

          ),
          itemBuilder: (context, index) {
            return const ProductCardItem();
          },),
      ),
    );
  }
}
