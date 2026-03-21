import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/routes.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [baseColorOne, baseColorTwo],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                splashImagePath,
                color: Colors.white,
                width: 150,
                height: 150,
              ),
              const Text(
                "Test App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 30),
              const Text(
                "Forgot password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white.withAlpha(50)),
                    ),
                    fillColor: baseColorOne.withAlpha(50),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Enter email",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, loginPageRoute);
              }, child: const Text("Request Reset")),
            ],
          ),
        ),
      ),
    );
  }
}
