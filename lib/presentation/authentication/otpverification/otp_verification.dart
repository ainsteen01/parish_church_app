import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:parish_app/utils/colors.dart';

import '../../../utils/routes.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
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
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(splashImagePath, color: Colors.white,width: 170,height: 170,),
          const Text("Test App",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
          SizedBox(height: 10,),
          const Text(
            textAlign: TextAlign.center,
            "Please enter the 6 digit OTP send to your mobile number",style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),),
          SizedBox(height: 30,),
          const Text("Verify OTP",style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),),
          SizedBox(height: 20,),
          OtpTextField(
            numberOfFields: 5,
            borderColor: baseColorTwo,
            fillColor:baseColorOne.withAlpha(100),
            filled: true,
            textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode){
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  }
              );
            }, // end onSubmit
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, bottomNavbarPageRoute);
          }, child: const Text("Verify OTP"))
        ],),
      ),
    );
  }
}
