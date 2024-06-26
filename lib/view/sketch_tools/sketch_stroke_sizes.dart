import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../view_model/sketch_view_model.dart';

class SketchStrokeSizes extends StatelessWidget {
  const SketchStrokeSizes._();

  static Widget pen(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const SketchStrokeSizes._(),
        );
      },
      icon: Selector<SketchViewModel, Tuple2<double, Color>>(
        selector: (p0, p1) => Tuple2(p1.currentStrokeSize, p1.currentPenColor),
        builder: (context, tuple, child) {
          final double currentStrokeSize = tuple.item1;
          final Color currentPenColor = tuple.item2;
          return Icon(
            Icons.brush,
            color: currentPenColor,
            size: currentStrokeSize,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.brush);
  }
}
