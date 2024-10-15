import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final Color backgroundColor;
  final Color textColor;

  FoodCard({
    required this.image,
    required this.title,
    required this.price,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontFamily: 'InriaSerif'
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '\$$price',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontFamily: 'InriaSerif',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}