import 'package:flutter/material.dart';

class DividerLabel extends StatelessWidget {
  final String label;
  final double dividerWidth;
  final Color dividerColor;

  const DividerLabel({
    Key? key,
    required this.label,
    this.dividerWidth = 84.0,
    this.dividerColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: dividerWidth,
          child: Divider(color: dividerColor, thickness: 0.7),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        SizedBox(
          width: dividerWidth,
          child: Divider(color: dividerColor, thickness: 0.7),
        ),
      ],
    );
  }
}
