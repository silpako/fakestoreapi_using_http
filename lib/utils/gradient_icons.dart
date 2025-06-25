import 'package:fakestoreapi_using_http/utils/app_colors.dart';
import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const GradientIcon(this.icon, {this.size = 24.0, super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback:
          (bounds) => const LinearGradient(
            colors: [Color.fromARGB(255, 237, 215, 15), Color(0xFF00C853)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(Rect.fromLTWH(0, 0, size, size)),
      child: Icon(icon, size: size, color: AppColors.white),
    );
  }
}
