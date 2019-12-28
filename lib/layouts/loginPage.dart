import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final formController = {
    'id': TextEditingController(),
    'pwd': TextEditingController()
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('login page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Center(
            child: Text(
              'login page',
              textAlign: TextAlign.center,
            ),
          ),
          Center(
              child: TextField(
            controller: formController['id'],
          )),
          FloatingActionButton(
            onPressed: () {
              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        content: Text(formController['id'].text));
                  });
            },
            child: Icon(Icons.text_fields),
          )
        ],
      ),
    );
  }
}
