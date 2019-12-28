import 'package:flutter/material.dart';
import 'package:flutter_todo_list/layouts/loginPage.dart';
import 'package:flutter_todo_list/layouts/mainPage.dart';
import 'package:flutter_todo_list/providers/userProvider.dart';
import 'package:flutter_todo_list/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => UserProvider(),
        )
      ],
      child: AppSub(),
    );
  }
}

class AppSub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserProvider _data = Provider.of<UserProvider>(context);
    print('App Sub');
    // _data.user = {'id': 'test user', 'pwd': '123123'};
    return MaterialApp(
      title: 'app',
      // routes: routes,
      initialRoute: '/main',
      onGenerateRoute: (settings) => _getRoute(settings, _data.user),
    );
  }

  //
  Route _getRoute(RouteSettings settings, dynamic type) {
    print('generate router');
    print(type);
    switch (settings.name) {
      // switch (type) {
      case '/main':
        print('get route main page');
        if (type == null) {
          return MaterialPageRoute(builder: (_) => LoginPage());
        }
        // print(settings);
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/login':
        print('get route login page');
        // print(settings);
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
