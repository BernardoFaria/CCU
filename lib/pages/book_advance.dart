import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:trainsafe/services/world_time.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';



class BookAdvance extends StatefulWidget {
  @override
  _BookAdvanceState createState() => _BookAdvanceState();
}

class _BookAdvanceState extends State<BookAdvance> {
  final format = DateFormat("hh:mm a");
  final formatDate = DateFormat("yyyy-MM-dd");
  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print(data);

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
                    Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                            'BOOK A SESSION',
                            style: TextStyle(fontSize: 30,
                                fontWeight: FontWeight.bold)
                        ),
                      ),
                    Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                            data['time'],
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
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));

                          return date;
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
                            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                          );
                          return DateTimeField.convert(time);
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
                            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                          );
                          return DateTimeField.convert(endTime);
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
                        Navigator.pushNamed(context, '/home');
                        // Respond to button press
                      },
                      child: Text('SUBMIT'),



                    ),
                      ]
                          )
                          ),
                        ),
                      )
                  )

    );
  }
}
