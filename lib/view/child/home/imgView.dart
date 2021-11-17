// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zuiyou/data/data.dart';
import 'package:zuiyou/utils/tool/imagesView.dart';

class ImgView extends StatefulWidget {
  ImgView({Key ? key,required this.arguments}) : super(key: key);
  Map arguments;

  @override
  _ImgViewState createState() => _ImgViewState(arguments:this.arguments);
}

class _ImgViewState extends State<ImgView> {
  Map arguments;
  _ImgViewState({required this.arguments});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotpGalleryPage(
        photoList: item[int.parse(arguments['id'])]["tu"],
        index: arguments['index']
      ),
    );
  }
}