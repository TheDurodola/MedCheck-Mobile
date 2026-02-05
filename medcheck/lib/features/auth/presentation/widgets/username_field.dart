import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class UsernameField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;


  const UsernameField({
      required this.controller,
      this.label = "Username",
      this.validator,
      super.key});

  @override
  State<StatefulWidget> createState() => _UsernameFieldState();

}

class _UsernameFieldState extends State<UsernameField>{
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:widget.controller,
      decoration: InputDecoration(
        labelText: "Username",
        prefixIcon: Icon(
          Icons.person_outline,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.accentGreen,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (value) =>
      value!.isEmpty
          ? "Please enter your username"
          : null,
    );
  }
}