import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/category_item.dart';
import '../widgets/home/banner_carousel.dart';
import '../widgets/home/section_title.dart';
import '../widgets/product_card_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              searchTextField,
              const SizedBox(
                height: 10,
              ),
              const BannerCarousel(),
              SectionTitle(
                title: 'All Categories',
                seeAllOnTap: () {
                  Get.find<MainBottomNavController>().changedIndex(1);
                },
              ),
              categoryList,
              SectionTitle(title: 'Popular', seeAllOnTap: () {
                Get.to(()=> const ProductListScreen());
              }),
              productList,
              SectionTitle(title: 'Special', seeAllOnTap: (){}),
              productList,
              SectionTitle(title: 'New', seeAllOnTap: (){}),
              productList,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        // primary: false,
        // shrinkWrap: false,
        itemBuilder: (context, index) {
          return const CategoryItem();
        },
        separatorBuilder: (_, __) => const SizedBox(
          width: 20,
        ),
      ),
    );
  }

  SizedBox get productList {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        // primary: false,
        // shrinkWrap: false,
        itemBuilder: (context, index) {
          return const ProductCardItem();
        },
        separatorBuilder: (_, __) => const SizedBox(
          width: 20,
        ),
      ),
    );
  }

  TextFormField get searchTextField {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: const Icon(
          Icons.search_outlined,
          color: Colors.grey,
        ),
        hintText: 'Search',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: Image.asset(
        AssetsPath.logoNavPng,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person_outline,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.call_outlined,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notification_important_outlined,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}


