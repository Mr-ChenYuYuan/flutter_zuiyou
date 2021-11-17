import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:animations/animations.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:zuiyou/utils/tool/chewieVideo.dart';
import 'package:zuiyou/utils/tool/imagesView.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';


class Test extends StatefulWidget {

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  List item = [];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: MyHomePage()
      )
    );
  }
 
}

// class ListViewTest extends StatelessWidget {
//   const ListViewTest({Key ? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child:ListView.builder(
//           itemCount: 20,
//           cacheExtent: 0,
//           itemBuilder: (context, index){
//             return WorkOrderCheckItem(
//               index: index,
//               item: item,
//               child: Container(
//                 padding: const EdgeInsets.all(10),
//                 color: Colors.white,
//                 height: 130,
//                 width: MediaQuery.of(context).size.width,
//               )
//             );
//           },
//         )
//       );
//   }
// }

// class WorkOrderCheckItem extends StatelessWidget {
//   WorkOrderCheckItem({Key ? key, required this.index, required this.item,required this.child}) : super(key: key);

//   final int index; // ListView Item 索引

//   final List  item; // ListView Item 数据

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     double top = index == 0 ? 5 : 0;
//     return Container(
//       color: Colors.grey[200],
//       padding: EdgeInsets.only(top: top,bottom: 12),
//       child: buildAnimationWidget(context),
//     );
//   }

//   AnimationWidget buildAnimationWidget(context){
//     return AnimationWidget(
//       duration: 400 + index % 3 *100,
//       child: child
//     );
//   }
// }


// class AnimationWidget extends StatefulWidget {
//   AnimationWidget({Key ? key,required this.child,this.duration = 200}) : super(key: key);
//   final Widget child;
//   final int duration; 

//   @override
//   _AnimationWidgetState createState() => _AnimationWidgetState();
// }

// class _AnimationWidgetState extends State<AnimationWidget> with SingleTickerProviderStateMixin{
//   // 动画控制器
//   late AnimationController _controller;

//   // AnimationController 是一个特殊的Animation对象，在屏幕刷新的每一帧，就会生成一个新的值。
//   // 默认情况下 AnimationController 在给定的时间段内会线性的生成从0.0到1.0的数字 用来控制动画的开始与结束以及设置的监听
//   // vsync 参数，存在vsync时会防止屏幕外动画， 消耗不必要的资源
//   // duration 动画的时长，这里设置 seconds:2 为2秒，当然也可以设置毫秒 milliseconds: 2000
//   late Animation<Offset> _animation;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     _controller =AnimationController(vsync: this,
//     duration: Duration(milliseconds: widget.duration));

//     _animation = Tween(
//       begin: Offset(0,0.2),
//       end: Offset(0,0)
//     ).animate(_controller);

    
//       _controller.forward();

//   }


//   @override
//   Widget build(BuildContext context) {
//     return SlideTransition(
//       position: _animation,
//       child: widget.child,
//     );
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _controller.dispose();
//     super.dispose();
//   }
// }







// /// 必传参数 String:url; 
// /// 可传可不传参数 
// /// bool:autoPlay; 自动播放; 默认: false
// /// bool:looping; 循环播放; 默认: false
// /// double:aspectRatio; 视频比例; 默认:3/2
// class ChewieVideoPage extends StatefulWidget {
//     ChewieVideoPage({Key ? key,required this.url,this.autoPlay = false,this.looping = false,this.aspectRatio = 3/2}) : super(key: key);
//     /// 视频地址
//     String url; 
//     /// 自动播放
//     bool autoPlay; 
//     /// 循环
//     bool looping; 
//     /// 比例
//     double aspectRatio;

//     @override
//     _ChewieVideoPageState createState() => _ChewieVideoPageState();
// }
 
// class _ChewieVideoPageState extends State<ChewieVideoPage> {
 
//     // 声明控制器(两个)
//     late VideoPlayerController videoPlayerController;
//     late ChewieController chewieController;
 
//     void initState(){
//         super.initState();
//         // 生成控制器(两个)
//         videoPlayerController=VideoPlayerController.network(widget.url);
//         chewieController = ChewieController(
//             videoPlayerController: videoPlayerController,
//             // 比例
//             aspectRatio: widget.aspectRatio,
//             // 自动播放
//             autoPlay: widget.autoPlay,
//             // 循环
//             looping: widget.looping,
//         );
//     }
 
//     @override
//     void dispose() {
//         // 销毁播放器的控制器
//         videoPlayerController.dispose();
//         chewieController.dispose();
//         super.dispose();
//     }
 
