import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/block_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_colorpicker/material_picker.dart';

class ColorPage extends StatefulWidget {
  @override
  _ColorPageState createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  String currentText = 'test';
  //
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // print(width);
    return Scaffold(
        appBar: AppBar(
          title: Text('color picker page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: width,
              alignment: Alignment(1.0, 1.0),
              child: Text(
                'current color : ${currentText}',
                style: TextStyle(color: currentColor),
              ),
            ),
            Container(
              child: RaisedButton(
                elevation: 3.0,
                child: Text('pick color'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          // titlePadding: const EdgeInsets.all(0.0),
                          // contentPadding: const EdgeInsets.all(0.0),
                          title: const Text('pick a color'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: pickerColor,
                              onColorChanged: changeColor,
                              enableLabel: true,
                              pickerAreaHeightPercent: 0.8,
                            ),
                            // use material color picker
                            // child: MaterialPicker(
                            //   pickerColor: pickerColor,
                            //   onColorChanged: changeColor,
                            //   enableLabel: true,
                            // ),
                            // use block color picker
                            // child: BlockPicker(
                            //   pickerColor: currentColor,
                            //   onColorChanged: changeColor,
                            // ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: const Text('got it'),
                              onPressed: () {
                                setState(() => currentColor = pickerColor);
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      });
                },
              ),
            ),
          ],
        ));
  }
}
