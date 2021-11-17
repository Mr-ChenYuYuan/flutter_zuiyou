import 'package:flutter/cupertino.dart';

class AppInfoProvider with ChangeNotifier {
  String _themeColor = '';
  String _themeBrightness = '';
 
  String get themeColor => _themeColor;
  String get themeBrightness => _themeBrightness;
 
  setTheme(String themeColor) {
    _themeColor = themeColor;
    notifyListeners();
  }

  setBrightness(String themeBrightness) {
    _themeBrightness = themeBrightness;
    notifyListeners();
  }
}