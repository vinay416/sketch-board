import 'package:canvas_paint/view/gesture_handler/sketch_gestures.dart';
import 'package:canvas_paint/view/sketch_tools/colorizer/sketch_color_picker.dart';
import 'package:flutter/material.dart';

import 'sketch_tools/clear_sketch/clear_all_sketch_tool.dart';
import 'sketch_tools/clear_sketch/redo_sketch_tool.dart';
import 'sketch_tools/clear_sketch/undo_sketch_tool.dart';
import 'sketch_tools/pen_strokes/sketch_stroke_picker.dart';
import 'sketch_tools/shapes/sketch_shape_picker.dart';

class SketchBoard extends StatelessWidget {
  const SketchBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final landscape = orientation == Orientation.landscape;
        if (landscape) {
          return Row(
            children: [
              buildBoard(context, landscape),
              buildToolsCard(landscape),
            ],
          );
        }

        return Column(
          children: [
            buildToolsCard(landscape),
            Divider(height: 1),
            buildBoard(context, landscape),
          ],
        );
      },
    );
  }

  Widget buildBoard(BuildContext context, bool landscape) {
    return Expanded(
      child: ClipRect(
        child: SizedBox(
          height: landscape
              ? double.infinity
              : MediaQuery.of(context).size.height - 140,
          width: landscape
              ? MediaQuery.of(context).size.width - 115
              : double.infinity,
          child: SketchGesture(),
        ),
      ),
    );
  }

  Widget buildToolsCard(bool landscape) {
    return Padding(
      padding: const EdgeInsets.all(8.0).copyWith(bottom: 15),
      child: Material(
        elevation: 10,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: landscape
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: buildTools(landscape),
              )
            : Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 20,
                children: buildTools(landscape),
              ),
      ),
    );
  }
}

List<Widget> buildTools(bool landscape) {
  return [
    Wrap(
      children: const [
        UndoSketchTool(),
        RedoSketchTool(),
      ],
    ),
    buildSeparator(landscape),
    SketchColorPicker(),
    SketchStrokePicker(),
    SketchShapePicker(),
    if (landscape) SizedBox(height: 10),
    buildSeparator(landscape),
    ClearSketchTool(),
  ];
}

Widget buildSeparator(bool landscape) {
  return Container(
    height: landscape ? 2 : 40,
    width: landscape ? 80 : 2,
    decoration: BoxDecoration(
      color: Colors.grey.shade400,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