//     @override
//     Widget build(BuildContext context) {
//         return Scaffold(
//             appBar: AppBar(
//                 title:Text('在线视频播放')
//             ),
//             // 加载播放器
//             body:Chewie(
//                 controller: chewieController,
//             )
 
//         );
        
//     }
// }













////

// class _TransitionsHomePage extends StatefulWidget {
//   @override
//   _TransitionsHomePageState createState() => _TransitionsHomePageState();
// }

// class _TransitionsHomePageState extends State<_TransitionsHomePage> {
//   bool _slowAnimations = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Material Transitions')),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView(
//               children: <Widget>[
//                 _TransitionListTile(
//                   title: 'Container transform',
//                   subtitle: 'OpenContainer',
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute<void>(
//                         builder: (BuildContext context) {
//                           return  OpenContainerTransformDemo();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//                 _TransitionListTile(
//                   title: 'Shared axis',
//                   subtitle: 'SharedAxisTransition',
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute<void>(
//                         builder: (BuildContext context) {
//                           return SharedAxisTransitionDemo();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//                 _TransitionListTile(
//                   title: 'Fade through',
//                   subtitle: 'FadeThroughTransition',
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute<void>(
//                         builder: (BuildContext context) {
//                           return  FadeThroughTransitionDemo();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//                 _TransitionListTile(
//                   title: 'Fade',
//                   subtitle: 'FadeScaleTransition',
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute<void>(
//                         builder: (BuildContext context) {
//                           return  FadeScaleTransitionDemo();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//           const Divider(height: 0.0),
//           SafeArea(
//             child: SwitchListTile(
//               value: _slowAnimations,
//               onChanged: (bool value) async {
//                 setState(() {
//                   _slowAnimations = value;
//                 });
//                 // Wait until the Switch is done animating before actually slowing
//                 // down time.
//                 if (_slowAnimations) {
//                   await Future<void>.delayed(const Duration(milliseconds: 300));
//                 }
//                 timeDilation = _slowAnimations ? 20.0 : 1.0;
//               },
//               title: const Text('Slow animations'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _TransitionListTile extends StatelessWidget {
//   const _TransitionListTile({
//     this.onTap,
//     required this.title,
//     required this.subtitle,
//   });

//   final GestureTapCallback? onTap;
//   final String title;
//   final String subtitle;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: const EdgeInsets.symmetric(
//         horizontal: 15.0,
//       ),
//       leading: Container(
//         width: 40.0,
//         height: 40.0,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20.0),
//           border: Border.all(
//             color: Colors.black54,
//           ),
//         ),
//         child: const Icon(
//           Icons.play_arrow,
//           size: 35,
//         ),
//       ),
//       onTap: onTap,
//       title: Text(title),
//       subtitle: Text(subtitle),
//     );
//   }
// }




// class OpenContainerTransformDemo extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Text('OpenContainerTransformDemo'),
//     );
//   }
// }

// class SharedAxisTransitionDemo extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Text('OpenContainerTransformDemo'),
//     );
//   }
// }

// class FadeThroughTransitionDemo extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Text('OpenContainerTransformDemo'),
//     );
//   }
// }

// class FadeScaleTransitionDemo extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Text('OpenContainerTransformDemo'),
//     );
//   }
// }





























class MyHomePage extends StatefulWidget {
  const MyHomePage({Key ? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchString = '';
 
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: OpenContainer<String>(
            openBuilder: (_, closeContainer) => SearchPage(closeContainer),
            onClosed: (res) => setState(() {
              searchString = res.toString();
            }),
            tappable: false,
            closedBuilder: (_, openContainer) => SearchBar(
              searchString: searchString,
              openContainer: openContainer,
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar(
      {Key ? key, required this.searchString, required this.openContainer})
      : super(key: key);

  final String searchString;
  final VoidCallback openContainer;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: openContainer,
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Row(
            children: [
              Icon(Icons.search),
              SizedBox(width: 10),
              searchString != null
                  ? Expanded(child: Text(searchString))
                  : Spacer(),
              Icon(Icons.mic),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage(
    this.onClose, {
    Key ? key,
  }) : super(key: key);

  final void Function({String returnValue}) onClose;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                    blurRadius: 1,
                    color: Colors.black26,
                  )
                ],
                color: Colors.white,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: onClose,
                  ),
                  Spacer(),
                  Icon(Icons.mic),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () => onClose(returnValue: 'Flutter'),
                    child: Text('Search: "Flutter"'),
                  ),
                  ElevatedButton(
                    onPressed: () => onClose(returnValue: 'Rabbit'),
                    child: Text('Search: "Rabbit"'),
                  ),
                  ElevatedButton(
                    onPressed: () => onClose(returnValue: 'What is the Matrix'),
                    child: Text('Search: "What is the Matrix"'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
