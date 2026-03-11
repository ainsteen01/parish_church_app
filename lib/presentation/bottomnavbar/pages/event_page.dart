import 'package:flutter/material.dart';
import 'package:parish_app/utils/colors.dart';

import '../../../utils/util.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar("Events"),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
            ),
            child: Row(children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: baseColorTwo,),
                child: Icon(Icons.church),
              ),
              Column(children: [
                Text("Sunday service & workshop", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
                Row(children: [
                  Icon(Icons.date_range), Text('OCT 27 2026'),
                  Spacer(flex: 1,),
                  ElevatedButton(onPressed: (){}, child: Text("Register"))
                ],),
                Row(children: [
                  Icon(Icons.location_on_rounded), Text('Grace Chapel'),
                ],)
              ],)
            ],),
          )
        ],
      ),
    );
  }
}
