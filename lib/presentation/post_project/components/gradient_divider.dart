import 'package:flutter/material.dart';

class PointedLinePainter extends CustomPainter {
  final double width;
  final BuildContext context;
  PointedLinePainter(this.width, this.context);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Theme.of(context).colorScheme.primary;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(width / 2, 2, width, 0);
    path.quadraticBezierTo(width / 2, -2, 0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}