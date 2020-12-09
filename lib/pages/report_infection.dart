import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:trainsafe/report.dart';

class ReportInfection extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<ReportInfection> {


  TextEditingController nameController = new TextEditingController();
  TextEditingController ccController = new TextEditingController();
  TextEditingController testController = new TextEditingController();
  String dateController;
  DateTime dateTimeField;
  final formatDate = DateFormat("yyyy-MM-dd");



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
                        'REPORT CASE',
                        style: TextStyle(fontSize: 30,
                            fontWeight: FontWeight.bold)

                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: nameController,
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
                      controller: ccController,
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
                      format: formatDate,
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                      },
                      onChanged: (date) {
                        setState(() {
                          dateTimeField = date;
                          dateController = formatDate.format(date);
                          print(dateTimeField);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: testController,

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
                      Navigator.pushNamed(context, '/infection_control', arguments: Report(name: nameController.text, cc: ccController.text, lastSession:dateController , covidTest: testController.text));
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

