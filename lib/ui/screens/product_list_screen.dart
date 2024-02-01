
import 'package:crafty_bay/presentation/state_holders/product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/ui/screens/home_screen.dart';
import 'package:crafty_bay/ui/screens/main_bottom_nav_screen..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_card_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.categoryName, this.categoryId });
  final String? categoryName;
  final int? categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    if(widget.categoryId != null){
      Get.find<ProductController>().getProductList(widget.categoryId!);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          widget.categoryName ?? 'Product',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<ProductController>(
          builder: (productController) {
            return Visibility(
              visible: productController.inProgress == false,
              replacement:const  Center(child: CircularProgressIndicator()),
              child: Visibility(
                visible: productController.productListModel.productList!.isNotEmpty,
                replacement: const Center(child: Text('No Product'),),
                child: GridView.builder(
                  itemCount: productController.productListModel.productList?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,

                  ),
                  itemBuilder: (context, index) {
                    return ProductCardItem(
                      product: productController.productListModel.productList![index],
                    );
                  },),
              ),
            );
          }
        ),
      ),
    );
  }
}
