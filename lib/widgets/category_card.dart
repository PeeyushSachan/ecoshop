import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback? onTap;

  const CategoryCard({Key? key, required this.category, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Parse hex color string to Color
    Color categoryColor = Colors.grey; // default fallback
    try {
      categoryColor = Color(int.parse(category.color.replaceFirst('#', '0xFF')));
    } catch (e) {
      print('Invalid color for ${category.name}: $e');
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: categoryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: categoryColor.withOpacity(0.2),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: categoryColor,
              child: Text(
                category.icon,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              category.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}