import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// web 에서는 사용불가
import 'package:http/http.dart' as http;

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text('Image Page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: width,
              child: Text(
                'image page',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: width,
              child: Image.network(
                imageUrl,
                width: width,
              ),
            ),
            Builder(builder: (context) {
              return RaisedButton(
                child: Text('get image'),
                onPressed: () {
                  print('get image');
                  fetchData();
                },
              );
            })
          ],
        ));
  }

  fetchData() async {
    try {
      // web 에서는 사용 불가
      // var res = await http.get('https://picsum.photos/v2/list',
      //     headers: {"Accept": "application/json"});
      var res = await http.get('https://picsum.photos/v2/list');
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        var v = json.decode(res.body);
        print(v[0]['download_url']);
        setState(() {
          imageUrl = v[0]['download_url'];
        });
      }
      print('???');
      // print(result);
    } catch (err) {
      print('error ${err}');
    }
  }
}
