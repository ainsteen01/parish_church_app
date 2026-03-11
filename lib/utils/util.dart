
import 'package:flutter/material.dart';

AppBar homeAppBar(String title) {
  return AppBar(
    title:  Text(title),
    automaticallyImplyLeading: false,
    flexibleSpace: Container(
      width: double.infinity,
      decoration:
      BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.orangeAccent.shade100, Colors.orange.shade50
              ])
      ),),
  );
}