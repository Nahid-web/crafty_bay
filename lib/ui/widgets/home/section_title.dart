import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key, required this.title, required this.seeAllOnTap,
  });

  final String title;
  final VoidCallback seeAllOnTap;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        TextButton(
          onPressed: seeAllOnTap,
          child: const Text('See All'),
        ),
      ],
    );
  }
}