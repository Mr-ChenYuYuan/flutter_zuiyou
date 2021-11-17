import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Global{
  // ignore: prefer_final_fields, unused_field
  static Brightness brightness  = Brightness.light;
  static Color darkFont = Color.fromRGBO(177, 185, 206, 1);
  static Color darkBg = Color.fromRGBO(36, 38, 51, 1);
  static Color darkHFBg = Color.fromRGBO(29, 29, 41, 1);
  static Color darkBTBg = Color.fromRGBO(42, 44, 59, 1);
  static bool isDark = false;

  Color colorFont = Global.isDark ? Global.darkFont:  Colors.black;
  Color colorBg = Global.isDark ? Global.darkBg :  Colors.white;
  Color colorBTBg = Global.isDark ? Global.darkBTBg :  Colors.white;
  /// 分界线color
  Color colorBorder = Global.isDark ? const Color.fromRGBO(27, 28, 46, 1) : const Color.fromRGBO(251, 251, 251, 1);
}

Map<String, Color> themeColorMap = {
  'gray': Colors.grey,
  'blue': Colors.blue,
  'blueAccent': Colors.blueAccent,
  'cyan': Colors.cyan,
  'deepPurple': Colors.purple,
  'deepPurpleAccent': Colors.deepPurpleAccent,
  'deepOrange': Colors.orange,
  'green': Colors.green,
  'indigo': Colors.indigo,
  'indigoAccent': Colors.indigoAccent,
  'orange': Colors.orange,
  'purple': Colors.purple,
  'pink': Colors.pink,
  'red': Colors.red,
  'teal': Colors.teal,
  'black': Colors.black,
};

Map<String, Brightness> themeBrightnessMap = {
  'light': Brightness.light,
  'dark': Brightness.dark,
};