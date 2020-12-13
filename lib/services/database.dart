import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:trainsafe/models/user.dart';
import 'package:trainsafe/models/user2.dart';
import 'package:trainsafe/report.dart';
import 'package:trainsafe/session.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference userDataCollection = Firestore.instance.collection('userData');

  Future<void> updateUserData(String name, List reports, List activeSessions, List expiredSessions, ) async {
    return await userDataCollection.document(uid).setData({
      'uid': uid,
      'reports' : reports,
      'activeSessions' : activeSessions,
      'expiredSessions' : expiredSessions,
    });
  }


  // brew list from snapshot
  List<User> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      var reports = [];
      var activeSessions = [];
      var expiredSessions = [];

      doc.data['reports'].forEach((x) {
        var xx = x.split('|');
        reports.add(Report(name: xx[0], cc : xx[1], lastSession: xx[2], covidTest: xx[3])); });
      doc.data['activeSessions'].forEach((x) {
        var xx = x.split('|');
        activeSessions.add(Session(date: xx[0], begining: xx[1], end: xx[2])); });
      doc.data['expiredSessions'].forEach((x) {
        var xx = x.split('|');
        expiredSessions.add(Session(date: xx[0], begining: xx[1], end: xx[2])); });
      print(activeSessions.length);
      return User(
          uid: doc.data['uid'],
          reports: reports ?? [],
          activeSessions: activeSessions ?? [],
          expiredSessions: expiredSessions ?? []
      );
    }).toList();
  }

  // get brews stream
  Stream<List<User>> get users {
    return userDataCollection.snapshots()
        .map(_brewListFromSnapshot);
  }

}