import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_todo_list/providers/userProvider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final formController = {
    'id': TextEditingController(),
    'pwd': TextEditingController()
  };
  // final formKey = {'id': GlobalKey<FormState>(), 'pwd': GlobalKey<FormState>()};
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    UserProvider _data = Provider.of<UserProvider>(context);
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
            child: TextFormField(
              controller: formController['id'],
              decoration: InputDecoration(
                labelText: 'id',
                // border: InputBorder.none,
                // focusedBorder: InputBorder.none,
                // hintText: '아이디'
              ),
            ),
          ),
          Container(
            width: width / 1.3,
            child: TextFormField(
              // key: formKey['pwd'],
              obscureText: true,
              controller: formController['pwd'],
              decoration: InputDecoration(
                labelText: 'pwd',
                // border: InputBorder.none,
                // focusedBorder: InputBorder.none,
                // hintText: '패스워드'
              ),
              validator: (value) {
                print('validation');
                return 'pwd good';
              },
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 15),
              width: width / 1.3,
              height: 40,
              child: new Builder(
                builder: (context) {
                  return RaisedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      print('submit');
                      print(context);
                      print(formController['id'].text);
                      print(formController['pwd'].text);
                      print(formController['pwd']);
                      if (formController['id'].text.isEmpty ||
                          formController['pwd'].text.isEmpty) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('ID or PWD 를 입력해 주세요'),
                        ));
                        return null;
                      }
                      _data.user = {
                        'id': formController['id'].text,
                        'pwd': formController['pwd'].text
                      };
                      Navigator.of(context).pushReplacementNamed('/main');
                    },
                  );
                },
              ))
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
