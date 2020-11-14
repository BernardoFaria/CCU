import 'dart:collection';

import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

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
  List<Quote> quotes = [
    Quote(author: 'Oscar Wilde', text: 'Be yourself; everyone else is already taken'),
    Quote(author: 'Oscar Wilde', text: 'The truth is rarely pure and never simple')
  ];


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
            Container(
              child: RaisedButton(
                color: Colors.black.withOpacity(0.5),
                onPressed: () {
                  // Respond to button press
                },
                child: Text("BOOK IN ADVANCE"),
              ),
            ),
            Container(
              child: RaisedButton(
                color: Colors.black.withOpacity(0.5),
                onPressed: () {
                  // Respond to button press
                },
                child: Text("MY GYM"),
              ),
            ),
            Container(
              child: RaisedButton(
                color: Colors.black.withOpacity(0.5),
                onPressed: () {
                  // Respond to button press
                },
                child: Text("MY SESSIONS"),
              ),
            ),
            Divider(
              height: 60.0,
            ),
            Column(
              children: quotes.map((quote) => Text('${quote.text} - ${quote.author}')).toList(),
            ),
            Column(
              children: quotes.map((quote) => QuoteCard(
                quote: quote,
                delete: (){
                  setState(() {
                    quotes.remove(quote);
                  });
                }
              )).toList(),
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



