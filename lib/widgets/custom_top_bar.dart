import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 100,
          height: 14,
          decoration: BoxDecoration(
            color: AppTheme.scribbleDark,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Row(
          children: [
            _buildCircleIcon(Icons.pause),
            const SizedBox(width: 8),
            _buildCircleIcon(Icons.circle_outlined),
            const SizedBox(width: 8),
            _buildCircleIcon(Icons.account_circle_outlined),
          ],
        ),
      ],
    );
  }

  Widget _buildCircleIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[600]!, width: 1.5),
      ),
      child: Icon(icon, size: 20, color: Colors.grey[700]),
    );
  }
}
