import 'package:flutter/material.dart';

class InfectionControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/homephoto2.jpg"),
            alignment: Alignment.centerRight,
            fit: BoxFit.cover,
          ),
        ),

        child: text(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 230.0,
              height: 40.0,
              child: RaisedButton(

                color: Colors.black.withOpacity(0.5),
                onPressed: () {
                  Navigator.pushNamed(context, '/book_advance');

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
                  Navigator.pushNamed(context, '/infection_control');
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
            // Column(
            //   children: quotes.map((quote) => Text('${quote.text} - ${quote.author}')).toList(),
            // ),
            // Column(
            //   children: quotes.map((quote) => QuoteCard(
            //     quote: quote,
            //     delete: (){
            //       setState(() {
            //         quotes.remove(quote);
            //       });
            //     }
            //   )).toList(),
            // ),
          ],
        ),
      ),



    );
  }
}

