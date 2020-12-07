import 'package:flutter/material.dart';
import 'session.dart';

class SessionCard extends StatelessWidget {
  final Session session;
  final Function delete;

  SessionCard({this.session, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black.withOpacity(0.8),
      margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              session.date.toString(),
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.white,
              ),
            ),
            Text(
              session.begining.toString(),
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.white,
              ),
            ),
            Text(
              session.end.toString(),
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.white,
              ),
            ),
            FlatButton.icon(
              color: Colors.white,
              onPressed: delete,
              label: Text('Delete'),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      )
    );
  }
}