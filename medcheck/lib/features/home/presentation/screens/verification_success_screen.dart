import 'package:flutter/material.dart';
import 'package:medcheck/features/home/domain/entities/pack_entity.dart';

class VerificationSuccessScreen extends StatelessWidget {
  final PackEntity packData;

  const VerificationSuccessScreen({super.key, required this.packData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Hero(
              tag: 'app_logo',
              child: Image.asset("assets/images/logo.png", height: 180),
            ),
            const SizedBox(height: 24),

            Text(
              "Genuine Product",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.green[800],
                fontWeight: FontWeight.bold,
                fontFamily: "Lato",
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "This product has been verified as authentic.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 40),

            Card(
              elevation: 4,
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    _buildDetailRow(
                      "Product",
                      packData.brandName,
                      isBold: true,
                    ),

                    const Divider(height: 30),
                    _buildDetailRow("Manufacturer", packData.manufacturer),
                    const Divider(height: 30),
                    _buildDetailRow(
                      "Verification Code",
                      packData.verificationCode,
                    ),
                    const Divider(height: 30),
                    _buildDetailRow("Verification Count", packData.verificationCount),
                    const Divider(height: 30),
                    _buildDetailRow("Expiry Date", packData.expiry),
                    const Divider(height: 30),
                    _buildDetailRow("NAFDAC No", packData.nafdac),
                    const Divider(height: 30),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 10,),

            const Text(
              "History",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Lota",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            ...packData.history.map((packHistory) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200],
                ),
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(17),
                child: Text(packHistory, style: const TextStyle(fontSize: 12)),
              );
            }),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/home");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Scan Another"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        Text(
          value,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
