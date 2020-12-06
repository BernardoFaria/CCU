import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainsafe/report_card.dart';

import '../report.dart';

class InfectionControl extends StatefulWidget {
  @override
  _InfectionState createState() => _InfectionState();
}

class _InfectionState extends State<InfectionControl> {
  String s ='ola';

  List<Report> reports = [
    Report(name: '*****', cc: '*****', lastSession: '11/09', covidTest: 'teste.png'),
    Report(name: '*****', cc: '*****', lastSession: '12/09', covidTest: 'teste.png')
  ];

  Report data;

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    if (data != null) { reports.add(data); } //: print("data is null");

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/homephoto2.jpg"),
            alignment: Alignment.centerRight,
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: SizedBox(
                width: 400.0,
                height: 500.0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      SizedBox(),

                      Column(

                        children: reports.map((quote) => ReportCard(quote: quote)).toList(),
                      ),

                      RaisedButton(

                        color: Colors.black.withOpacity(0.5),
                        onPressed: () {
                          Navigator.pushNamed(context, '/report_infection');

                          // Respond to button press
                        },
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('REPORT CASE'),
                          ],
                        ),
                      )

                    ]
                ),
              ),
            )
        )

    );
  }
}










