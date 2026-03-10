import 'package:flutter/material.dart';
import 'package:parish_app/utils/colors.dart';

class LoginTypePage extends StatefulWidget {
  const LoginTypePage({super.key});

  @override
  State<LoginTypePage> createState() => _LoginTypePageState();
}

class _LoginTypePageState extends State<LoginTypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            baseColorOne, baseColorTwo
          ])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(splashImagePath, color: Colors.white,width: 170,height: 170,),
            const Text("Test App",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
            SizedBox(height: 30,),
            const Text("Welcome to Test App",style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                  },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade400, foregroundColor: Colors.white,
                      
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      child: Text("Login"))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),

                    child: Text("Register")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
