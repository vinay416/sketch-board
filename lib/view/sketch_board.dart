import 'package:canvas_paint/view/gesture_handler/sketch_gestures.dart';
import 'package:canvas_paint/view/sketch_tools/colorizer/sketch_color_picker.dart';
import 'package:flutter/material.dart';

import 'sketch_tools/pen_strokes/sketch_stroke_picker.dart';
import 'sketch_tools/shapes/sketch_shape_picker.dart';

class SketchBoard extends StatelessWidget {
  const SketchBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTools(),
        buildBoard(),
      ],
    );
  }

  Expanded buildBoard() {
    return const Expanded(child: SketchGesture());
  }

  Widget buildTools() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            children: [
              SketchColorPicker(),
              SketchStrokePicker(),
              SketchShapePicker()
            ],
          ),
        ),
      ),
    );
  }
}
