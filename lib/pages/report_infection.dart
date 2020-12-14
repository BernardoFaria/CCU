import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:trainsafe/models/user.dart';
import 'package:trainsafe/report.dart';
import 'package:trainsafe/services/database.dart';

class ReportInfection extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<ReportInfection> {

  IconData iconState = false ? Icons.error_outline : Icons.arrow_drop_down_circle_outlined;


  TextEditingController nameController = new TextEditingController();
  TextEditingController ccController = new TextEditingController();
  TextEditingController testController = new TextEditingController();
  String dateController;
  DateTime dateTimeField;
  // final formatDate = DateFormat("yyyy-MM-dd");

  DateFormat formatDate = DateFormat("yyyy-MM-dd");
  User user;

  @override
  Widget build(BuildContext context) {

    user = ModalRoute.of(context).settings.arguments;

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
            width: 370,
            height: 500.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('REPORT CASE',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
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
                    padding: const EdgeInsets.all(15.0),
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
                    padding: const EdgeInsets.all(15.0),
                    child: DateTimeField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'LAST SESSION',
                      ),
                      format: formatDate,
                      onShowPicker: (context, currentValue)async {
                        final date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                        return date;
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
                    padding: const EdgeInsets.all(15.0),
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
                    onPressed: () async {
                      var report = Report(name: nameController.text, cc: ccController.text, lastSession:dateController , covidTest: testController.text);
                      user.addReport(report);
                      await DatabaseService(uid: user.uid).updateUserData(user.uid,
                          user.reportInfo(user.reports),
                          user.sessionInfo(user.activeSessions),
                          user.sessionInfo(user.expiredSessions));

                      Navigator.pushReplacementNamed(context, '/infection_control', arguments:user);
                      // Respond to button press
                    },
                    child: Text('SUBMIT'),
                  ),
                ]
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black.withOpacity(1.0),
          child: Row(
            children: [
              Spacer(),
              IconButton(icon: Icon(Icons.keyboard_return), onPressed: () {
                Navigator.pushNamed(context, '/infection_control',arguments: user);
              }),
              Spacer(flex: 200),
              IconButton(icon: Icon(Icons.notifications_rounded), onPressed: () {}),
            ],
          ),
        ),

      ),
    );
  }
}

