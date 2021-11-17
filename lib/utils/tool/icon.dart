import 'package:flutter/cupertino.dart';

class IconFont{
  static Widget iconFont(int icon, Color color, double size ){
    return Icon(IconData(icon,fontFamily: 'myIcon'),color: color, size: size);
  }
}