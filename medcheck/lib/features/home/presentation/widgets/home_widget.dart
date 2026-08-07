import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcheck/core/widgets/custom_input_field.dart';
import 'package:medcheck/features/home/presentation/bloc/verification_bloc.dart';
import 'package:medcheck/features/home/presentation/bloc/verification_event.dart';
import 'package:medcheck/features/home/presentation/bloc/verification_state.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';
import '../../domain/entities/pack_entity.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<StatefulWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final TextEditingController _verificationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _verificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<VerificationBloc, VerificationState>(
        listener: (context, state) {
          if (state is PackApproved) {
            final PackEntity entity = state.packEntity;
            if (kDebugMode) {
              print(entity.verificationCode);
            }
            Navigator.pushReplacementNamed(context, '/success', arguments: entity);
          } else if (state is VerificationFailure) {
            Navigator.pushReplacementNamed(context, '/invalidverificationcode');
          }
        },
        builder: (context, state) {
          final bool isLoading = state is VerificationLoading;

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
                      Hero(
                        tag: 'app_logo',
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: 180,
                        ),
                      ),
                      const SizedBox(height: 24),

                      Text(
                        "Verify Pack",
                        style: TextStyle(
                          fontFamily: 'Lota',
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBlue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        "Enter the verification code attached to the "
                            "purchased pack",
                        style: TextStyle(
                          fontFamily: AppFonts.secondary,
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),

                      CustomInputField(
                        _verificationController,
                        "Verification Code",
                        true,
                        keyboardType: TextInputType.datetime,
                      ),

                      const SizedBox(height: 40),

                      ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<VerificationBloc>().add(
                                    PackVerificationRequested(
                                      packVerificationCode:
                                          _verificationController.text,
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
                                "Verify",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
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
        },
      ),
    );
  }
}
