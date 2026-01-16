import 'dart:io';

import 'package:flutter/material.dart';
import '../../data/auth_repository.dart';
import '../widgets/profile_image_picker.dart'; // Import the repo

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _firstnameController = TextEditingController();
  final _middlenameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dateController = TextEditingController();
  final _nationalIdentityNumberController = TextEditingController();
  File? _userImageFile;

  void _submit() {
    if (_userImageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add a profile picture.')),
      );
      return;
    }
  }

  final DateTime eighteenYearsAgo = DateTime(
    DateTime.now().year - 18,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime? _selectedDate;

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  final _authRepo = AuthRepository();

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await _authRepo.login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: eighteenYearsAgo,
      firstDate: DateTime(1900),
      lastDate: eighteenYearsAgo,
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  const Text(
                    "Register",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  ProfileImagePicker(
                    onImagePicked: (pickedImage) {
                      _userImageFile = pickedImage;
                    },
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "Please enter a username" : null,
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value!.length < 6 ? "Password too short" : null,
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _firstnameController,
                    decoration: const InputDecoration(
                      labelText: "First name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                    value!.length > 2 ? "Please enter a valid first name" : null,
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _middlenameController,
                    decoration: const InputDecoration(
                      labelText: "Middle name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                    value!.length > 2 ? "Please enter a valid middle name" : null,
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _lastnameController,
                    decoration: const InputDecoration(
                      labelText: "Last name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                    value!.length > 2 ? "Please enter a valid last name" : null,
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value!.isEmpty
                        ? "Please enter your email address"
                        : null,
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Last name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value!.length > 2 ? "Please enter a valid last name" : null,
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _nationalIdentityNumberController,
                    decoration: const InputDecoration(
                      labelText: "National Identity Number",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value!.length == 12
                        ? "NIN must be 12 Digits long"
                        : null,
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _dateController,
                    readOnly: true,
                    onTap: _selectDate,

                    decoration: const InputDecoration(
                      labelText: "Date of Birth",
                      hintText: "YYYY-MM-DD",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please select your date of birth";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: _isLoading ? null : _handleLogin,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.green,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text(
                            "Register",
                            style: TextStyle(fontSize: 16),
                          ),
                  ),

                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text("have an account? Log In"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
