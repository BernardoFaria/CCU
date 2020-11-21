import 'package:flutter/material.dart';

class InfectionControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/homephoto2.jpg"),
            alignment: Alignment.centerRight,
            fit: BoxFit.cover,
          ),
        ),


      ),



    );
  }
}

