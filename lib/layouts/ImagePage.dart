import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_list/models/image.dart';
import 'package:flutter_todo_list/providers/imgProvider.dart';
import 'package:flutter_todo_list/providers/userProvider.dart';
// web 에서는 사용불가
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  String imageUrl = '';
  // List imageList = []; // 아무래도 인코딩방식에서 이런 방식은 지양해야될듯 하다.
  List<dynamic> imageList = new List();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // UserProvider _data = Provider.of<UserProvider>(context);
    // UserProvider _data = Provider.of(context);
    // dynamic _imgs = Provider.of<List<Img>>(context);
    ImgProvider _imgs = Provider.of<ImgProvider>(context);
    print(_imgs);
    // print(_imgs.length);

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
              child: imageUrl != ''
                  ? Image.network(
                      imageUrl,
                      width: width,
                    )
                  : null,
            ),
            Builder(builder: (context) {
              return RaisedButton(
                child: Text('get image'),
                onPressed: () {
                  print('get image');
                  fetchData();
                },
              );
            }),
            Builder(builder: (context) {
              return RaisedButton(
                child: Text('get image'),
                onPressed: () async {
                  print('reload image list');
                  // 이렇게 함수 보내면 다시 만들어 지나?
                  // ImgProvider().loadImgData(2);
                  //
                  await _imgs.loadImgData(1);
                  print(_imgs.imgs);
                },
              );
            }),
            Container(
                width: width,
                child: ((() {
                  if (_imgs.imgs.length > 0) {
                    String total = _imgs.imgs.map((val) => val.url).toString();
                    return Text(total);
                  }
                })()))
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
        // print(v[0]['download_url']);
        // var test = v.map((val) => val['download_url']).toList();
        // print(test);
        setState(() {
          imageUrl = v[0]['download_url'];
          imageList = v.map((val) => val['download_url']).toList();
        });
      }
      print('???');
      // print(result);
    } catch (err) {
      print('error ${err}');
    }
  }
}
