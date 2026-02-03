import 'package:flutter/material.dart';
import 'package:medcheck/core/constants/api_constants.dart';
import 'package:medcheck/core/constants/app_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class InvalidRole extends StatefulWidget {
  const InvalidRole({super.key});

  @override
  State<StatefulWidget> createState() => _InvalidRoleState();
}

class _InvalidRoleState extends State<InvalidRole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'app_logo',
            child: Image.asset("assets/images/logo.png", height: 180),
          ),
          const SizedBox(height: 24),
          Text("Access Restricted.", textAlign: TextAlign.center),
          const SizedBox(height: 24),
          Text(
            """This app is for Consumers only. Please use our
             website to log in to your Partner or Admin account.""",
            style: TextStyle(fontSize: 34),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),

          ElevatedButton(
              onPressed: () {
              Navigator.pushReplacementNamed(context, "/signin");
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
            ),
              child: Text("Back to Sign In"),
          ),
        ],
      ),
    );
  }
}
