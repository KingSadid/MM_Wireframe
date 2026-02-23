import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

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
          _buildNavItem(index: 0),
          _buildNavItem(index: 1),
          _buildNavItem(index: 2),
          _buildNavItem(index: 3),
        ],
      ),
    );
  }

  Widget _buildNavItem({required int index}) {
    final bool isActive = index == selectedIndex;

    return GestureDetector(
      onTap: () => onItemTapped(index), // Detecta el toque
      behavior: HitTestBehavior.opaque, // Aumenta el área de toque
      child: Container(
        // Añadimos un padding invisible para facilitar el click con el dedo
        padding: const EdgeInsets.all(10), 
        child: isActive ? _buildActiveIcon() : _buildInactiveIcon(),
      ),
    );
  }

  Widget _buildInactiveIcon() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[400],
      ),
    );
  }

  Widget _buildActiveIcon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.scribbleDark, // Color oscuro cuando está activo
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 20,
          height: 3,
          color: Colors.black, // La línea de subrayado
        )
      ],
    );
  }
}