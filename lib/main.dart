import 'package:flutter/material.dart';
import 'package:parish_app/presentation/authentication/forgot_password/forgot_password_page.dart';
import 'package:parish_app/presentation/authentication/login/login_page.dart';
import 'package:parish_app/presentation/authentication/logintype/login_type_page.dart';
import 'package:parish_app/presentation/authentication/otpverification/otp_verification.dart';
import 'package:parish_app/presentation/authentication/registration/registration_page.dart';
import 'package:parish_app/presentation/bottomnavbar/bottom_navbar.dart';
import 'package:parish_app/presentation/splashscreen/splash_screen.dart';
import 'package:parish_app/utils/constants.dart';
import 'package:parish_app/utils/routes.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: initialRoutes,
      routes:{
        initialRoutes:(context) => SplashScreen(),
        loginTypePageRoute:(context)=> LoginTypePage(),
        loginPageRoute:(context)=> LoginPage(),
        registerPageRoute:(context) => RegistrationPage(),
        otpVerificationPageRoute:(context) => OtpVerification(),
        bottomNavbarPageRoute:(context) => BottomNavbar(),
        forgotPasswordPageRoute:(context) => ForgotPasswordPage(),
      },
      title: appName,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple),)
    );
  }
}
