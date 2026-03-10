import 'package:flutter/material.dart';
import 'package:parish_app/presentation/authentication/login/login_page.dart';
import 'package:parish_app/presentation/authentication/logintype/login_type_page.dart';
import 'package:parish_app/presentation/authentication/otpverification/otp_verification.dart';
import 'package:parish_app/presentation/authentication/registration/registration_page.dart';
import 'package:parish_app/presentation/bottomnavbar/bottom_navbar.dart';
import 'package:parish_app/presentation/splashscreen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parish App',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple),),
      home: const BottomNavbar(),
    );
  }
}
