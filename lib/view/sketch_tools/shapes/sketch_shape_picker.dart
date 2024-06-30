import 'package:canvas_paint/model/sketch_paint_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/sketch_view_model.dart';
import '../../shapes_painter/sketch_shape_painter.dart';
import 'sketch_shapes.dart';

class SketchShapePicker extends StatelessWidget {
  const SketchShapePicker({super.key});

  @override
  Widget build(BuildContext context) {
   final sketch = context.read<SketchViewModel>().sketchs.last;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const SketchShapes(),
        );
      },
      child: Selector<SketchViewModel, SketchPaintType>(
        selector: (p0, p1) => p1.currentShape,
        builder: (context, currentShape, child) {

          return Padding(
            padding: const EdgeInsets.only(top: 8),
            child: RepaintBoundary(
              child: CustomPaint(
                painter: SketchShapePainter(
                 color: sketch.penColor,
                 type: currentShape,
                ),
                size: const Size(25, 25),
              ),
            ),
          );
        },
      ),
    );
  }
}
