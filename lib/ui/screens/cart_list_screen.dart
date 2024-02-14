
import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/ui/screens/checkout_screen.dart';
import 'package:crafty_bay/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/cart/cart_product_item.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CartListController>().getCartList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.find<MainBottomNavController>().backToHome();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Cart'),
      ),
      body: GetBuilder<CartListController>(builder: (cartListController) {
        if (cartListController.inProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: cartListController.cartListModel.cartItemList?.length ?? 0,
                itemBuilder: (context, index) {
                  return  CartProductItem(cartItem: cartListController.cartListModel.cartItemList![index],);
                },
                separatorBuilder: (_, __) => const SizedBox(
                  height: 5,
                ),
              ),
            ),
            totalPriceAndCheckSection(cartListController.totalPrice),
          ],
        );
      },),
    );
  }

  Container totalPriceAndCheckSection(RxDouble totalPrice) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            direction: Axis.vertical,
            children: [
              const Text(
                'Total Price',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                ),
              ),
              Obx(() => Text(
                '৳$totalPrice',
                style: const TextStyle(fontSize: 20, color: AppColors.primaryColor),
              ),),

            ],
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                Get.to(()=> const CheckoutScreen());
              },
              child: const Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
