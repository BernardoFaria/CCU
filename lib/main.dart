
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
import 'package:trainsafe/services/video.dart';
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

// <<<<<<< HEAD
            brightness: Brightness.dark,

            primaryColor: Colors.black

// =======
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: RichText(
//           text: TextSpan(
//             text: 'TRAINSAFE',
//             style: TextStyle(
//               // fontFamily: 'Spinnaker-Regular',
//               fontWeight: FontWeight.bold,
//               color: Colors.yellow,
//               fontSize: 20,
//             ),
//           ),
//         ),
//         backgroundColor: Colors.black.withOpacity(0.1),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: 150.0,
//               height: 100.0,
//               child: RaisedButton(
//                 color: Colors.black.withOpacity(0.5),
//                 onPressed: () {
//                   // Respond to button press
//                 },
//                 padding: EdgeInsets.all(10.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     Icon(Icons.calendar_today_sharp, color: Colors.white, size: 40),
//                     Text('BOOK IN ADVANCE'),// style: TextStyle(color: Colors.white),),
//                   ],
//                 ),
//                 // child: Text("BOOK IN ADVANCE"),
//               ),
//               // child: Icon(MyFlutterApp),
//             ),
//             SizedBox(height: 20),
//             Container(
//               width: 150.0,
//               height: 100.0,
//               child: RaisedButton(
//                 color: Colors.black.withOpacity(0.5),
//                 onPressed: () {
//                   // Respond to button press
//                 },
//                 padding: EdgeInsets.all(10.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     Icon(Icons.person_pin_sharp, color: Colors.white, size: 40),
//                     Text('MY GYM'),// style: TextStyle(color: Colors.white),),
//                   ],
//                 ),
//                 // child: Text("MY GYM"),
//               ),
//             ),
//             SizedBox(height: 20),
//             Container(
//               width: 150.0,
//               height: 100.0,
//               child: RaisedButton(
//                 color: Colors.black.withOpacity(0.5),
//                 onPressed: () {
//                   // Respond to button press
//                 },
//                 padding: EdgeInsets.all(10.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     Icon(Icons.personal_video_rounded, color: Colors.white, size: 40),
//                     Text('MY SESSIONS'),// style: TextStyle(color: Colors.white),),
//                   ],
//                 ),
//                 // child: Text("MY SESSIONS"),
//               ),
//             ),
//             Divider(
//               height: 60.0,
//             ),
//             // Column(
//             //   children: quotes.map((quote) => Text('${quote.text} - ${quote.author}')).toList(),
//             // ),
//             // Column(
//             //   children: quotes.map((quote) => QuoteCard(
//             //     quote: quote,
//             //     delete: (){
//             //       setState(() {
//             //         quotes.remove(quote);
//             //       });
//             //     }
//             //   )).toList(),
//             // ),
//           ],
// >>>>>>> mygym
        ),

        routes: {

          '/': (context) => Wrapper(),

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

          '/video': (context) => VideoDemo(),

        },

      ),
    );
  }
}