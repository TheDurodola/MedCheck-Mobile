import 'package:flutter/material.dart';
import 'package:medcheck/core/constants/app_colors.dart';
import 'package:medcheck/features/home/presentation/widgets/reports_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  final _verificationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _verificationController.dispose();
    super.dispose();
  }

  Future<void> _handleVerification() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() => _isLoading = false);

    // Show success/error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Verification code: ${_verificationController.text}'),
        backgroundColor: Colors.green.shade700,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }


  Widget _buildHomePage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),


              Hero(
                tag: 'app_logo',
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 200,
                  width: 200,
                ),
              ),

              const SizedBox(height: 60),

              Text(
                "Verify Pack or Tablet",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 8),

              // Subtitle
              Text(
                "Enter the verification code from your medication",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),

              const SizedBox(height: 40),

              // Verification Code Input
              TextFormField(
                controller: _verificationController,
                decoration: InputDecoration(
                  labelText: "Verification Code",
                  hintText: "MRX-123ER67ff901Ax2",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  prefixIcon: Icon(Icons.qr_code_scanner, color: AppColors.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a verification code";
                  }
                  if (value.length < 10) {
                    return "Verification code seems too short";
                  }
                  return null;
                },
                textCapitalization: TextCapitalization.characters,
              ),

              const SizedBox(height: 24),

              // Verify Button
              ElevatedButton(
                onPressed: _isLoading ? null : _handleVerification,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: _isLoading
                    ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
                    : const Text(
                  "Verify",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildProfilePage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_outline, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            "Profile",
            style: TextStyle(fontSize: 24, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            "Manage your account settings",
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
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
            _buildHomePage(),
            ReportsPage(),
            _buildProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        indicatorColor: AppColors.primary,
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