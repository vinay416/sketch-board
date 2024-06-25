import 'package:flutter/material.dart';

import '../model/sketch_paint_model.dart';

class SketchBoard extends StatelessWidget {
  const SketchBoard({
    super.key,
    this.boardColor = Colors.white,
    this.penColor = Colors.black,
    this.fillStroke = false,
    this.strokeSize = 4.0,
  });
  final Color boardColor;
  final Color penColor;
  final bool fillStroke;
  final double strokeSize;

  @override
  Widget build(BuildContext context) {
    return SketchGesture(
      paintModel: SketchPaintModel(
        points: [],
        penColor: penColor,
        fillStroke: fillStroke,
        strokeSize: strokeSize,
      ),
    );
  }
}

class SketchGesture extends StatefulWidget {
  const SketchGesture({super.key, required this.paintModel});
  final SketchPaintModel paintModel;

  @override
  State<SketchGesture> createState() => _SketchGestureState();
}

class _SketchGestureState extends State<SketchGesture> {
  late SketchPaintModel paintModel;

  @override
  void initState() {
    paintModel = widget.paintModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        final rendreBox = context.findRenderObject() as RenderBox;
        final offset = rendreBox.globalToLocal(event.position);
        paintModel.points.add(offset);
        setState(() {});
      },
      onPointerMove: (event) {
        final rendreBox = context.findRenderObject() as RenderBox;
        final offset = rendreBox.globalToLocal(event.position);
        paintModel.points.add(offset);
        setState(() {});
      },
      onPointerUp: (event) {
        final rendreBox = context.findRenderObject() as RenderBox;
        final offset = rendreBox.globalToLocal(event.position);
        paintModel.points.add(offset);
      },
      child: RepaintBoundary(
        child: CustomPaint(
          painter: SketchPainter(
            paintModel: widget.paintModel,
          ),
          child: Container(
            // color: Colors.yellow,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}

class SketchPainter extends CustomPainter {
  const SketchPainter({required this.paintModel});
  final SketchPaintModel paintModel;

  @override
  void paint(Canvas canvas, Size size) {
    if (paintModel.points.isEmpty) return;

    final paint = Paint()
      // ..color = paintModel.penColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = paintModel.strokeSize
      ..style =
          paintModel.fillStroke ? PaintingStyle.fill : PaintingStyle.stroke;

    final path = Path();
    final p0 = paintModel.points.first;
    //move the point to 1st offset
    path.moveTo(p0.dx, p0.dy);
    //add the moving getsure points
    for (var i = 1; i < paintModel.points.length - 1; i++) {
      final p1 = paintModel.points[i];
      final p2 = paintModel.points[i + 1];

      final c1 = (p1.dx + p2.dx) / 2;
      final c2 = (p1.dy + p2.dy) / 2;
      path.quadraticBezierTo(c1, c2, p2.dx, p2.dy);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
