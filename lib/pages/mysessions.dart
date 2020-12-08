import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainsafe/session_card.dart';
import '../session.dart';

class MySessions extends StatefulWidget {
  @override
  _MySessionsState createState() => _MySessionsState();
}

class _MySessionsState extends State<MySessions> {

  // String dateaux = '2020/12/20';
  // String beginingaux = '11:00';
  // String endaux = '12:00';
  // List<Session> sessions = [
  //   Session(date: '2020/12/20', begining: '11:00', end: '12:00')
  // ];
  List<Session> sessions = [];
  Session data;

  @override
  Widget build(BuildContext context) {

    IconData iconState = false ? Icons.error_outline : Icons.arrow_drop_down_circle_outlined;

    data = ModalRoute.of(context).settings.arguments;
    if (data != null) { sessions.add(data); }// : print("data is null");

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
                        child: Text('My Bookings',
                            style: TextStyle(fontSize: 50,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold)
                        ),
                      ),
                      SizedBox(),
                      Column(
                        children: sessions.map((session) => SessionCard(session: session)).toList(),
                      ),
                    // RaisedButton(
                    //
                    // )
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
        )
    );
  }
}