import 'package:flutter/material.dart';

import '../../../../../common_widgets/clipper/clipper.dart';
import '../../../../../constants/colors.dart';

class LoginClipper extends StatelessWidget {
  const LoginClipper({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(size.width, 300),
          painter: RPSCustomPainter(color: hPrimaryColor.withOpacity(0.5)),
        ),
        Positioned(
          top: 16,
          right: -10,
          child: CustomPaint(
            size: Size(size.width, 300),
            painter: RPSCustomPainter(color: hPrimaryColor),
          ),
        ),
      ],
    );
  }
}
