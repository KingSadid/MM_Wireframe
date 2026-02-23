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
  int _selectedIndex = 1;

  final List<Widget> _pages = const [
    _PlaceholderScreen(title: "Tab 0"),
    _HomeContent(),
    _PlaceholderScreen(title: "Tab 2"),
    _PlaceholderScreen(title: "Tab 3"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _pages[_selectedIndex]),
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