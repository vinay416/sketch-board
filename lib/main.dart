import 'package:canvas_paint/src/sketch_board.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Sktech Board"),
        ),
        body: const SketchBoard(),
      ),
    );
  }
}
