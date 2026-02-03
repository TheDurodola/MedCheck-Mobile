import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcheck/core/constants/app_colors.dart';
import 'package:medcheck/core/constants/app_fonts.dart';
import 'package:medcheck/core/utils/validators.dart';
import 'package:medcheck/features/auth/presentation/bloc/auth_state.dart';
import 'package:medcheck/features/auth/presentation/widgets/custom_date_picker.dart';
import 'package:medcheck/features/auth/presentation/widgets/custom_input_field.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../widgets/custom_drop_down.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _middlenameController = TextEditingController();
  final _nationalIdentityNumberController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _currentGender;
  final List<String> _genders = ["Male", "Female", "Other"];

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Welcome back, ${state.user.role}!")),
            );
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is AuthInvalidRoleFailure) {
            Navigator.pushReplacementNamed(context, '/invalidrole');
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final bool isLoading = state is AuthLoading;

          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Customer Registration",
                        style: TextStyle(
                          fontFamily: 'Lota',
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBlue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Your pathway to a safer recovery",
                        style: TextStyle(
                          fontFamily: AppFonts.secondary,
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 40),

                      CustomInputField(
                        _firstnameController,
                        "First name",
                        false,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 20),

                      CustomInputField(
                        _middlenameController,
                        "Middle name",
                        false,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 20),

                      CustomInputField(
                        _lastnameController,
                        "Last name",
                        false,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 20),

                      CustomInputField(
                        _nationalIdentityNumberController,
                        "National Identity Number",
                        false,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: _phoneNumberController,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
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
                        validator: (value) => value!.isEmpty
                            ? "Please enter your phone number"
                            : null,
                      ),
                      const SizedBox(height: 20),

                      CustomDropDown(
                        label: "Gender",
                        inputs: _genders,
                        selectedInput: _currentGender,
                        onChanged: (newValue) {
                          setState(() {
                            _currentGender = newValue;
                          });
                        },
                      ),
                      const SizedBox(height: 20),

                      CustomDatePicker(
                        label: "Date Of Birth",
                        controller: _dateOfBirthController,
                        validator: Validators.validateAge,
                      ),
                      const SizedBox(height: 20),

                      CustomInputField(
                        _emailController,
                        "Email",
                        false,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators.validateEmail,
                      ),
                      const SizedBox(height: 20),

                      CustomInputField(
                        _usernameController,
                        "Username",
                        false,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 20),

                      CustomInputField(
                        _passwordController,
                        "Password",
                        true,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 20),

                      CustomInputField(
                        _confirmPasswordController,
                        "Confirm Password",
                        true,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 20),

                      const SizedBox(height: 24),

                      ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                    RegistrationRequested(
                                      username: _usernameController.text,
                                      password: _passwordController.text,
                                      firstName: _firstnameController.text,
                                      lastName: _lastnameController.text,
                                      middleName: _middlenameController.text,
                                      email: _emailController.text,
                                      phoneNumber: _phoneNumberController.text,
                                      nationalIdentityNumber:
                                          _nationalIdentityNumberController
                                              .text,
                                      gender: "",
                                      dateOfBirth: _dateOfBirthController.text,
                                    ),
                                  );
                                }
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

                        child: isLoading
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                      ),

                      const SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/signin'),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: AppColors.accentGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
