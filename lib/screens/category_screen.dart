import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/product.dart';
import 'category_detail_screen.dart';
import '../models/category.dart' as cat;

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {


  
  final List<cat.Category> categories = [
    cat.Category(id: 1, name: "Electronics", icon: "📱", color: "#10B981"),
    cat.Category(id: 2, name: "Fashion", icon: "👕", color: "#8B5CF6"),
    cat.Category(id: 3, name: "Home & Garden", icon: "🏠", color: "#F59E0B"),
    cat.Category(id: 4, name: "Sports & Fitness", icon: "⚽", color: "#EF4444"),
    cat.Category(id: 5, name: "Beauty & Care", icon: "💄", color: "#EC4899"),
    cat.Category(id: 6, name: "Books & Media", icon: "📚", color: "#3B82F6"),
    cat.Category(id: 7, name: "Automotive", icon: "🚗", color: "#059669"),
    cat.Category(id: 8, name: "Baby & Kids", icon: "🍼", color: "#F97316"),
    cat.Category(id: 9, name: "Grocery", icon: "🛒", color: "#84CC16"),
    cat.Category(id: 10, name: "Health", icon: "⚕️", color: "#06B6D4"),
  ];

  Color _parseCategoryColor(String hexColor) {
    try {
      return Color(int.parse(hexColor.replaceFirst('#', '0xFF')));
    } catch (e) {
      return AppTheme.accentColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: AppTheme.primaryDark,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              final categoryColor = _parseCategoryColor(category.color);
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CategoryDetailScreen(category: category),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: categoryColor.withOpacity(0.3),
                      width: 1.5,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        categoryColor.withOpacity(0.08),
                        categoryColor.withOpacity(0.02),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: categoryColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Center(
                          child: Text(
                            category.icon,
                            style: const TextStyle(fontSize: 28),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        category.name,
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
