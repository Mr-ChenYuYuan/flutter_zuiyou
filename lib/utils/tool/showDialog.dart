import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Show{
  /// 从底部弹出,context页面的上下文、child页面设计子组件,color设置弹窗的背景色,height设置弹窗高度
  getShowModalBottomSheet(BuildContext context,Color color,double height,Widget child,) {
    showModalBottomSheet(
      context: context,
      backgroundColor: color,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      builder: (context) {
        return Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          color: color,
          margin: const EdgeInsets.only(top:20),
          child: child,
        );
      }
    );
  }
  /// ios风格 底部提示弹窗; context页面的上下文;title 提示的title ; message 提示的内容;
  getShowCupertinoModalPopup(BuildContext context,String title,String message){
    showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        title: Text(title),
        message: Text(message),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text('删除'),
            onPressed: () {},
            isDefaultAction: true,
          ),
          CupertinoActionSheetAction(
            child: Text('暂时不删'),
            onPressed: () {},
            isDestructiveAction: true,
          ),
        ],
      );
    }
);
  }
}