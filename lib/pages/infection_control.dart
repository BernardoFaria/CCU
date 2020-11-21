import 'package:flutter/cupertino.dart';
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

        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: 230.0,
              height: 40.0,
              child: RaisedButton(

                color: Colors.black.withOpacity(0.5),
                onPressed: () {
                  Navigator.pushNamed(context, '/report_infection');

                  // Respond to button press
                },
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('REPORT INFECTION'),// style: TextStyle(color: Colors.white),),
                  ],
                ),
                // child: Text("BOOK IN ADVANCE"),
              ),
              // child: Icon(MyFlutterApp),
            ),



            Divider(
              height: 120.0,
            ),

          ],
        ),
      ),


    );
  }
}

