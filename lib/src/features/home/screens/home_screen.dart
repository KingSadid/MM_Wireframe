import 'package:flutter/material.dart';
import '../../../shared/widgets/custom_bottom_nav.dart';
import '../../../shared/widgets/placeholders.dart';
import '../widgets/category_list.dart';
import '../widgets/custom_top_bar.dart';
import '../widgets/featured_profile_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 10),
                    CustomTopBar(),
                    SizedBox(height: 30),
                    Center(
                      child: Text(
                        "Explore Categories", 
                        style: TextStyle(fontSize: 26, color: Color(0xFF555555))
                      )
                    ),
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
              ),
            ),
            const CustomBottomNavBar(),
          ],
        ),
      ),
    );
  }
}