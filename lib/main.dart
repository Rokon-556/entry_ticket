import 'dart:developer';

import 'package:entry_ticket/models/my_ticket_model.dart';
import 'package:entry_ticket/screens/my_ticket_screen.dart';
import 'package:entry_ticket/screens/ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/user_ticket_model.dart';
import 'services/service.dart';

void main() {
  runApp(const MyApp());
}

//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: const Color(0xFFFF8C1A),

          textTheme: const TextTheme(
              titleMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              bodyLarge: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w400),
              bodyMedium: TextStyle(fontSize: 11, fontWeight: FontWeight.w400)),
          fontFamily: 'Poppins'),
      home: MyHomePage(),
    );
  }
}



  



  




