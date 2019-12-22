import 'package:flutter/material.dart';
import 'package:flutter_todo_list/layouts/mainPage.dart';
import 'package:flutter_todo_list/providers/userProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            builder: (_) => UserProvider(),
          )
        ],
        child: MainPage(),
      ),
    );
  }
}
