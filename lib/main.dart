import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zuiyou/global/variable.dart';
import 'package:zuiyou/utils/route/route.dart';

import 'global/app_provider.dart';

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var _themeColor;
  Brightness _themeBrightness = Global.brightness;
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: AppInfoProvider())],
      child: Consumer<AppInfoProvider>(
        builder: (context,appInfo,_){
          String colorKey = appInfo.themeColor;
          String brightnessKey = appInfo.themeBrightness;
          if(themeColorMap[colorKey] != null){
            _themeColor = themeColorMap[colorKey];
          }
          if(themeBrightnessMap[brightnessKey] != null){
            _themeBrightness = themeBrightnessMap[brightnessKey] as Brightness;
          }
          return MaterialApp(
            initialRoute: '/test',
            onGenerateRoute: onRoute,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(backgroundColor: Colors.blue,brightness: _themeBrightness),
          );
        },
      ),
    );
  }
}