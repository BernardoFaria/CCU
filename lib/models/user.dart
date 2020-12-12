import 'package:flutter/rendering.dart';
import 'package:trainsafe/session.dart';

import '../report.dart';

class User {

  final String uid;
  List<Report> reports = [
    Report(name: 'jose', cc: '***', lastSession: '11/09', covidTest: 'teste.png'),
    Report(name: 'amilcar', cc: '***', lastSession: '12/09', covidTest: 'teste.png')
  ];

  List<Session> activeSessions = [
    Session(date: '12/12/20', begining: '11:00', end: '12:00')
  ];

  List<Session> expiredSessions = [
    Session(date: '13/13/20', begining: '11:00', end: '12:00')
  ];


  String get getUserId{
    return uid;
  }

  List<Report> get reportsList {
    return reports;
  }

  List<Session> get sessionsList {
    return activeSessions;
  }

  void addReport(Report report) {
    reports.add(report) ;
  }

  void addSession(Session session) {
    activeSessions.add(session) ;
  }

  void activeSessionToExpiredSession(Session session) {
    activeSessions.remove(session) ;
    expiredSessions.add(session);
  }

  List reportInfo(List<Report> report){
    List ret = [];
    report.forEach((element) {ret.add( element.name + '|' + element.cc + '|' + element.lastSession + '|' + element.covidTest );} );
    print(ret);
    return ret;
  }

  List sessionInfo(List<Session> session){
    List ret = [];
    session.forEach((element) {ret.add( element.date + '|' + element.begining + '|' + element.end );} );
    return ret;
  }


  User({ this.uid, name, reports, activeSessions, expiredSessions });

}