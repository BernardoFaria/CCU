import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trainsafe/models/user.dart';
import 'package:trainsafe/models/user2.dart';
import 'package:trainsafe/screenarguments.dart';
import 'package:trainsafe/services/authservice.dart';
import 'package:trainsafe/services/database.dart';
import 'package:trainsafe/pages/UserList.dart';

class Homee extends StatefulWidget {
  @override
  Yaa createState() => Yaa();
}



class Yaa extends State<Homee> {

  final AuthService _auth = AuthService();

  //User userRui = User(uid: 'id1');

  List<User> userList ;

  User userRui;


  @override
  Widget build(BuildContext context) {
/*
    final userInfo = Provider.of<QuerySnapshot>(context);
    print('aqui');
    print(userInfo);
    print('aqui');

    for (var doc in userInfo.documents) {
      print(doc.data);
    }*/
    userList = Provider.of<List<User>>(context);


    userRui = Provider.of<User>(context);



   /* if (ModalRoute.of(context).settings.arguments != null){
        userRui =  ModalRoute.of(context).settings.arguments;
    }*/

    IconData iconState = false ? Icons.error_outline : Icons.arrow_drop_down_circle_outlined;


    //print("_____________________________________");
    //print(user.uid);
    //print(user.expiredSessions);
    //print("*******************************************");


    //print(DatabaseService(uid: user.uid).users.ma);
    if(userList != null) {
      for (var u in userList) {
        if (userRui.uid == u.uid) {
          userRui = u;
          print(userRui.uid);
        }
        else {
          if(u.reports.isNotEmpty) {
            iconState = Icons.error_outline;
          }
        }
      }
    }



    return StreamProvider<List<User>>.value(
      value: DatabaseService().users,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back11.jpg"),
            alignment: Alignment.centerRight,
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(''),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 300,
                  child: Image.asset('assets/images/trainsafe.png')
              ),
              Container(
                width: 300.0,
                height: 80.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      // side: BorderSide(color: Colors.grey.withOpacity(1))
                  ),
                  color: Colors.black.withOpacity(0.5),
                  onPressed: () {

                    Navigator.pushReplacementNamed(context, '/book_advance',arguments: ScreenArguments(userRui, userList) );
                    // Respond to button press
                  },
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Book In Advance',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),// style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  // child: Text("BOOK IN ADVANCE"),
                ),
                // child: Icon(MyFlutterApp),
              ),
              SizedBox(height: 25),
              Container(
                width: 300.0,
                height: 80.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      // side: BorderSide(color: Colors.grey.withOpacity(0))
                  ),
                  color: Colors.black.withOpacity(0.52),
                  onPressed: () {
                    // Respond to button press
                    Navigator.pushReplacementNamed(context, '/my_gym');

                  },
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('MyGym',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),// style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  // child: Text("MY GYM"),
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: 300.0,
                height: 80.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      // side: BorderSide(color: Colors.grey.withOpacity(0))
                  ),
                  color: Colors.black.withOpacity(0.55),
                  onPressed: () {

                    Navigator.pushReplacementNamed(context, '/my_sessions',arguments: userRui);
                    // Respond to button press
                  },
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('My Bookings',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),// style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  // child: Text("MY SESSIONS"),
                ),
              ),
              Divider(
                height: 60.0,
              ),
              UserList(),
            ],
          ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black.withOpacity(1.0),

          child: Row(
            children: [
              Spacer(),
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
            Navigator.pushReplacementNamed(context, '/infection_control',arguments: userRui);

          },

        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,

        )
      ),
    );
  }
}