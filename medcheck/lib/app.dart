import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcheck/features/auth/presentation/screens/invalid_role.dart';
import 'package:medcheck/features/auth/presentation/screens/welcome_screen.dart';


import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/screens/sign_up.dart';
import 'injection_container.dart' as di;

import 'config/theme/app_theme.dart';
import 'features/auth/presentation/screens/sign_in.dart';
import 'features/home/presentation/screens/home_screen.dart';

class MedCheckApp extends StatelessWidget {
  const MedCheckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => di.sl<AuthBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'MedCheck',
        debugShowCheckedModeBanner: false,

        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,


        initialRoute: '/signin',
        routes: {
          '/signin': (context) => const SignInPage(),
          '/signup': (context) => const SignUpPage(),
          '/home': (context) => const HomeScreen(),
          '/invalidrole': (context) => const InvalidRole(),
          '/welcome' : (context) => const WelcomeScreen(),
        },
      ),
    );
  }
}