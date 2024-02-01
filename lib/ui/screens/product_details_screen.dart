import 'package:crafty_bay/ui/screens/home_screen.dart';
import 'package:crafty_bay/ui/screens/main_bottom_nav_screen..dart';
import 'package:crafty_bay/ui/widgets/product_details/product_image_carousel.dart';
import 'package:crafty_bay/ui/widgets/product_details/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../utility/app_colors.dart';
import '../widgets/product_details/color_selector.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> noOfItem = ValueNotifier(1);
  List<Color> productColorList = [
    Colors.black,
    AppColors.primaryColor,
    Colors.blueGrey,
    Colors.yellow,
    Colors.grey,
  ];
  List<String> productSizeList = [
    'S',
    'M',
    'X',
    'XL',
    '2XL',
    '3XL',
  ];
  Color? _selectedColor;
  String _selectedSize = 'X';

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Get.find<MainBottomNavController>().backToHome();
            // Get.offAll(()=>const MainBottomNavScreen());
            Get.back();

          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          const ProductImageCarousel(),
          productDetailsBody,
          priceAddToCart,
        ],
      ),
    );
  }

  Expanded get productDetailsBody {
    return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 200,
                      child: Text(
                        'Happy New Year Special Deal Save 30%',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
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
                      },
                    ),
                  ],
                ),
                reviewAndRatingRow,
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Colors',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                ColorSelector(
                  colors: productColorList,
                  onChanged: (color) => _selectedColor = color,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Size',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                SizeSelector(
                    sizes: productSizeList,
                    onChange: (size) {
                      _selectedSize = size;
                    }),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'This product is very nice, well qualit . Our top piority is comfort'
                  'dudabal meterial use to make this product This product is very nice, w'
                  'ell qualit . Our top piority is comfort'
                  'dudabal meterial use to make this product ',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                )
              ],
            ),
          ),
        );
  }

  Row get reviewAndRatingRow {
    return Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 25,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Text(
                      '4.8',
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Reviews',
                      style: TextStyle(
                          fontSize: 15, color: AppColors.primaryColor),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.primaryColor,
                        ),
                        child: const Icon(
                          Icons.favorite_outline,
                          size: 20,
                          color: Colors.white54,
                        )),
                  ],
                );
  }

  Container get priceAddToCart {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Wrap(
            direction: Axis.vertical,
            children: [
              Text(
                'Price',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                ),
              ),
              Text(
                '\$1000',
                style: TextStyle(fontSize: 20, color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Add To Cart',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
