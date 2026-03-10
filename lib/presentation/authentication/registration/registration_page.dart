import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColorTwo,
      body: SingleChildScrollView(
        child: Container(
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
                SizedBox(height: 20),
                const Text(
                  "Register with Test App",
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
                      prefixIcon: Icon(Icons.phone_android, color: Colors.white),
                      label: const Text(
                        "Enter mobile number",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white.withAlpha(50)),
                      ),
                      fillColor: baseColorOne.withAlpha(50),
                      prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                      label: const Text(
                        "Enter email",
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
                        "Confirm password",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){}, child: const Text("Register")),
                SizedBox(height: 10,),

                RichText(text: TextSpan(children: [
                  const TextSpan(text: "Already have an account ? "),
                  const TextSpan(text: "Login", style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w700)),
                ])),

        
              ],
            ),
          ),
        ),
      )   );
  }
}
