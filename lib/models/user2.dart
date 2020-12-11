import 'package:flutter/rendering.dart';
import 'package:trainsafe/session.dart';

import '../report.dart';

class User2 {

  final String uid;
  List<List> reports = [
    ['jose', '***', '11/09', 'teste.png'],
    ['manel', '***', '11/09', 'teste.png'],
  ];

  List<List> activeSessions = [
    ['12/12/20', '11:00', '12:00']
  ];

  List<List> expiredSessions = [
    ['12/12/20', '11:00', '12:00']
  ];


  String get getUser2Id{
    return uid;
  }

  List<List> get reportsList {
    return reports;
  }

  List<List> get sessionsList {
    return activeSessions;
  }

 /* void addReport(Report report) {
    reports.add(report) ;
  }

  void addSession(Session session) {
    activeSessions.add(session) ;
  }

  void activeSessionToExpiredSession(Session session) {
    activeSessions.remove(session) ;
    expiredSessions.add(session);
  }*/

  User2({ this.uid, name, reports, activeSessions, expiredSessions });

}