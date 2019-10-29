import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
Dio dio = Dio();
class Upload extends StatefulWidget {

  File f;

  Upload(this.f);

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '上传照片',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.feedback),
            onPressed: (){
              String base = widget.f.writeAsString("${widget.f}") as String;
              print(base);
            },
          ),
        ],
      ),
    );
  }
}
