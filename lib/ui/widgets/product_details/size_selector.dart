import 'package:flutter/material.dart';

import '../../utility/app_colors.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.sizes, required this.onChange});
  final List<String> sizes;
  final Function(String) onChange;
 
  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late String _selectedSize ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedSize = widget.sizes.first;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.sizes
          .map(
            (size) => InkWell(
          radius: 16,
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            _selectedSize = size;
            widget.onChange(size);
            setState(() {});
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            height: 30,
            width: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _selectedSize == size
                  ? AppColors.primaryColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(100),
              border: _selectedSize == size
                  ? null
                  : Border.all(color: Colors.grey, width: 2),
            ),
            child: Text(
              size,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ),
      )
          .toList(),
    );
  }
}
