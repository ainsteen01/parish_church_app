import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              AppBar(
                title: Text('Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 22),),
                toolbarHeight: 130,
                centerTitle: true,
                automaticallyImplyLeading: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.lightBlueAccent.withAlpha(100),
              ),
              Positioned(
                bottom: -30, // moves avatar half outside
                child: CircleAvatar(
                  radius: 35,
                  child: Icon(Icons.person, size: 35),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          const  Text("Ainsteen varghese", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),),
          const Text("Member ID : 00901029", style: TextStyle(color: Colors.black),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black12,
                  blurRadius: 4, spreadRadius: 3, offset: Offset(0, 1)
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(

                    children: [
                    Icon(Icons.person),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const Text("Name"),
                      const Text("Ainsteen varghese")
                    ],)
                  ],),
                  Divider(),
                  Row(children: [
                    Icon(Icons.call),
                    SizedBox(width: 10,),
                    Column(          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,children: [
                      const Text("Mobile"),
                      const Text("+91 8989309123")
                    ],)
                  ],),
                  Divider(),
                  Row(children: [
                    Icon(Icons.email_outlined),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,children: [
                      const Text("Email"),
                      const Text("samplemail@gmail.com")
                    ],)
                  ],),
                  Divider(),
                  Row(children: [
                    Icon(Icons.group),
                    SizedBox(width: 10,),
                    Column(          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,children: [
                      const Text("Family ID"),
                      const  Text("FD98892329")
                    ],)
                  ],),
                  Divider(),
                  Row(children: [
                    Icon(Icons.location_on_rounded),
                    SizedBox(width: 10,),
                    Column(          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,children: [
                      const Text("Address"),
                      const Text("Sample address ernakulam kerala")
                    ],)
                  ],),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Spacer(flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueAccent.shade200,
                  child: Icon(Icons.edit, color: Colors.white,),
                ),
                Text("Edit")
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.orange.shade400,
                  child: Icon(Icons.password,color: Colors.white,),
                ),
                Text("Change password")
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red.shade300,
                  child: Icon(Icons.logout, color: Colors.white,),
                ),
                Text("Logout")
              ],
            )

          ],),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
