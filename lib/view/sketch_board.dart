import 'package:canvas_paint/view/gesture_handler/sketch_gestures.dart';
import 'package:canvas_paint/view/sketch_tools/sketch_color_picker.dart';
import 'package:flutter/material.dart';

import 'sketch_tools/sketch_stroke_sizes.dart';

class SketchBoard extends StatelessWidget {
  const SketchBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTools(context),
        const Divider(),
        buildBoard(),
      ],
    );
  }

  Expanded buildBoard() {
    return const Expanded(child: SketchGesture());
  }

  Widget buildTools(BuildContext context) {
    return Wrap(
      children: [
        SketchColorPicker.colorizer(context),
        SketchStrokeSizes.pen(context),
      ],
    );
  }
}
