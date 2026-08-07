import 'package:flutter/material.dart';
import 'package:medcheck/core/constants/app_colors.dart';
import 'package:medcheck/features/home/presentation/widgets/home_widget.dart';
import 'package:medcheck/features/home/presentation/widgets/profile_widget.dart';
import 'package:medcheck/features/home/presentation/widgets/reports_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentPage == 0
              ? "MedCheck"
              : currentPage == 1
              ? "Reports"
              : "Profile",
          style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.login, color: AppColors.primary),
            onPressed: () {
              Navigator.pushNamed(context, "/signin");
            },
          ),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: currentPage,
          children: [
            HomeWidget(),
            ReportsPage( ),
            ProfileWidget(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        indicatorColor: AppColors.secondary,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: Colors.grey[600]),
            label: "Home",
            selectedIcon: Icon(Icons.home, color: AppColors.primary),
          ),
          NavigationDestination(
            icon: Icon(Icons.article_outlined, color: Colors.grey[600]),
            label: "Reports",
            selectedIcon: Icon(Icons.article, color: AppColors.primary),
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline, color: Colors.grey[600]),
            label: "Profile",
            selectedIcon: Icon(Icons.person, color: AppColors.primary),
          ),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}