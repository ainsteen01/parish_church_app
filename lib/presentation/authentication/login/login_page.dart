import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                "Login to Test App",
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
                      Icons.supervised_user_circle,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Enter user name",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
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
                    prefixIcon: Icon(Icons.password, color: Colors.white),
                    label: const Text(
                      "Enter password",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, otpVerificationPageRoute);
              }, child: const Text("Login")),
              SizedBox(height: 10,),
              const Text("Forgot password ? ",style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w700),),
              SizedBox(height: 10,),
              RichText(text: TextSpan(children: [
                const TextSpan(text: "Don't have an account ? "),
                const TextSpan(text: "register", style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w700)),
              ])),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Divider(),
              ),
              ElevatedButton(onPressed: (){}, child: const Text("Login with OTP")),
          
            ],
          ),
        ),
      ),
    );
  }
}
