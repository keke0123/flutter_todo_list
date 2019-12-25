import 'package:flutter/material.dart';
import 'package:flutter_todo_list/providers/userProvider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    print('init state');
    print(context);
    _checkAuth();
    super.initState();
  }

  _checkAuth() {
    print('check auth');
    // print(_data);
    UserProvider _data = Provider.of<UserProvider>(context, listen: false);
    print(_data.user);
    if (_data.user == null) {
      print('navigator active');
      // Navigator.of(context).pushReplacementNamed('/login');
      print('?');
      // Navigator.of(context).pushNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    UserProvider _data = Provider.of<UserProvider>(context);
    // UserProvider _data = Provider.of<UserProvider>(context, listen: true);
    // UserProvider _data = Provider.of<UserProvider>(context);
    // _data.user = {'id': 'test user', 'pwd': '123123'};
    // if (_data.user == null) {
    // print('data: ${_data.user}');
    // Navigator.of(context).pushReplacementNamed('/login');
    // Navigator.of(context).pushNamed('/login');
    // }
    //
    // return Scaffold(
    //     appBar: AppBar(
    //         // title: _data.user != null
    //         //     ? Text('${_data.user.id} page')
    //         //     : Text('no user')
    //         // //
    //         title: (() {
    //       if (_data.user != null) {
    //         return Text('${_data.user.id} page');
    //       } else {
    //         return Text('no user');
    //       }
    //     }())),
    //     body: Center(
    //       child: FlatButton(
    //           onPressed: () {
    //             // Object _user = {'id': 'test user', 'pwd': '123123'};
    //             _data.user = {'id': 'test user', 'pwd': '123123'};
    //             // Navigator.of(context).pushNamed('/login');
    //             Navigator.of(context).pushReplacementNamed('/login');
    //           },
    //           child: Text('click me!')),
    //     ));
    //
    return Scaffold(
        appBar: AppBar(
            // title: _data.user != null
            //     ? Text('${_data.user.id} page')
            //     : Text('no user')
            // //
            title: (() {
          if (_data.user != null) {
            return Text('${_data.user.id} page');
          } else {
            return Text('no user');
          }
        }())),
        body: Center(
          child: FlatButton(
              onPressed: () {
                // Object _user = {'id': 'test user', 'pwd': '123123'};
                _data.user = {'id': 'test user', 'pwd': '123123'};
                // Navigator.of(context).pushNamed('/login');
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: Text('click me!')),
        ));
  }
}
