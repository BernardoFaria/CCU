import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainsafe/models/user.dart';
import 'package:trainsafe/models/user2.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    final users = Provider.of<List<User>>(context);
    //print(brews.documents);
    users.forEach((user) {
      print(user.uid);
      print(user.reports);
      print(user.activeSessions);
      print(user.expiredSessions);
    });

    return Container();
  }
}
