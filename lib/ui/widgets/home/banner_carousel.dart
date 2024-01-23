import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utility/app_colors.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 150,
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
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(int i=0; i<5; i++)
              ValueListenableBuilder(
                  valueListenable: _currentIndex,
                  builder: (context, index, _) {
                    return Container(
                      height: 10,
                      width: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      decoration: BoxDecoration(
                          color: i == index ? AppColors.primaryColor : Colors.transparent,
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
    );
  }
}
