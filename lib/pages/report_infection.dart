import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


class ReportInfection extends StatelessWidget {

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
        body:Center(
          child: SizedBox(

            width: 400.0,
            height: 500.0,


            child: Container(
              color: Colors.black.withOpacity(0.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                        'REPORT INFECTION',
                        style: TextStyle(fontSize: 30,
                            fontWeight: FontWeight.bold)

                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),

                          labelText: 'NAME',
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(

                      obscureText: false,

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CC NUMBER',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DateTimeField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'LAST SESSION',
                      ),
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(

                      obscureText: false,

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'COVID TEST ID',
                      ),
                    ),
                  ),

                  FlatButton(

                    color: Colors.blueGrey.withOpacity(0.8),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                      // Respond to button press
                    },
                    child: Text('SUBMIT'),


                  ),







              ]
      ),
            ),
          ),
        )
      )

    );





  }
}

