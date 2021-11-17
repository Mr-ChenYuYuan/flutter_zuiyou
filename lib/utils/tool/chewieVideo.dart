// ignore_for_file: file_names

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


/// 必传参数 String:url; 
/// 可传可不传参数 
/// bool:autoPlay; 自动播放; 默认: false
/// bool:looping; 循环播放; 默认: false
/// double:aspectRatio; 视频比例; 默认:3/2
class ChewieVideoPage extends StatefulWidget {
    ChewieVideoPage({Key ? key,required this.url,this.autoPlay = false,this.looping = false,this.aspectRatio = 3/2}) : super(key: key);
    /// 视频地址
    String url; 
    /// 自动播放
    bool autoPlay; 
    /// 循环
    bool looping; 
    /// 比例
    double aspectRatio;

    @override
    _ChewieVideoPageState createState() => _ChewieVideoPageState();
}
 
class _ChewieVideoPageState extends State<ChewieVideoPage> {
 
    // 声明控制器(两个)
    late VideoPlayerController videoPlayerController;
    late ChewieController chewieController;
 
    void initState(){
        super.initState();
        // 生成控制器(两个)
        videoPlayerController=VideoPlayerController.network(widget.url);
        chewieController = ChewieController(
            videoPlayerController: videoPlayerController,
            // 比例
            aspectRatio: widget.aspectRatio,
            // 自动播放
            autoPlay: widget.autoPlay,
            // 循环
            looping: widget.looping,
        );
    }
 
    @override
    void dispose() {
        // 销毁播放器的控制器
        videoPlayerController.dispose();
        chewieController.dispose();
        super.dispose();
    }
 
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title:Text('在线视频播放')
            ),
            // 加载播放器
            body:Chewie(
                controller: chewieController,
            )
 
        );
        
    }
}