// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/cupertino.dart';




class MyBehavior  extends ScrollBehavior{//取消顶部波纹
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails axisDirection) {
    if(Platform.isAndroid||Platform.isFuchsia){
      return child;
    }else{
      return super.buildOverscrollIndicator(context,child,axisDirection);
    }
  }
}

// class MyBehavior  extends ScrollBehavior{//取消顶部波纹
//   @override
//   Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
//     if(Platform.isAndroid||Platform.isFuchsia){
//       return child;
//     }else{
//       return super.buildViewportChrome(context,child,axisDirection);
//     }
//   }
// }