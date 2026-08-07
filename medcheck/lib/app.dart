import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ... other imports
// IMPORT YOUR ENTITY SO DART KNOWS THE TYPE
import 'package:medcheck/features/home/domain/entities/pack_entity.dart';

import 'config/theme/app_theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/screens/invalid_role.dart';
import 'features/auth/presentation/screens/sign_in.dart';
import 'features/auth/presentation/screens/sign_up.dart';
import 'features/auth/presentation/screens/welcome_screen.dart';
import 'features/home/presentation/bloc/verification_bloc.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/home/presentation/screens/invalid_verification_code.dart';
import 'features/home/presentation/screens/verification_success_screen.dart';
import 'injection_container.dart' as di;

class MedCheckApp extends StatelessWidget {
  const MedCheckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => di.sl<AuthBloc>()),
        BlocProvider(create: (_) => di.sl<VerificationBloc>()),
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
          '/welcome': (context) => const WelcomeScreen(),
          '/invalidverificationcode': (context) => const InvalidVerificationCode(),

        },


        onGenerateRoute: (settings) {

          if (settings.name == '/success') {


            final args = settings.arguments;


            if (args is PackEntity) {

              return MaterialPageRoute(
                builder: (context) => VerificationSuccessScreen(packData: args),
              );
            }


            return MaterialPageRoute(
              builder: (context) => const InvalidVerificationCode(),
            );
          }

          return null;
        },
      ),
    );
  }
}