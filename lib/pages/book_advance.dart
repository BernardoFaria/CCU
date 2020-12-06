import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:trainsafe/services/world_time.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../session.dart';



class BookAdvance extends StatefulWidget {
  @override
  _BookAdvanceState createState() => _BookAdvanceState();
}

class _BookAdvanceState extends State<BookAdvance> {
  final format = DateFormat("hh:mm a");
  final formatDate = DateFormat("yyyy-MM-dd");
  // Map data = {};

  // DateTime dateS;
  // DateTime beginingS;
  // DateTime endS;
  var dateS;
  var beginingS;
  var endS;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    IconData iconState = false ? Icons.error_outline : Icons.arrow_drop_down_circle_outlined;

    // data = ModalRoute.of(context).settings.arguments;
    // print(data);
    DateTime now = DateTime.now();
    // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    String formattedDate = DateFormat('kk:mm').format(now);
    // print(now);

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
                width: 380.0,
                height: 550.0,
                child: Container(
                  color: Colors.black.withOpacity(0.8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                            'Book A Session',
                            style: TextStyle(fontSize: 30,
                                fontWeight: FontWeight.bold)
                        ),
                      ),
                    Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                            // data['time'],
                            formattedDate,
                            style: TextStyle(fontSize: 30,
                                fontWeight: FontWeight.bold)
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: DateTimeField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'PICK A SESSION DATE',
                        ),
                        format: formatDate,
                        onShowPicker: (context, currentValue)async {
                          final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2020),
                              initialDate: currentValue ?? now,
                              lastDate: DateTime(2100));
                          return dateS = date;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:  DateTimeField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'PICK A STARTING SESSION PERIOD',
                        ),
                        format: format,
                        onShowPicker: (context, currentValue) async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(currentValue ?? now),
                          );
                          return beginingS = DateTimeField.convert(time);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:  DateTimeField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'PICK A ENDING SESSION PERIOD',
                        ),
                        format: format,
                        onShowPicker: (context, currentValue) async {
                          final endTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(currentValue ?? now),
                          );
                          return endS = DateTimeField.convert(endTime);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:  Chip(
                        label: Text('SLOTS AVAILABLE: X'),
                      )
                    ),
                    FlatButton(
                      color: Colors.grey.withOpacity(0.8),
                      onPressed: () {
                        Navigator.pushNamed(context, '/my_sessions', arguments: Session(date: dateS.toString(), begining: beginingS.toString(), end: endS.toString()));
                      },
                      child: Text('SUBMIT'),
                    ),
                  ]
                  )
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.black.withOpacity(1.0),
              child: Row(
                children: [
                  Spacer(),
                  IconButton(icon: Icon(Icons.keyboard_return), onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  }),
                  Spacer(flex: 200),
                  IconButton(icon: Icon(Icons.notifications_rounded), onPressed: () {}),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(
                iconState,
                size: 50,
              ),
              onPressed: () {
                // Respond to button press
                Navigator.pushNamed(context, '/infection_control');
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        ),
    );
  }
}
