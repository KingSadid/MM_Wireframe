import 'package:flutter/material.dart';
import '../../../shared/widgets/custom_bottom_nav.dart';
import '../../../shared/widgets/placeholders.dart';
import '../widgets/category_list.dart';
import '../widgets/custom_top_bar.dart';
import '../widgets/featured_profile_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 1. Variable para controlar el índice actual (por defecto 1 como en el diseño)
  int _selectedIndex = 1;

  // 2. Definimos las diferentes vistas para cada pestaña
  // La vista del índice 1 es la que ya construimos (Home)
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const _PlaceholderScreen(title: "Tab 0"),
      const _HomeContent(), // Nuestro diseño principal
      const _PlaceholderScreen(title: "Tab 2"),
      const _PlaceholderScreen(title: "Tab 3"),
    ];
  }

  // 3. Función para cambiar el estado
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // 4. Mostramos la página según el índice seleccionado
        child: Column(
          children: [
            Expanded(child: _pages[_selectedIndex]),
            
            // 5. Conectamos la barra de navegación
            CustomBottomNavBar(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
          ],
        ),
      ),
    );
  }
}

// --- Componentes Privados para organizar el código ---

// El contenido original del Home lo movimos aquí para limpiarlo
class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 10),
          CustomTopBar(),
          SizedBox(height: 30),
          Center(
              child: Text("Explore Categories",
                  style: TextStyle(fontSize: 26, color: Color(0xFF555555)))),
          SizedBox(height: 30),
          SectionHeaderPlaceholder(width: 120),
          SizedBox(height: 15),
          FeaturedProfileCard(),
          SizedBox(height: 30),
          SectionHeaderPlaceholder(width: 150),
          SizedBox(height: 15),
          CategoryList(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

// Pantalla simple para las pestañas vacías
class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.construction, size: 50, color: Colors.grey[400]),
          const SizedBox(height: 10),
          Text(title, style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
    );
  }
}