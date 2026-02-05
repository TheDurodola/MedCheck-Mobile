import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcheck/core/constants/app_colors.dart';
import 'package:medcheck/core/constants/app_fonts.dart';
import 'package:medcheck/features/auth/presentation/bloc/auth_state.dart';
import 'package:medcheck/features/auth/presentation/widgets/username_field.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../widgets/password_field.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Hero(
                  tag: 'app_logo',
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 180,
                  ),
                ),
                const SizedBox(height: 24),

                Text(
                  "Account Successfully Created.",
                  style: TextStyle(
                    fontFamily: AppFonts.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 50,),
                Text(
                  "Kindly, sign in with your credentials",
                  style: TextStyle(
                    fontFamily: AppFonts.primary,
                    fontSize: 25,

                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/signin");
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),





                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}