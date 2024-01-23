import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utility/app_colors.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({super.key});

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 250,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlay: false,
              onPageChanged: (index, reason){
                _currentIndex.value = index;
              }
          ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    color: Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('text $i', style: const TextStyle(fontSize: 16.0),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for(int i=0; i<5; i++)
                              ValueListenableBuilder(
                                  valueListenable: _currentIndex,
                                  builder: (context, index, _) {
                                    return Container(
                                      height: 15,
                                      width: 15,
                                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                      decoration: BoxDecoration(
                                          color: i == index ? AppColors.primaryColor : Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              color: i == index ? AppColors.primaryColor : Colors.grey.shade400 )
                                      ),
                                    );
                                  }
                              ),
                          ],
                        )
                      ],
                    )
                );
              },
            );
          }).toList(),
        ),

      ],
    );
  }
}
