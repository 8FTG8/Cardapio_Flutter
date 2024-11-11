// ignore_for_file: use_super_parameters
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({required this.child, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF478197),
                Color(0xFF1C343D),
                Color(0xFF172A31),
              ],
            ),
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}