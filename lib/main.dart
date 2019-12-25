import 'package:flutter/material.dart';
import 'package:flutter_todo_list/layouts/loginPage.dart';
import 'package:flutter_todo_list/layouts/mainPage.dart';
import 'package:flutter_todo_list/providers/userProvider.dart';
import 'package:flutter_todo_list/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'app',
//       home: MultiProvider(
//         providers: [
//           ChangeNotifierProvider(
//             builder: (_) => UserProvider(),
//           )
//         ],
//         child: MainPage(),
//       ),
//       routes: routes,
//     );
//   }
// }

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
        title: 'app',
        // routes: routes,
        initialRoute: '/main',
        onGenerateRoute: _getRoute,
      ),
    );
  }

  //
  Route _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/main':
        print('get route main page');
        print(settings);
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/login':
        print('get route login page');
        print(settings);
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
