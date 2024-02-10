import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector(
      {super.key, required this.colors, required this.onChanged});

  final List<Color> colors;

  final Function(Color) onChanged;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.colors.first;
    widget.onChanged(_selectedColor);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.colors
          .map(
            (color) => InkWell(
              radius: 15,
              borderRadius: BorderRadius.circular(100),
              onTap: () {
                _selectedColor = color;
                widget.onChanged(color);
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: color,
                  child: _selectedColor == color
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
            ),
          )
          .toList(),

    );
  }
}
