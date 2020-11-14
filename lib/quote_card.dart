import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function delete;

  QuoteCard({ this.quote, this.delete });


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
                quote.text,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 2.0),
              Text(
                quote.author,
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