import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) => _buildCategoryCard()),
    );
  }

  Widget _buildCategoryCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 70,
      decoration: BoxDecoration(
        color: AppTheme.hatchedCardColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[400]!),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 28,
            child: Container(
              width: 100,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          )
        ],
      ),
    );
  }
}