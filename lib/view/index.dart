import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zuiyou/global/variable.dart';

import 'community.dart';
import 'home.dart';
import 'message.dart';
import 'my.dart';

class Index extends StatefulWidget {

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

  int _currentIndex = 0;
  List _pageIndex = [
    Home(),
    Community(),
    Message(),
    My()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._pageIndex[this._currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: Global().colorBg,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Container(
          height: 55,
          child: Row(
          children: [
            
            InkResponse(
              highlightColor: Colors.transparent,
              radius: 0.0,
              child: Container(
                height: 55,
                padding: EdgeInsets.only(top:8),
                child: Column(
                  children: [
                    Center(child: Icon(IconData(0xe608,fontFamily: 'myIcon'),color: _currentIndex == 0 ? Colors.blue: Global().colorFont)),
                    Center(child: Text('最右',style: TextStyle(color: Global().colorFont)))
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  this._currentIndex = 0;
                });
              },
            ),
              
            InkResponse(
              highlightColor: Colors.transparent,
              radius: 0.0,
              child: Container(
                height: 55,
                padding: EdgeInsets.only(top:8),
                child: Column(
                  children: [
                    Center(child: Icon(IconData(0xe628,fontFamily: 'myIcon'),color: _currentIndex == 1 ? Colors.blue: Global().colorFont)),
                    Center(child: Text('社区',style: TextStyle(color: Global().colorFont)))
                    
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  this._currentIndex = 1;
                });
              },
            ),
            SizedBox(width: 30,), //中间位置空出
            InkResponse(
              highlightColor: Colors.transparent,
              radius: 0.0,
              child: Container(
                height: 55,
                padding: EdgeInsets.only(top:8),
                child: Column(
                  children: [
                    Center(child: Icon(IconData(0xe638,fontFamily: 'myIcon'),color: _currentIndex == 2 ? Colors.blue: Global().colorFont)),
                    Center(child: Text('消息',style: TextStyle(color: Global().colorFont)))
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  this._currentIndex = 2;
                });
              },
            ),
            InkResponse(
              highlightColor: Colors.transparent,
              radius: 0.0,
              child: Container(
                height: 55,
                padding: EdgeInsets.only(top:8),
                child: Column(
                  children: [
                    Center(child: Icon(IconData(0xe69b,fontFamily: 'myIcon'),color: _currentIndex == 3 ? Colors.blue: Global().colorFont)),
                    Center(child: Text('我的',style: TextStyle(color: Global().colorFont)))
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  this._currentIndex = 3;
                });
              },
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton( //悬浮按钮
          backgroundColor: Colors.blue,
          child: Icon(Icons.add,color: Global().colorFont),
          onPressed:(){}
      ),
    );
  }
}