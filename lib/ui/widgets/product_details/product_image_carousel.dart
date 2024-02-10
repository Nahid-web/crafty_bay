import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utility/app_colors.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({super.key, required this.urls});
  final List<String> urls;

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
          items: widget.urls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(url),
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for(int i=0; i<widget.urls.length; i++)
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
