import 'package:flutter/material.dart';
import 'package:trainsafe/services/authservice.dart';

import '../session.dart';
import '../report.dart';
import '../report_card.dart';

class Homee extends StatefulWidget {
  @override
  Yaa createState() => Yaa();
}

class Yaa extends State<Homee> {

  // Map data = {};

  @override
  Widget build(BuildContext context) {
    
    // data = ModalRoute.of(context).settings.arguments;
    // print(data);

    IconData iconState = false ? Icons.error_outline : Icons.arrow_drop_down_circle_outlined;
    final AuthService _auth = AuthService();

    return Container(
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
              label: Text('logout'),
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
                child: Image.asset('assets/images/trainsafe.png')),
            Container(
              width: 230.0,
              height: 40.0,
              child: RaisedButton(

                color: Colors.black.withOpacity(0.5),
                onPressed: () {
                  Navigator.pushNamed(context, '/book_advance'); //, arguments: {'time': data['time']});

                  // Respond to button press
                },
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('BOOK IN ADVANCE'),// style: TextStyle(color: Colors.white),),
                  ],
                ),
                // child: Text("BOOK IN ADVANCE"),
              ),
              // child: Icon(MyFlutterApp),
            ),
            SizedBox(height: 25),
            Container(
              width: 230.0,
              height: 40.0,
              child: RaisedButton(
                color: Colors.black.withOpacity(0.5),
                onPressed: () {
                  // Respond to button press
                  Navigator.pushNamed(context, '/my_gym');

                },
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('MY GYM'),// style: TextStyle(color: Colors.white),),
                  ],
                ),
                // child: Text("MY GYM"),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 230.0,
              height: 40.0,
              child: RaisedButton(
                color: Colors.black.withOpacity(0.5),
                onPressed: () {
                  Navigator.pushNamed(context, '/my_sessions');
                  // Respond to button press
                },
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('MY SESSIONS'),// style: TextStyle(color: Colors.white),),
                  ],
                ),
                // child: Text("MY SESSIONS"),
              ),
            ),
            Divider(
              height: 60.0,
            ),
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
          Navigator.pushNamed(context, '/infection_control');

        },

      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,

      )
    );
  }
}