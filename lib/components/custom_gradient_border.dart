import 'dart:ui';

import 'package:flutter/material.dart';

class GradientBorderPainter extends CustomPainter {
  final double strokeWidth;
  final Gradient gradient;
  final double borderRadius;
  final List<double>? dashPattern;

  GradientBorderPainter({
    required this.strokeWidth,
    required this.gradient,
    required this.borderRadius,
    this.dashPattern,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    if (dashPattern != null && dashPattern!.isNotEmpty) {
      // Draw dashed border
      final path = Path()..addRRect(rrect);
      final dashPath = _dashPath(
        path,
        dashArray: dashPattern!,
      );
      canvas.drawPath(dashPath, paint);
    } else {
      // Draw solid border
      canvas.drawRRect(rrect, paint);
    }
  }

  Path _dashPath(
    Path path, {
    required List<double> dashArray,
  }) {
    final PathMetrics pathMetrics = path.computeMetrics();
    final Path dest = Path();

    for (final PathMetric pathMetric in pathMetrics) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final double len = dashArray[distance % dashArray.length < 1 ? 0 : 1];
        dest.addPath(
          pathMetric.extractPath(distance, distance + len),
          Offset.zero,
        );
        distance += len;
        
        // Add gap
        if (distance < pathMetric.length) {
          final double gapLen = dashArray[(distance % dashArray.length < 1 ? 0 : 1) + 1] ?? dashArray[0];
          distance += gapLen;
        }
      }
    }

    return dest;
  }

  @override
  bool shouldRepaint(covariant GradientBorderPainter oldDelegate) {
    return strokeWidth != oldDelegate.strokeWidth ||
        gradient != oldDelegate.gradient ||
        borderRadius != oldDelegate.borderRadius ||
        dashPattern != oldDelegate.dashPattern;
  }
}

class GradientBorderBox extends StatelessWidget {
  final Widget child;
  final double borderWidth;
  final Gradient gradient;
  final double borderRadius;
  final List<double>? dashPattern;

  const GradientBorderBox({
    super.key,
    required this.child,
    this.borderWidth = 1.0,
    required this.gradient,
    this.borderRadius = 8.0,
    this.dashPattern,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GradientBorderPainter(
        strokeWidth: borderWidth,
        gradient: gradient,
        borderRadius: borderRadius,
        dashPattern: dashPattern,
      ),
      child: child,
    );
  }
}