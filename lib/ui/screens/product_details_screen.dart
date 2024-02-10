import 'package:crafty_bay/data/models/product_details_data.dart';
import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/ui/screens/auth/verify_email_screen.dart';
import 'package:crafty_bay/ui/widgets/product_details/product_image_carousel.dart';
import 'package:crafty_bay/ui/widgets/product_details/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../utility/app_colors.dart';
import '../widgets/product_details/color_selector.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productID});

  final int? productID;

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
  String? _selectedColor;
  String? _selectedSize;

  @override
  void initState() {
    Get.find<ProductDetailsController>().getProductDetails(widget.productID!);
    super.initState();
  }

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
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
            if(productDetailsController.inProgress){
              return const Center(child: CircularProgressIndicator(),);
            }
        return Column(
          children: [
            ProductImageCarousel(
              urls: [
                productDetailsController.productDetails.img1 ?? '',
                productDetailsController.productDetails.img2 ?? '',
                productDetailsController.productDetails.img3 ?? '',
                productDetailsController.productDetails.img4 ?? '',
              ],
            ),
            productDetailsBody(productDetailsController.productDetails),
            priceAddToCart(productDetailsController.productDetails.product?.price ?? ''),
          ],
        );
      }),
    );
  }

  Expanded productDetailsBody(ProductDetailsData productDetails) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    productDetails.product?.title ?? '',
                    style: const TextStyle(
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
            reviewAndRatingRow(productDetails.product?.star ?? 0),
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
              colors: productDetails.color
                      ?.split(',')
                      .map((e) => getColorFromString(e))
                      .toList() ??
                  [],
              onChanged: (color) => _selectedColor = color.toString(),
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
                sizes: productDetails.size?.split(',') ?? [],
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
              productDetails.des ?? '',
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

  Row reviewAndRatingRow(double rating) {
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
        Text(
          rating.toStringAsPrecision(2),
          style: const TextStyle(fontSize: 15, color: Colors.black54),
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'Reviews',
          style: TextStyle(fontSize: 15, color: AppColors.primaryColor),
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

  Container priceAddToCart(String price) {
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
          Wrap(
            direction: Axis.vertical,
            children: [
              const Text(
                'Price',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                ),
              ),
              Text(
                price,
                style: const TextStyle(fontSize: 20, color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child:
                GetBuilder<AddToCartController>(builder: (addToCartController) {
              return Visibility(
                visible: addToCartController.inProgress == false,
                replacement: const Center(child: CircularProgressIndicator(),),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_selectedSize != null && _selectedColor != null) {
                      if (Get.find<AuthController>().isTokenNotNull) {
                        final hashCodeColor = colorToHashColorCode(_selectedColor!);
                        final response = await addToCartController.addToCart(
                            widget.productID!, 'Red', _selectedSize!);
                        if (response) {
                          Get.showSnackbar(
                            const GetSnackBar(
                              title: 'Success',
                              message: 'this product add to cart',duration: Duration(seconds: 2),
                            ),
                          );
                        }
                        else {
                          Get.showSnackbar(GetSnackBar(
                            title: 'Failed',
                            message: addToCartController.errorMessage,
                            duration: const Duration(seconds: 2),
                          ),);
                        }
                      } else {
                        Get.to(() => const VerifyEmailScreen());
                      }
                    } else {
                      Get.showSnackbar(
                        const GetSnackBar(
                          title: 'Failed at add to Card',
                          message: 'Please select color and size',
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Add To Cart',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  String colorToString(Color color) {
    if (color == Colors.red) {
      return 'Red';
    } else if (color == Colors.white) {
      return 'White';
    } else if (color == Colors.green) {
      return 'Green';
    }
    return 'Grey';
  }

  Color getColorFromString(String colorCode) {
    String code = colorCode.replaceAll('#', '');
    String hexCode = 'FF$code';
    return Color(int.parse('0x$hexCode'));
  }

  String colorToHashColorCode(String colorCode) {
    return colorCode
        .toString()
        .replaceAll('0xff', '#')
        .replaceAll('Color(', '')
        .replaceAll(')', '');
  }
}
