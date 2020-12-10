import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainsafe/models/user.dart';
import 'package:trainsafe/report_card.dart';

import '../report.dart';

class InfectionControl extends StatefulWidget {
  @override
  _InfectionState createState() => _InfectionState();
}

class _InfectionState extends State<InfectionControl> {


  List<Report> reports = [
    Report(name: '*****', cc: '*****', lastSession: '11/09', covidTest: 'teste.png'),
    Report(name: '*****', cc: '*****', lastSession: '12/09', covidTest: 'teste.png')
  ];

  User data;

  IconData iconState = false ? Icons.error_outline : Icons.arrow_drop_down_circle_outlined;

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;


    //if (data != null) { reports.add(data); } //: print("data is null");

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back11.jpg"),
            alignment: Alignment.centerRight,
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: SizedBox(
                width: 370.0,
                height: 650.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text('Reports',
                          style: TextStyle(fontSize: 50,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold)
                        ),
                      ),
                      SizedBox(),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 410.0,
                        child: ListView(
                        scrollDirection: Axis.vertical,
                        children: data.reportsList.map((quote) => ReportCard(quote: quote)).toList(),
                      ),
                      ),

                      SizedBox(height: 20),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.grey.withOpacity(0))
                        ),
                        color: Colors.grey.withOpacity(0.3),
                        onPressed: () {
                          Navigator.pushNamed(context, '/report_infection',arguments: data);
                          // Respond to button press
                        },
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('REPORT CASE',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ]
                  ),
                ),
              ),
            ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.black.withOpacity(1.0),
            child: Row(
              children: [
                Spacer(),
                IconButton(icon: Icon(Icons.keyboard_return), onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home', arguments: data);
                }),
                Spacer(flex: 200),
                IconButton(icon: Icon(Icons.notifications_rounded), onPressed: () {}),
              ],
            ),
          ),

        )
    );
  }
}










