// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zuiyou/global/variable.dart';

/// ListView 加载动画效果 用于首页item
/// 
class WorkOrderCheckItem extends StatelessWidget {
  const WorkOrderCheckItem({Key ? key, required this.index, required this.child}) : super(key: key);

  final int index; // ListView Item 索引

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Global.isDark ? const Color.fromRGBO(29, 29, 41, 1) : Colors.grey[200],
      child: buildAnimationWidget(context),
    );
  }

  AnimationWidget buildAnimationWidget(context){
    return AnimationWidget(
      duration: 400 + index % 3 *100,
      child: child
    );
  }
}


class AnimationWidget extends StatefulWidget {
  const AnimationWidget({Key ? key,required this.child,this.duration = 200}) : super(key: key);
  final Widget child;
  final int duration; 

  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> with SingleTickerProviderStateMixin{
  // 动画控制器
  late AnimationController _controller;

  // AnimationController 是一个特殊的Animation对象，在屏幕刷新的每一帧，就会生成一个新的值。
  // 默认情况下 AnimationController 在给定的时间段内会线性的生成从0.0到1.0的数字 用来控制动画的开始与结束以及设置的监听
  // vsync 参数，存在vsync时会防止屏幕外动画， 消耗不必要的资源
  // duration 动画的时长，这里设置 seconds:2 为2秒，当然也可以设置毫秒 milliseconds: 2000
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller =AnimationController(vsync: this,
    duration: Duration(milliseconds: widget.duration));

    _animation =  Tween(
      begin: const Offset(0,0.04),
      end: const Offset(0,0)
    ).animate(_controller);

    
      _controller.forward();

  }


  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}