import 'package:trainsafe/models/user.dart';

class ScreenArguments {
  final User user;
  final List<User> userList;

  ScreenArguments(this.user, this.userList);
}