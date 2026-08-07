import 'package:flutter/material.dart';

class InvalidVerificationCode extends StatelessWidget {
  const InvalidVerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'app_logo',
              child: Image.asset("assets/images/logo.png", height: 150),
            ),
            const SizedBox(height: 32),
            const Text(
              "Invalid Verification Code",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "The code you entered was never generated from our systems so it was flagged as invalid.\n\nYou can report the retail store where you bought the item to receive a token.",

              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/report");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: const Text(
                "Report Retailer",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),

            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/home");
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
