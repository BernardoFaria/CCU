import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:provider/provider.dart';
import 'package:trainsafe/models/user.dart';
import 'package:trainsafe/screenarguments.dart';
import 'package:trainsafe/services/database.dart';
import '../session.dart';



class BookAdvance extends StatefulWidget {
  @override
  _BookAdvanceState createState() => _BookAdvanceState();
}

class _BookAdvanceState extends State<BookAdvance> {
  DateFormat formatHour = DateFormat("hh:mm");
  DateFormat formatDate = DateFormat("yyyy-MM-dd");

  var dateS;
  var beginingS;
  String beginingSformated;
  var endS;
  String endSformated;
  ScreenArguments data;
  User user;
  List<User> usersList;



  String slotsAvailable = '10';
  void getSlots(){
    int maxSlots = 10;
    usersList.forEach((element) {

      if (element.uid != user.uid) {//tem de se por != quando estiver implementado
        element.sessionsList.forEach((session) {
          if (session.date == dateS) {
            print('mesma data');
            List hoursList =[8,9,10,11,12,1,2,3,4,5,6,7];
            var beginingList = session.begining.split(":");
            var endList = session.end.split(":");



            if (hoursList.indexOf(int.parse(beginingSformated.split(':')[0]))>=hoursList.indexOf(int.parse(beginingList[0])) && hoursList.indexOf(int.parse(beginingSformated.split(':')[0]))<=hoursList.indexOf(int.parse(endList[0])) && hoursList.indexOf(int.parse(endSformated.split(':')[0]))>=hoursList.indexOf(int.parse(beginingList[0])) && hoursList.indexOf(int.parse(endSformated.split(':')[0]))<=hoursList.indexOf(int.parse(endList[0]))){
              maxSlots -=1;
            }
            else if (hoursList.indexOf(int.parse(beginingSformated.split(':')[0]))<=hoursList.indexOf(int.parse(beginingList[0])) && hoursList.indexOf(int.parse(beginingSformated.split(':')[0]))<=hoursList.indexOf(int.parse(endList[0])) && hoursList.indexOf(int.parse(endSformated.split(':')[0]))>=hoursList.indexOf(int.parse(beginingList[0])) &&hoursList.indexOf(int.parse(endSformated.split(':')[0]))<=hoursList.indexOf(int.parse(endList[0]))){
              maxSlots -=1;

            }else if (hoursList.indexOf(int.parse(beginingSformated.split(':')[0]))>=hoursList.indexOf(int.parse(beginingList[0])) && hoursList.indexOf(int.parse(beginingSformated.split(':')[0]))<=hoursList.indexOf(int.parse(endList[0])) && hoursList.indexOf(int.parse(endSformated.split(':')[0]))>=hoursList.indexOf(int.parse(beginingList[0])) && hoursList.indexOf(int.parse(endSformated.split(':')[0]))>=hoursList.indexOf(int.parse(endList[0])) ){
              maxSlots -=1;

            }

          }
        });
      }

    });
    print(maxSlots);

    setState(() {
      slotsAvailable = maxSlots.toString();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    IconData iconState = false ? Icons.error_outline : Icons.arrow_drop_down_circle_outlined;

    data = ModalRoute.of(context).settings.arguments;

    user = data.user;
    usersList = data.userList;
    print(usersList.length);

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm').format(now);



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
            body: Center(
              child: SizedBox(
                width: 370.0,
                height: 650.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          'Book A Session',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          // data['time'],
                          formattedDate,
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
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
                          if(date != null) {
                            dateS = formatDate.format(date);
                            return date;

                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child:  DateTimeField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'PICK A STARTING SESSION PERIOD',
                        ),
                        format: formatHour,
                        onShowPicker: (context, currentValue) async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(currentValue ?? now),
                          );
                          if(time != null) {
                            beginingS = DateTimeField.convert(time);
                            beginingSformated = formatHour.format(beginingS);
                            return beginingS;
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child:  DateTimeField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'PICK A ENDING SESSION PERIOD',
                        ),
                        format: formatHour,
                        onShowPicker: (context, currentValue) async {
                          final endTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(currentValue ?? now),
                          );
                          if(endTime != null) {

                            endS = DateTimeField.convert(endTime);
                            endSformated = formatHour.format(endS);
                            getSlots();
                            return endS;
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child:  Chip(
                        padding: const EdgeInsets.all(10.0),
                        label: Text( 'Slots Available: $slotsAvailable',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ),
                    SizedBox(height: 20),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.grey.withOpacity(0))
                      ),
                      // padding: const EdgeInsets.all(10.0),
                      color: Colors.grey.withOpacity(0.8),
                      onPressed: () async {
                        var session = Session(date: dateS, begining: beginingSformated, end: endSformated);
                        user.addSession(session);
                        await DatabaseService(uid: user.uid).updateUserData(user.uid,
                            user.reportInfo(user.reports),
                            user.sessionInfo(user.activeSessions),
                            user.sessionInfo(user.expiredSessions));
                        Navigator.pushReplacementNamed(context, '/my_sessions', arguments: user);
                      },
                      child: Text('SUBMIT',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                    Navigator.pushReplacementNamed(context, '/', arguments: user);
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
