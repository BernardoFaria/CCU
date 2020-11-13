import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black
  ),
  home: NinjaCard(),
));

class NinjaCard extends StatefulWidget {
  @override
  Home createState() => Home();
}

class Home extends State<NinjaCard> {

  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "TRAINSAFE",
              style: TextStyle(
                color: Colors.orange
              ),
            ),
            Divider(
              height: 60.0,
            ),
            RaisedButton(
              color: Colors.black.withOpacity(0.5),
              onPressed: () {
                // Respond to button press
              },
              child: Text("BOOK IN ADVANCE"),
            ),
            RaisedButton(
              color: Colors.black.withOpacity(0.5),
              onPressed: () {
                // Respond to button press
              },
              child: Text("MY GYM"),
            ),
            RaisedButton(
              color: Colors.black.withOpacity(0.5),
              onPressed: () {
                // Respond to button press
              },
              child: Text("MY SESSIONS"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Spacer(),
            IconButton(icon: Icon(Icons.notifications_rounded), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.error_outline), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,

    );
  }
}

