import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_todo_list/models/image.dart';
import 'package:http/http.dart' as http;

class ImgProvider extends ChangeNotifier {
  List<Img> _imgs = new List();
  List<Img> get imgs => _imgs;
  // set imgs(dynamic list) {
  //   _imgs = list;
  //   notifyListeners();
  // }

  Future<List<Img>> loadImgData(num) async {
    print('load img data');
    var res = await loadAsset(num);
    // print(res);
    print('response status code : ${res.statusCode}');
    if (res.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(res.body).toList();
      // print(jsonData[0]);
      _imgs = jsonData.map((val) => Img.fromJson(val)).toList();
    }
    notifyListeners();
    // print(imgs);
    // imgs.add(new Img('test', 'test', 1, 2, 'test', 'test'));
    return _imgs;
  }

  Future<http.Response> loadAsset(num) async {
    print('load asset');
    return await http.get('https://picsum.photos/v2/list?page=${num}');
  }
}
