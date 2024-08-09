import 'package:canvas_paint/view_model/sketch_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UndoSketchTool extends StatelessWidget {
  const UndoSketchTool({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SketchViewModel, bool>(
      selector: (p0, p1) => p1.undoAvailable,
      builder: (context, undoAvailable, child) {
        return IconButton(
          onPressed: undoAvailable
              ? () {
                  context.read<SketchViewModel>().onTapUndo();
                }
              : null,
          icon: Icon(
            Icons.undo_rounded,
            color: undoAvailable ? Colors.blue : Colors.grey,
          ),
        );
      },
    );
  }
}
