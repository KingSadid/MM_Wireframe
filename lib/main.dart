import 'package:flutter/material.dart';

void main() {
  runApp(const AppBarClass());
}

class AppBarClass extends StatelessWidget {
  const AppBarClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Demostración de AppBar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'AppBar demo',
        onMenuPressed: () {
          debugPrint('Menú presionado');
        },
        onSearchPressed: () {
          debugPrint('Buscar presionado');
        },
        onProfilePressed: () {
          debugPrint('Perfil presionado');
        },
      ),
      body: const Center(
        child: Text('Contenido Principal'),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onProfilePressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onMenuPressed,
    this.onSearchPressed,
    this.onProfilePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2.0,
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        tooltip: 'Menú',
        onPressed: onMenuPressed,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          tooltip: 'Buscar',
          onPressed: onSearchPressed,
        ),
        IconButton(
          icon: const Icon(Icons.person_outline),
          tooltip: 'Perfil',
          onPressed: onProfilePressed,
        ),
        const SizedBox(width: 8.0),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}