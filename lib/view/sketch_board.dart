import 'package:canvas_paint/view/gesture_handler/sketch_gestures.dart';
import 'package:canvas_paint/view/sketch_tools/colorizer/sketch_color_picker.dart';
import 'package:flutter/material.dart';

import 'sketch_tools/pen_strokes/sketch_stroke_picker.dart';
import 'sketch_tools/pen_strokes/sketch_stroke_sizes.dart';

class SketchBoard extends StatelessWidget {
  const SketchBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTools(),
        const Divider(),
        buildBoard(),
      ],
    );
  }

  Expanded buildBoard() {
    return const Expanded(child: SketchGesture());
  }

  Widget buildTools() {
    return Wrap(
      children: const [
        SketchColorPicker(),
        SketchStrokePicker(),
      ],
    );
  }
}
