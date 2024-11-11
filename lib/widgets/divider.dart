import 'package:flutter/material.dart';

class DividerLabel extends StatelessWidget {
  final String label;
  final double dividerWidth;
  final Color dividerColor;

  const DividerLabel({
    super.key,
    required this.label,
    this.dividerWidth = 96.0,
    this.dividerColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SizedBox(
          width: dividerWidth,
          child: Divider(color: dividerColor, thickness: 0.5),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),

        SizedBox(
          width: dividerWidth,
          child: Divider(color: dividerColor, thickness: 0.5),
        ),

      ],
    );
  }
}
