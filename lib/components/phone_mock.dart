import 'package:flutter/material.dart';



class PhonePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.fill;

    // Phone body
    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(30),
    );
    canvas.drawRRect(rrect, paint);

    // Speaker notch (top center)
    final notchWidth = size.width * 0.25;
    final notchHeight = size.height * 0.02;
    final notchRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height * 0.03),
      width: notchWidth,
      height: notchHeight,
    );
    final notchPaint = Paint()..color = Colors.grey.shade400;
    canvas.drawRRect(
      RRect.fromRectAndRadius(notchRect, const Radius.circular(5)),
      notchPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
