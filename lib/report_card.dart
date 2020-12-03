import 'package:flutter/material.dart';
import 'report.dart';

class ReportCard extends StatelessWidget {
  final Report quote;
  final Function delete;

  ReportCard({ this.quote, this.delete });


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
                 quote.name,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.white,
                ),
              ),
              Text(
                  quote.cc.toString(),
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.white,
                ),
              ),
              Text(
                quote.lastSession,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.white,
                ),
              ),
              Text(
                quote.covidTest,
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
              )
            ],
          ),
        )
    );
  }
}