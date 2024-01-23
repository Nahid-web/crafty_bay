import 'package:crafty_bay/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';
import '../utility/assets_path.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=>const ProductDetailsScreen());
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
                child: Image.asset(
                  AssetsPath.dummyShoesJpeg,
                  height: 100,
                  width: 140,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'New Year Shoes 30',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        '\$100',
                        style: TextStyle(
                            fontSize: 13, color: AppColors.primaryColor),
                      ),
                     const Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                          Text(
                            '4.8',
                            style: TextStyle(
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
                          )),
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