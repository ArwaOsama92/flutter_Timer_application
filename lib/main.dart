// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DateApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DateApp extends StatefulWidget {
  const DateApp({super.key});

  @override
  State<DateApp> createState() => _DateAppState();
}

class _DateAppState extends State<DateApp> {
  String weekday = "";
  String date = "";
  String timeNow = "";

  ChangeEverySecond() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        weekday = DateFormat("EEEE").format(DateTime.now());
        date = DateFormat("MMMM d , y").format(DateTime.now());
        timeNow = DateFormat('hh :mm : ss a').format(DateTime.now());
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ChangeEverySecond();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Time & Date App",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Color.fromARGB(255, 107, 107, 109),
      ),
      backgroundColor: Color.fromARGB(255, 46, 47, 48),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today's Date is $weekday",
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            SizedBox(height: 22),
            Text(date, style: TextStyle(fontSize: 27, color: Colors.white)),
            SizedBox(height: 22),
            Text(timeNow, style: TextStyle(fontSize: 27, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
