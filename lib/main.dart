import 'package:entry_ticket/screens/ticket_screen.dart';
import 'package:flutter/material.dart';

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
