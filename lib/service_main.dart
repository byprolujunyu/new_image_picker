import 'dart:async';
import 'dart:io';
import 'picker.dart';
import 'upload_main.dart';

/**
 *使用平台通道调用原生代码
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List datas = List();

  void _getGallery() async {
    var list = await MultiImagePicker.pickImages();
    print(list);
    setState(() {
      datas = list;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("相册"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.movie_creation),
            onPressed: _getGallery,
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 4,
        padding: EdgeInsets.all(5.0),
        children: getWidges(),
      ),
    );
  }

  List<Widget> getWidges() {
    List<Widget> ws = List();
    if (datas != null && datas.length > 0) {
      for (String path in datas) {
        var w = GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return Upload(File(path));
            }));
          },
          child: Container(
            margin: new EdgeInsets.symmetric(horizontal: 5.0),
            child: Image.file(
              File(path),
              width: MediaQuery.of(context).size.width / 4,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        );
        ws.add(w);
      }
    }
    return ws;
  }
}
