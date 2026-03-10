import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Good Morning ! \nWelcome to ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),),
              CircleAvatar(
                backgroundColor: Colors.greenAccent.shade200,
                child: Icon(Icons.personal_injury),
              ),

            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Test App", style: TextStyle(color: Colors.black , fontWeight: FontWeight.w700, fontSize: 30),),
              IconButton(onPressed: (){}, icon: Icon(Icons.notifications, color: Colors.orange,))
            ],),
            SizedBox(height: 20,),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
               gradient: LinearGradient(
                   begin: Alignment.topCenter,
                   end: Alignment.bottomCenter,
                   colors: [
                 baseColorOne, baseColorTwo
               ]),
                boxShadow: [
                  BoxShadow(color: Colors.black12,
                  blurRadius: 6, spreadRadius: 3)
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          child: Image.asset(splashImagePath, color: baseColorTwo,fit: BoxFit.fill,),
                        ),
                        SizedBox(width: 10,),
                        const Text("Today's Timings", style: TextStyle(color: Colors.white , fontSize: 20),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {

                          return  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(

                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,

                              ),child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("7:00 AM", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
                                const Text("Morning")
                              ],
                            ),
                            ),
                          );
                        },

                      ),
                    ),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            )
          ],),
        ),
      ),
    );
  }
}
