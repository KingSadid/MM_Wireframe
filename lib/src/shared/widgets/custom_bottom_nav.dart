import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        border: Border(top: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(isActive: false),
          _buildActiveNavItem(), // Active state mocked
          _buildNavItem(isActive: false),
          _buildNavItem(isActive: false),
        ],
      ),
    );
  }

  Widget _buildNavItem({required bool isActive}) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[400],
      ),
    );
  }

  Widget _buildActiveNavItem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.scribbleDark,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 20,
          height: 3,
          color: Colors.black,
        )
      ],
    );
  }
}