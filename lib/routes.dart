import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_list/layouts/loginPage.dart';
import 'package:flutter_todo_list/layouts/mainPage.dart';
import 'package:flutter_todo_list/layouts/ImagePage.dart';

class AppRouter {
  Route getRoute(RouteSettings settings, dynamic type) {
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
      case '/image':
        return MaterialPageRoute(builder: (_) => ImagePage());
    }
  }
}
