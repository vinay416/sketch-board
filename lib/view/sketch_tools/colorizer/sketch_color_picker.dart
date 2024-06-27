import 'package:canvas_paint/view_model/sketch_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sketch_colors_sheet.dart';

class SketchColorPicker extends StatelessWidget {
  const SketchColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const SketchColorsSheet(),
        );
      },
      child: iconButton(),
    );
  }

  Widget iconButton() {
    return Selector<SketchViewModel, Color>(
      selector: (p0, p1) => p1.currentPenColor,
      builder: (context, currentPenColor, child) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: currentPenColor, width: 5),
            shape: BoxShape.circle,
          ),
          height: 50,
          width: 25,
        );
      },
    );
  }
}
