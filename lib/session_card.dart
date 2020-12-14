import 'package:flutter/material.dart';
import 'session.dart';

class SessionCard extends StatelessWidget {
  final Session session;
  final Function delete;

  SessionCard({this.session, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.withOpacity(0.5),
      margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Day: ' + session.date.toString(),
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'OpenSans',
                color: Colors.white,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Begining Time: ' + session.begining.toString(),
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'OpenSans',
                color: Colors.white,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'End Time: ' + session.end.toString(),
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'OpenSans',
                color: Colors.white,
              ),
            ),
            FlatButton.icon(
              color: Colors.transparent,
              onPressed:() {
                delete(session);
                Navigator.pushReplacementNamed(context, '/');
              },
              label: Text('Delete'),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      )
    );
  }
}