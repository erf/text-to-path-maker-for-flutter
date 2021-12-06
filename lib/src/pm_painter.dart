import 'package:flutter/rendering.dart';

/**
* Text to Path Maker
* Copyright Ashraff Hathibelagal 2019
*/

/// A [CustomPainter] subclass that can be used to quickly render a character
/// and animate it.
class PMPainter extends CustomPainter {
  late Path path;

  Paint _paint = Paint()
    ..strokeWidth = 3
    ..color = Color.fromRGBO(0, 0, 0, 1.0)
    ..style = PaintingStyle.stroke;

  Paint indicator = Paint()
    ..style = PaintingStyle.fill
    ..color = Color.fromRGBO(255, 0, 0, 1.0);

  Offset? indicatorPosition;
  final double radius = 5.0;

  PMPainter(Path? path, {this.indicatorPosition}) {
    this.path = path ?? Path();
  }

  void setPaint(Paint p) {
    _paint = p;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(path, _paint);

    if (this.indicatorPosition != null) {
      canvas.drawCircle(indicatorPosition!, radius, indicator);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
