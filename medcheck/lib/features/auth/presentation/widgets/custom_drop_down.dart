import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {

  final List<String> inputs;
  final String? selectedInput;
  final String? label;

  final ValueChanged<String?> onChanged;

  const CustomDropDown({
    super.key,
    required this.inputs,
    required this.selectedInput,
    required this.onChanged, this.label,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(

      initialValue: selectedInput,

      items: inputs.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),


      onChanged: onChanged,


      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (val) => val == null ? "Please select an ${label?.toLowerCase()}" : null,
    );
  }
}