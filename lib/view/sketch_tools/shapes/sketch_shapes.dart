import 'package:canvas_paint/view/shapes_painter/sketch_shape_painter.dart';
import 'package:canvas_paint/view_model/sketch_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/sketch_paint_type.dart';

class SketchShapes extends StatefulWidget {
  const SketchShapes({super.key});

  @override
  State<SketchShapes> createState() => _SketchShapesState();
}

class _SketchShapesState extends State<SketchShapes> {
  late SketchViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = context.read<SketchViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Wrap(
        spacing: 50,
        runSpacing: 50,
        children: vm.strokeShapes.map(shapeWidget).toList(),
      ),
    );
  }

  Widget shapeWidget(SketchPaintType shape) {
    return GestureDetector(
      onTap: () {
        vm.updateSketchShape(shape);
        Navigator.pop(context);
      },
      child: Selector<SketchViewModel, SketchPaintType>(
        selector: (p0, p1) => p1.currentShape,
        builder: (context, currentShape, child) {
          final isSelected = currentShape == shape;
          final color = vm.sketchs.last.penColor;
          return CustomPaint(
            painter: SketchShapePainter(
              color: isSelected ? color : Colors.grey,
              type: shape,
            ),
            child: const SizedBox(
              height: 50,
              width: 50,
            ),
          );
        },
      ),
    );
  }
}
