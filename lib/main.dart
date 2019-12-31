import 'package:flutter/material.dart';
import 'package:flutter_todo_list/providers/imgProvider.dart';
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
        ),
        ChangeNotifierProvider(
          builder: (_) => ImgProvider(),
        )
        // FutureProvider(
        //   builder: (_) => ImgProvider().loadImgData(1),
        // )
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
        debugShowCheckedModeBanner: false,
        title: 'app',
        initialRoute: '/main',
        onGenerateRoute: (settings) =>
            new AppRouter().getRoute(settings, _data.user));
  }
}
