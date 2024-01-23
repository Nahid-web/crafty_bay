import 'package:flutter/material.dart';
import '../utility/assets_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.height, this.width});
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsPath.logoPng, height: height, width: width ?? 120,);
  }
}
