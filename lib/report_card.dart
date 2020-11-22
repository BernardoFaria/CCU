import 'package:flutter/material.dart';
import 'report.dart';

class ReportCard extends StatelessWidget {
  final Report quote;
  final Function delete;

  ReportCard({ this.quote, this.delete });


  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(1.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                quote.name,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 2.0),
              Text(
                quote.cc.toString(),
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[800],
                ),
              ),
              Text(
                quote.lastSession.toString(),
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[800],
                ),
              ),
              Text(
                quote.covidTest.toString(),
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[800],
                ),
              ),
              FlatButton.icon(
                onPressed: delete,
                label: Text('delete quote'),
                icon: Icon(Icons.delete),
              )
            ],
          ),
        )
    );
  }
}