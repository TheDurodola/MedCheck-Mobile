import 'package:flutter/material.dart';
import 'package:medcheck/features/pages/consumer_home.dart';
import 'package:medcheck/features/pages/investigatorhomepage.dart';
import 'package:medcheck/features/pages/retailer_home.dart';
import 'package:medcheck/features/auth/presentation/pages/registration.dart';
import 'package:medcheck/features/pages/wholesaler_home.dart';

import 'config/theme/app_theme.dart';
import 'features/auth/presentation/pages/login.dart';
import 'features/pages/splashscreen.dart';




class MedCheckApp extends StatelessWidget {
  const MedCheckApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'MedCheck',

      debugShowCheckedModeBanner: false,


      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,


      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/registration' : (context) =>  const RegistrationPage(),
        '/consumer/home': (context) => const ConsumerHomePage(),
        '/retailer/home': (context) => const RetailerHomePage(),
        '/wholesaler/home': (context) => const WholesalerHomePage(),
        '/investigator/home' : (context) => const InvestigatorHomepage()
        // '/scan': (context) => const ScanPage(),
      },
    );
  }
}