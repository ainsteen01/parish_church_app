import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
                baseColorOne,
                baseColorTwo
          ])
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Image.asset(splashImagePath, color: Colors.white,width: 200,height: 200,),
              const Text("Test App",style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:const Text(textAlign: TextAlign.center,"Connecting you across the community",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
              ),
              Lottie.asset(
                splashLoaderAnimation,
                width: 150,
                height: 150,
              ),
              const Text(textAlign: TextAlign.center,"Loading",style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w200),),
          ],),
        ),
      ),
    );
  }
}
