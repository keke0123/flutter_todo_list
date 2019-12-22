import 'package:flutter/cupertino.dart';
import 'package:flutter_todo_list/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user;
  User get user => _user;

  set user(dynamic data) {
    // dynamic 은 안좋아 보이는데
    _user = new User(data['id'], data['pwd']);
    notifyListeners();
  }

  // String _test = '';
  // String get test => _test;
  // void set test(String str) {
  //   test = str;
  // }

  // UserProvider() {}
}
