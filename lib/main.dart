import 'package:flutter/material.dart';
import 'widgets/custom_card.dart';

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

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const List<Widget> _widgetOptions = <Widget>[
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCard(
          title: 'Título de la Tarjeta',
          subtitle: 'Este es un subtítulo descriptivo para la tarjeta personalizada en la pantalla de inicio.',
        ),
      ],
    ),
    Text('Índice 1: Negocios', style: optionStyle),
    Text('Índice 2: Escuela', style: optionStyle),
  ];

  static const List<String> _appBarTitles = <String>[
    'Inicio',
    'Negocios',
    'Escuela',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _appBarTitles[_selectedIndex],
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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Negocios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Escuela',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
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