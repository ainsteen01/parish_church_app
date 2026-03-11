import 'package:flutter/material.dart';
import 'package:parish_app/utils/colors.dart';

import '../../../utils/util.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar: homeAppBar("Donation"),
     body:  Container(
       decoration: BoxDecoration(
         gradient: LinearGradient(
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
             colors: [
               Colors.orange.shade50.withAlpha(15),  Colors.orangeAccent.shade100.withAlpha(15)
             ])
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(

               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Text("Sample text", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),),
                     const Text("This is Sample text", style: TextStyle(color: Colors.black,))
                   ],
                 ),
                 Image.asset("assets/images/splash.png", width: 100,height: 100,color: Colors.blueAccent,)
               ],),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               padding: EdgeInsets.all(10),
               decoration: BoxDecoration(color: Colors.white,
                   borderRadius: BorderRadius.circular(10),
                   boxShadow: [
                     BoxShadow(color: Colors.black12, blurRadius: 3, spreadRadius: 3)
                   ]),
               child: SizedBox(
               height: 100,
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount: 4,
                   itemBuilder: (BuildContext context, int index) {
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(

                         padding: EdgeInsets.all(10),
                         decoration: BoxDecoration(
                             color: Colors.grey.shade100,
                             borderRadius: BorderRadius.circular(10),

                         ),
                         child:Column(
                           children: [
                             const Text("Donation Type", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
                             Icon(Icons.church, color: Colors.blueGrey,),
                             const Text("Donation 1")
                           ],
                         ),
                       ),
                     );
                   },

                 ),
               ),
             ),
           ),
           SizedBox(height: 10,),
           const Text("Donation Amount", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: TextField(
               decoration: InputDecoration(
                 prefixIcon: Icon(Icons.currency_rupee, color: baseColorTwo,),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: BorderSide(color: baseColorOne)
                 ),
                 label: const Text("Enter amount")
               ),
             ),
           ),
           SizedBox(height: 10,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Container(
                 padding: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: baseColorOne.withAlpha(70)
                 ),
                 child: const Text("100", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
               ),
               Container(
                 padding: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: baseColorOne.withAlpha(70)
                 ),
                 child: const Text("500", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
               ),
               Container(
                 padding: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: baseColorOne.withAlpha(70)
                 ),
                 child: const Text("1000", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
               ),
               Container(
                 padding: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: baseColorOne.withAlpha(70)
                 ),
                 child: const Text("2000", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
               ),
             ],
           ),
           SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               padding: EdgeInsets.all(10),
               decoration: BoxDecoration(color: Colors.white,
                   borderRadius: BorderRadius.circular(10),
                   boxShadow: [
                     BoxShadow(color: Colors.black12, blurRadius: 3, spreadRadius: 3)
                   ]),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Text(
                     "Payment Method", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),),
                   SizedBox(
                     height: 100,
                     child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                       itemCount: 4,
                       itemBuilder: (BuildContext context, int index) {
                         return Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(

                             padding: EdgeInsets.all(10),
                             decoration: BoxDecoration(
                               color: Colors.grey.shade100,
                               borderRadius: BorderRadius.circular(10),

                             ),
                             child:Column(
                               children: [
                                 const Text("Payments", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
                                 Icon(Icons.payments_outlined, color: Colors.blueGrey,),
                                 const Text("Payment 1")
                               ],
                             ),
                           ),
                         );
                       },

                     ),
                   ),
                 ],
               ),
             ),
           ),
           ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(backgroundColor: baseColorTwo, foregroundColor: Colors.white),
               child: Text("Donate"))
         ],
       ),
     ),
    );
  }


}
