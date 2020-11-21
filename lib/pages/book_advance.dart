import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:trainsafe/services/world_time.dart';


class BookAdvance extends StatefulWidget {
  @override
  _BookAdvanceState createState() => _BookAdvanceState();
}

class _BookAdvanceState extends State<BookAdvance> {

  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'London', flag: 'london.png', url: 'Europe/London');
    await instance.getTime();
    print(instance.time);
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}