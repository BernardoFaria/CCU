import 'package:flutter/material.dart';

class InfectionControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('infection control'),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.arrow_back_ios_rounded), onPressed: () {                  Navigator.pushNamed(context, '/home');
            }),
            Spacer(),
            IconButton(icon: Icon(Icons.notifications_rounded), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}