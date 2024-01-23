import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/cart/cart_product_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              // shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return const CartProductItem();
              },
              separatorBuilder: (_, __) => const SizedBox(
                height: 5,
              ),
            ),
          ),
          totalPriceAndCheckSection,
        ],
      ),
    );
  }

  Container get totalPriceAndCheckSection {
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
          const Wrap(
            direction: Axis.vertical,
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                ),
              ),
              Text(
                '\$100000',
                style: TextStyle(fontSize: 20, color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
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


