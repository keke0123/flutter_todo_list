import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final formController = {
    'id': TextEditingController(),
    'pwd': TextEditingController()
  };
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // SizedBox(
          //   height: 100,
          // ),
          Container(
            margin: EdgeInsets.only(top: height / 4, bottom: 50),
            width: width,
            child: Text(
              'Login Page',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: width / 1.3,
            child: TextField(
              controller: formController['id'],
              decoration: InputDecoration(
                  // border: InputBorder.none,
                  // focusedBorder: InputBorder.none,
                  hintText: '아이디'),
            ),
          ),
          Container(
            width: width / 1.3,
            child: TextField(
              obscureText: true,
              controller: formController['pwd'],
              decoration: InputDecoration(
                  // border: InputBorder.none,
                  // focusedBorder: InputBorder.none,
                  hintText: '패스워드'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            width: width / 1.3,
            height: 40,
            child: RaisedButton(
              child: Text('Submit'),
              onPressed: () => {print(formController)},
            ),
          )
          // FloatingActionButton(
          //   onPressed: () {
          //     return showDialog(
          //         context: context,
          //         builder: (context) {
          //           return AlertDialog(
          //               content: Text(formController['id'].text));
          //         });
          //   },
          //   child: Icon(Icons.text_fields),
          // )
        ],
      ),
    );
  }
}
