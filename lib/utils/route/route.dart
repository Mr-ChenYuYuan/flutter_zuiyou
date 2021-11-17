import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zuiyou/view/child/home/articleInfo.dart';
import 'package:zuiyou/view/child/home/imgView.dart';
import 'package:zuiyou/view/community.dart';
import 'package:zuiyou/view/home.dart';
import 'package:zuiyou/view/index.dart';
import 'package:zuiyou/view/loading.dart';
import 'package:zuiyou/view/message.dart';
import 'package:zuiyou/view/my.dart';
import 'package:zuiyou/view/test.dart';

Map<String,Function> route = {
  '/test': (context) => Test(),
  '/': (context) => Index(),
  '/loading': (context) => Loading(),
  '/home': (context) => Home(),
  '/community': (context) => Community(),
  '/message': (context) => Message(),
  '/my': (context) => My(),
  '/articleInfo': (context,{arguments}) => ArticleInfo(arguments:arguments), // 帖子详情
  '/imgview': (context,{arguments}) => ImgView(arguments:arguments), // 图片View视图
};

/// 监听路由函数
// ignore: prefer_function_declarations_over_variables
var onRoute = (RouteSettings settings){
  /// 获取路由的键
  String? name = settings.name;
  /// 获取路由的值
  Function pageContextButtilder = route[name] as Function;

  if(pageContextButtilder != null){
    if(settings.arguments != null){
      Route r = MaterialPageRoute(
        builder: (context) => pageContextButtilder(context,arguments:settings.arguments)
      );
      return r;
    }else{
      Route r = MaterialPageRoute(
        builder: (context) => pageContextButtilder(context)
      );
      return r;
    }
  }

};