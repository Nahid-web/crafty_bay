import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../data/models/banner_item.dart';
import '../../utility/app_colors.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key, required this.bannerList});

  final List<BannerItem> bannerList;

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
              height: 180,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                _currentIndex.value = index;
              }),
          items: widget.bannerList.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        // image: DecorationImage(
                        //   image: NetworkImage(banner.image ?? ''),
                        //   alignment: Alignment.centerLeft,
                        //   scale: 1.2
                        // )
                      ),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(16),
                      child: Image.network(banner.image ?? ''),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            banner.title ?? '',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(110, 30),
                                backgroundColor: Colors.white,
                                foregroundColor: AppColors.primaryColor),
                            child: const Text(
                              'Buy Now',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.bannerList.length; i++)
              ValueListenableBuilder(
                  valueListenable: _currentIndex,
                  builder: (context, index, _) {
                    return Container(
                      height: 10,
                      width: 10,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      decoration: BoxDecoration(
                          color: i == index
                              ? AppColors.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: i == index
                                  ? AppColors.primaryColor
                                  : Colors.grey.shade400)),
                    );
                  }),
          ],
        )
      ],
    );
  }
}
