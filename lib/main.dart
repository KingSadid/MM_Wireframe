import 'package:flutter/material.dart';
import 'src/core/theme/app_theme.dart';
import 'src/features/home/screens/home_screen.dart';

void main() {
  runApp(const SketchCloneApp());
}

class SketchCloneApp extends StatelessWidget {
  const SketchCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wireframe Clone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}