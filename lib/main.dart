
import 'package:flutter/material.dart';
import 'package:trainsafe/pages/auth/auth.dart';
import 'package:trainsafe/pages/auth/register.dart';
import 'package:trainsafe/pages/auth/wrapper.dart';
import 'package:trainsafe/pages/book_advance.dart';
import 'package:trainsafe/pages/infection_control.dart';
import 'package:trainsafe/pages/report_infection.dart';

import 'package:trainsafe/pages/loading.dart';
import 'package:trainsafe/pages/mygym.dart';
import 'package:trainsafe/pages/training_plan.dart';
import 'package:trainsafe/pages/mysessions.dart';
import 'package:trainsafe/services/authservice.dart';
import 'models/user.dart';
import 'report.dart';
import 'report_card.dart';
import 'session.dart';
import 'session_card.dart';
import 'pages/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(

        initialRoute: '/',

        theme: ThemeData(

            brightness: Brightness.dark,

            primaryColor: Colors.black

        ),

        routes: {

          '/': (context) => Loading(),

          '/auth': (context) => Auth(),

          '/register': (context) => Register(),

          '/wrapper': (context) => Wrapper(),

          '/home': (context) => Homee(),

          '/infection_control': (context) => InfectionControl(),

          '/report_infection': (context) => ReportInfection(),

          '/book_advance': (context) => BookAdvance(),

          '/my_gym': (context) => MyGym(),

          '/training_plan': (context) => TrainingPlan(),

          '/my_sessions': (context) => MySessions(),

        },

      ),
    );
  }
}