import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/images/back11.jpg"),
          alignment: Alignment.centerRight,
          fit: BoxFit.cover,
          ),
      ),

      child: Center(
        child: SpinKitChasingDots(
          color: Colors.orange[400],
          size: 50.0,
        ),
      ),

    );
  }
}