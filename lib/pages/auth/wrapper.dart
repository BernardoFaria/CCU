
import 'package:provider/provider.dart';
import 'package:trainsafe/models/user.dart';
import 'package:trainsafe/pages/home.dart';
import 'package:flutter/material.dart';

import 'auth.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    // return either the Home or Authenticate widget
    if (user == null){
      return Auth();
    } else {
      return Homee();
    }
  }
}