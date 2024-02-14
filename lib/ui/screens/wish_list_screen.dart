import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/presentation/state_holders/wish_list_controller.dart';
import 'package:crafty_bay/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presentation/state_holders/main_bottom_nav_controller.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({super.key});

  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<WishListController>().getWishList();
    });
    super.initState();
  }
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
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            'Wish List',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<WishListController>(
            builder: (wishListController) {
              if(wishListController.inProgress && wishListController.wishListModel.wishList == null){
                return const Center(child: CircularProgressIndicator(),);
              }
              return GridView.builder(
                itemCount: wishListController.wishListModel.wishList!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 20,
                  crossAxisSpacing: 10,

                ),
                itemBuilder: (context, index){
                  final ProductModel productModel = wishListController.wishListModel.wishList![index].product!;
                    return ProductCardItem(
                        product: productModel );
                },);
            }
          ),
        ),
      ),
    );
  }
}
