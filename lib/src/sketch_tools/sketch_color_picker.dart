import 'package:flutter/material.dart';

class SketchColorPicker extends StatelessWidget {
  const SketchColorPicker({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SketchColorPicker();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
