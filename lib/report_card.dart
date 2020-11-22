import 'package:flutter/material.dart';
import 'report.dart';

class ReportCard extends StatelessWidget {
  final Report quote;
  final Function delete;

  ReportCard({ this.quote, this.delete });


  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                quote.name,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
              Text(
                quote.cc.toString(),
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
              Text(
                quote.lastSession,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
              Text(
                quote.covidTest,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
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