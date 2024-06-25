import 'package:canvas_paint/view/gesture_handler/sketch_gestures.dart';
import 'package:canvas_paint/view/sketch_tools/sketch_color_picker.dart';
import 'package:flutter/material.dart';
import '../model/sketch_paint_model.dart';
import '../utils/sketch_default.dart';

class SketchBoard extends StatelessWidget {
  const SketchBoard({
    super.key,
    this.boardColor = SketchDefault.boardColor,
    this.penColor = SketchDefault.penColor,
    this.stroke = SketchDefault.stroke,
    this.strokeSize = SketchDefault.strokeSize,
  });
  final Color boardColor;
  final Color penColor;
  final PaintingStyle stroke;
  final double strokeSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTools(context),
        const Divider(),
        Expanded(
          child: SketchGesture(
            paintModel: SketchPaintModel.empty(
              penColor: penColor,
              stroke: stroke,
              strokeSize: strokeSize,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTools(BuildContext context) {
    return Wrap(
      children: [
        SketchColorPicker.colorizer(context),
      ],
    );
  }
}
