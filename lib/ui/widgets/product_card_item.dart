import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';


class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key,
    required this.product
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=>ProductDetailsScreen(productID: product.id,));
      },
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: 140,
        child: Card(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  product.image ?? '',
                  height: 100,
                  width: 110,
                  fit: BoxFit.scaleDown,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product.title ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        product.price ?? '',
                        style: const TextStyle(
                            fontSize: 13, color: AppColors.primaryColor),
                      ),
                     Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.amber,
                          ),
                          Text(
                            product.star.toString() ,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black54),
                          ),
                        ],
                      ),
                      Container(
                          height: 20,
                          width: 20,
                          color: AppColors.primaryColor,
                          child: const Icon(
                            Icons.favorite_outline,
                            size: 18,
                            color: Colors.white54,
                          ),),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}