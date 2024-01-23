import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../utility/app_colors.dart';
import '../../utility/assets_path.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({super.key});

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  ValueNotifier<int> noOfItem = ValueNotifier(1);

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
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    bottomLeft: const Radius.circular(10)),
                child: Image.asset(
                  AssetsPath.dummyShoesJpeg,
                  width: 100,
                  height: 130,
                  fit: BoxFit.fill,
                )),
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
                            'New Year Special shoe',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Text(
                            'Color: Red, Size: x ',
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      const Icon(Icons.delete_outline),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '\$100',
                        style: TextStyle(
                            fontSize: 17,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 140,
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