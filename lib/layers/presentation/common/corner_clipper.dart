import 'package:flutter/material.dart';

enum Corner { topLeft, topRight, bottomLeft, bottomRight }

class CornerClipper extends CustomClipper<Path> {
  final double borderRadius;
  final Set<Corner> roundedCorners;

  CornerClipper({
    required this.borderRadius,
    required this.roundedCorners,
  });

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(
        roundedCorners.contains(Corner.topLeft) ? borderRadius : 0,
        0,
      )
      ..lineTo(
        size.width -
            (roundedCorners.contains(Corner.topRight) ? borderRadius : 0),
        0,
      );

    if (roundedCorners.contains(Corner.topRight)) {
      path.arcToPoint(
        Offset(size.width, borderRadius),
        radius: Radius.circular(borderRadius),
        clockwise: true,
      );
    }

    path.lineTo(
      size.width,
      size.height -
          (roundedCorners.contains(Corner.bottomRight) ? borderRadius : 0),
    );

    if (roundedCorners.contains(Corner.bottomRight)) {
      path.arcToPoint(
        Offset(size.width - borderRadius, size.height),
        radius: Radius.circular(borderRadius),
        clockwise: true,
      );
    }

    path.lineTo(
      roundedCorners.contains(Corner.bottomLeft) ? borderRadius : 0,
      size.height,
    );

    if (roundedCorners.contains(Corner.bottomLeft)) {
      path.arcToPoint(
        Offset(0, size.height - borderRadius),
        radius: Radius.circular(borderRadius),
        clockwise: true,
      );
    }

    path.lineTo(0, roundedCorners.contains(Corner.topLeft) ? borderRadius : 0);

    if (roundedCorners.contains(Corner.topLeft)) {
      path.arcToPoint(
        Offset(borderRadius, 0),
        radius: Radius.circular(borderRadius),
        clockwise: true,
      );
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
