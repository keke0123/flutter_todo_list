import 'package:flutter/material.dart';
import 'package:flutter_todo_list/providers/userProvider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserProvider _data = Provider.of<UserProvider>(context);
    // _data.user = {'id': 'test user', 'pwd': '123123'};
    // print(_data.user);
    return Scaffold(
        appBar: AppBar(
            title: _data.user != null
                ? Text('${_data.user.id} page')
                : Text('no user')
            //
            ),
        body: Center(
          child: FlatButton(
              onPressed: () {
                // Object _user = {'id': 'test user', 'pwd': '123123'};
                _data.user = {'id': 'test user', 'pwd': '123123'};
              },
              child: Text('click me!')),
        ));
  }
}
