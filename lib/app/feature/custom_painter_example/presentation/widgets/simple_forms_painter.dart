import 'package:flutter/material.dart';

class SimpleFormsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas
      ..drawCircle(
        Offset(size.height, size.width),
        50,
        Paint()..color = Colors.red,
      )
      ..drawRect(
        Rect.fromPoints(const Offset(50, 50), const Offset(75, 75)),
        Paint()..color = Colors.green,
      )
      ..drawRect(
        Rect.fromCenter(center: Offset.zero, height: 50, width: 50),
        Paint()..color = Colors.blue,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
