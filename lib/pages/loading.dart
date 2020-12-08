import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:trainsafe/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'London', flag: 'london.png', url: 'Europe/London');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/wrapper', arguments: {
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/homephoto2.jpg"),
          alignment: Alignment.centerRight,
          fit: BoxFit.cover,
        ),
      ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,30,0,0),
          child: Column(
            children: [
              Image.asset('assets/images/trainsafe.png'),
              SpinKitFadingCube(
                color: Colors.black,
                size: 70.0,
              ),
            ],
          ),
        ),
    );
  }
}