import 'package:canvas_paint/view_model/sketch_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RedoSketchTool extends StatelessWidget {
  const RedoSketchTool({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SketchViewModel, bool>(
      selector: (p0, p1) => p1.redoAvailable,
      builder: (context, redoAvailable, child) {
        return IconButton(
          onPressed: redoAvailable
              ? () {
                  context.read<SketchViewModel>().onTapRedo();
                }
              : null,
          icon: Icon(
            Icons.redo_rounded,
            color: redoAvailable ? Colors.blue : Colors.grey,
          ),
        );
      },
    );
  }
}
