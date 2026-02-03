
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType keyboardType;


  const CustomInputField(this.controller, this.label, this.obscureText, {super.key, this.validator, required this.keyboardType});


  @override
  State<StatefulWidget> createState() => _CustomInputFieldState();



}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
   return TextFormField(
     keyboardType: TextInputType.phone,
     obscureText: widget.obscureText ,
     controller: widget.controller,
     decoration: InputDecoration(
       labelText: widget.label,
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
         ? "Please enter your ${widget.label.toLowerCase()}"
         : null,
   );
  }
}