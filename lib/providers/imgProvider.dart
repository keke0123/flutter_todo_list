import 'dart:convert';

import 'package:flutter_todo_list/models/image.dart';
import 'package:http/http.dart' as http;

class ImgProvider {
  List<Img> imgs = new List();

  Future<List<Img>> loadImgData() async {
    print('load img data');
    var res = await loadAsset();
    // print(res);
    print('response status code : ${res.statusCode}');
    if (res.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(res.body).toList();
      // print(jsonData[0]);
      imgs = jsonData.map((val) => Img.fromJson(val)).toList();
    }
    // print(imgs);
    // imgs.add(new Img('test', 'test', 1, 2, 'test', 'test'));
    return imgs;
  }

  Future<http.Response> loadAsset() async {
    print('load asset');
    return await http.get('https://picsum.photos/v2/list');
  }
}
