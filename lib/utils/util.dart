
import 'package:flutter/material.dart';

AppBar homeAppBar(String title) {
  return AppBar(
    backgroundColor: Colors.white,
    title:  Text(title,  style: TextStyle(
      color: Colors.black87,
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),),
    automaticallyImplyLeading: false,
    flexibleSpace: Container(
      width: double.infinity,
      decoration:
      BoxDecoration(
          // gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       baseColorOne, baseColorTwo
          //     ])
      ),),
  );
}