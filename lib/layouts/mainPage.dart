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
    // widget 말고 다른곳에선 liten false 로 해줘야 되는거 같다.
    UserProvider _data = Provider.of<UserProvider>(context, listen: false);
    print(_data.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider _data = Provider.of<UserProvider>(context);
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
          }()),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.collections),
              onPressed: () {
                print('go to image page');
                Navigator.of(context).pushNamed('/image');
              },
            ),
            IconButton(
              icon: Icon(Icons.colorize),
              onPressed: () {
                Navigator.of(context).pushNamed('/color');
              },
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _data.user = {'id': null, 'pwd': null};
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[Container()],
        ));
  }
}
