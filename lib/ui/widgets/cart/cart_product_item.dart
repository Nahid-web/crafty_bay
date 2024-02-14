import 'package:crafty_bay/data/models/cart_item.dart';
import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../utility/app_colors.dart';
import '../../utility/assets_path.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  late ValueNotifier<int> noOfItem = ValueNotifier(widget.cartItem.quantity);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              child: Image.network(
                widget.cartItem.product?.image ?? '',
                width: 100,
                height: 130,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text(
                            widget.cartItem.product?.title ?? '',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Text(
                            'Color: ${widget.cartItem.color}, Size: ${widget.cartItem.size} ',
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      GetBuilder<CartListController>(
                        builder: (cartListController) {
                          return IconButton(
                            onPressed: () async{
                              cartListController.deleteCartListItem(widget.cartItem.productId!);
                              await Future.delayed(const Duration(seconds: 1));
                              cartListController.getCartList();
                            },
                            icon: const Icon(Icons.delete_outline),
                          );
                        }
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '৳${widget.cartItem.product?.price}' ?? '',
                        style: const TextStyle(
                            fontSize: 17,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 110,
                      ),
                      ValueListenableBuilder(
                          valueListenable: noOfItem,
                          builder: (context, value, _) {
                            return ItemCount(
                              initialValue: noOfItem.value,
                              minValue: 1,
                              maxValue: 10,
                              decimalPlaces: 0,
                              color: AppColors.primaryColor,
                              buttonSizeHeight: 30,
                              buttonSizeWidth: 30,
                              textStyle: const TextStyle(
                                fontSize: 30,
                              ),
                              onChanged: (v) {
                                noOfItem.value = v.toInt();
                                Get.find<CartListController>().updateQuantity(
                                    widget.cartItem.id!, noOfItem.value);
                              },
                            );
                          }),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
