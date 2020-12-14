import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainsafe/models/user.dart';
import 'package:trainsafe/services/database.dart';
import 'package:trainsafe/session_card.dart';
import '../session.dart';

class MySessions extends StatefulWidget {
  @override
  _MySessionsState createState() => _MySessionsState();
}



class _MySessionsState extends State<MySessions> {

  User user;

  @override
  Widget build(BuildContext context) {

    IconData iconState = false ? Icons.error_outline : Icons.arrow_drop_down_circle_outlined;

    user = ModalRoute.of(context).settings.arguments;

    void rmSession(session) async{
      user.activeSessions.remove(session);
      await DatabaseService(uid: user.uid).updateUserData(user.uid,
          user.reportInfo(user.reports),
          user.sessionInfo(user.activeSessions),
          user.sessionInfo(user.expiredSessions));
    }

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
                        child: Text('My Bookings',
                            style: TextStyle(fontSize: 50,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold)
                        ),
                      ),
                      SizedBox(),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 410.0,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: user.activeSessions.map((session) => SessionCard(session: session, delete: rmSession)).toList(),
                        ),
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
                    Navigator.pushReplacementNamed(context, '/', arguments: user);
                  }),
                  Spacer(flex: 200),
                  IconButton(icon: Icon(Icons.notifications_rounded), onPressed: () {}),
                ],
              ),
            ),

        )
    );
  }
}