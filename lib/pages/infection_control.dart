import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfectionControl extends StatelessWidget {
  String s ='ola';
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
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: SizedBox(

                width: 400.0,
                height: 500.0,


                child: Container(
                  color: Colors.black.withOpacity(0.8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        RaisedButton(

                          color: Colors.black.withOpacity(0.5),
                          onPressed: () {
                            Navigator.pushNamed(context, '/report_infection');

                            // Respond to button press
                          },
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('REPORT INFECTION'),
                              // style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          // child: Text("BOOK IN ADVANCE"),
                        )

                      ]
                  ),
                ),
              ),
            )
        )

    );
  }
}










