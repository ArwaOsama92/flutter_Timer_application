// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:async';

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
//Times
  int hour = 0;
  String min = "";
  String sec = "";

//Dates
  String year = "";
  String month = "";
  String dayNum = "";
  String weekday = "";
  String amORpm = "";

  ChangeEverySecond() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
//Time
        hour = DateTime.now().hour;
        if (hour > 12) {
          hour = hour - 12;
          amORpm = "pm";
        }
        min = DateTime.now().minute.toString();
        sec = DateTime.now().second.toString();

        //Dates
        year = DateTime.now().year.toString();
        month = DateTime.now().month.toString();
        switch (month) {
          case "1":
            month = "January";
            break;

          case "2":
            month = "February";
            break;

          case "3":
            month = "March";
            break;

          case "4":
            month = "April";
            break;

          case "5":
            month = "May";
            break;

          case "6":
            month = "June";
            break;

          case "7":
            month = "July";
            break;

          case "8":
            month = "August";
            break;

          case "9":
            month = "September";
            break;

          case "10":
            month = "October";
            break;

          case "11":
            month = "November";
            break;

          case "12":
            month = "December";
            break;

          default:
        }

        dayNum = DateTime.now().day.toString();
        weekday = DateTime.now().weekday.toString();
        switch (weekday) {
          case "1":
            weekday = "Monday";
            break;

          case "2":
            weekday = "Tuesday";
            break;
          case "3":
            weekday = "Wednesday";
            break;
          case "4":
            weekday = "Thersday";
            break;
          case "5":
            weekday = "Friday";
            break;
          case "6":
            weekday = "Saturday";
            break;
          case "7":
            weekday = "Sunday";
            break;

          default:
        }
      });
    });
  }

  String qqq = "";
  calledOnlyTimerAfter7sec() {
    Timer(Duration(seconds: 5), () {
      setState(() {
        qqq = "Welcome";
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ChangeEverySecond();
    calledOnlyTimerAfter7sec();
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
            Text("$month $dayNum , $year",
                style: TextStyle(fontSize: 27, color: Colors.white)),
            SizedBox(height: 22),
            Text(
                " ${hour.toString().padLeft(2, "0")}: ${min.padLeft(2, "0")} : ${sec.padLeft(2, "0")}, $amORpm",
                style: TextStyle(fontSize: 27, color: Colors.white)),
            SizedBox(height: 22),
            Text(qqq, style: TextStyle(fontSize: 27, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
