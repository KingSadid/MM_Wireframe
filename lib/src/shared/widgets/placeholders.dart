import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class SectionHeaderPlaceholder extends StatelessWidget {
  final double width;
  const SectionHeaderPlaceholder({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 12,
      decoration: BoxDecoration(
        color: AppTheme.scribbleDark,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class TextLinePlaceholder extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;

  const TextLinePlaceholder({
    super.key,
    required this.width,
    this.height = 10,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? AppTheme.scribbleLight,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}