import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/sketch_view_model.dart';
import 'sketch_stroke_sizes.dart';
import 'stroke_brush_icon.dart';

class SketchStrokePicker extends StatelessWidget {
  const SketchStrokePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const SketchStrokeSizes(),
        );
      },
      child: Selector<SketchViewModel, double>(
        selector: (p0, p1) => p1.currentStrokeSize,
        builder: (context, currentStrokeSize, child) {
          return CustomPaint(
            painter: StrokeBrushIcon(
              strokeSize: currentStrokeSize,
            ),
            size: const Size(50, 30),
          );
        },
      ),
    );
  }
}
