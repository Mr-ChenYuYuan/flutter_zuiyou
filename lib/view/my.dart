// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:zuiyou/global/app_provider.dart';
import 'package:zuiyou/global/variable.dart';
import 'package:zuiyou/utils/tool/icon.dart';
import 'package:zuiyou/utils/tool/noneRipple.dart';
import 'package:zuiyou/utils/tool/showDialog.dart';

class My extends StatefulWidget {

  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> with TickerProviderStateMixin{

  double extraPicHeight = 0;//初始化要加载到图片上的高度
  late BoxFit fitType;//图片填充类型（刚开始滑动时是以宽度填充，拉开之后以高度填充）
  late  double prev_dy;//前一次手指所在处的y值

  //加在这里
  late AnimationController animationController;
  late Animation<double> anim;

  ScrollController _controller = ScrollController(); // 滚动监听

  late double offsetVal = 0;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    prev_dy = 0;
    fitType = BoxFit.cover;

    //加在这里
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    anim = Tween(begin: 0.0, end: 0.0).animate(animationController);

    // 
    _controller.addListener((){
      // print(_controller.offset); //打印滚动位置
      offsetVal = _controller.offset;
    });
  }


  @override
  Widget build(BuildContext context) {

    Widget op = Opacity(
      opacity: 0,
      child: InkWell(
        child: Container(
          child: Column(children: [
            Icon(Icons.ac_unit,size: 35,color: Global().colorFont),
            SizedBox(height: 5),
            Text('创造中心',style: TextStyle(color: Global().colorFont))
          ],),
        ),
      ),
    );

    return ScrollConfiguration(
      behavior: MyBehavior(), 
      child: Container(
        color: Global.isDark ? const Color.fromRGBO(29, 29, 41, 1) : Colors.grey[200],
        child: Listener(
          // 滑动时触发该事件
          onPointerMove: (result){
            if(extraPicHeight >= 0){
              updatePicHeight(result.position.dy);//自定义方法，图片的放大由它完成。
            }else{
              extraPicHeight = 0;
            }
            updatePicHeight(result.position.dy);//自定义方法，图片的放大由它完成。
          },
          // 松开后触发该事件
          onPointerUp: (_){
            // if(extraPicHeight >= 0){
            //   runAnimate();//动画执行
            //   animationController.forward(from: 0); //重置动画
            // }else{
            //   extraPicHeight = 0;
            // }
            runAnimate();//动画执行
            animationController.forward(from: 0); 
          },
          // 子组件
          child: CustomScrollView(
            controller: _controller,
            slivers: [
              SliverAppBar(
                  actions: [
                    IconButton(
                      icon: Icon(Icons.access_time,color: Global().colorFont,),
                      onPressed: (){},
                    )
                  ],
                  centerTitle: true,
                  title: AnimatedOpacity(
                    opacity: offsetVal >= 136.38 ? 1.0 : 0.0,
                    child:  Text('呆i36622',style: TextStyle(color: Global().colorFont)),
                    duration: const Duration(milliseconds: 200)
                  ),
                  floating: false,
                  pinned: true,
                  snap: false,
                  backgroundColor: Global.isDark ? const Color.fromRGBO(29, 29, 41, 1) : Colors.white,
                  elevation: 0,
                  //pinned代表是否会在顶部保留AppBar
                  //floating代表是否会发生下拉立即出现SliverAppBar
                  //snap必须与floating:true联合使用，表示显示SliverAppBar之后，如果没有完全拉伸，是否会完全神展开
                  expandedHeight: 200 + extraPicHeight,//顶部控件所占的高度,跟随因手指滑动所产生的位置变化而变化。
                  flexibleSpace: FlexibleSpaceBar(
                    title: null,//标题
                    background://背景图片所在的位置
                    SliverTopBar(extraPicHeight: extraPicHeight,
                    fitType: fitType,)//自定义Widget
                  ),
                ),
              
              // 构建一个list
              // buildSliverList(30),
              SliverList(
                delegate: SliverChildBuilderDelegate((context,index){
                    return Container(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                      child: Column(children: [
                        // 帖子/评论/插眼
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Global().colorBTBg,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Row(
                            children: [
                              Container(child: Column(children: [
                                IconFont.iconFont(0xe60c,const Color.fromRGBO(156, 142, 253, 1),30),
                                SizedBox(height: 5),
                                Text('帖子',style: TextStyle(color: Global().colorFont))
                              ],)),
                              Container(child: Column(children: [
                                IconFont.iconFont(0xe891,const Color.fromRGBO(255, 106, 125, 1),30),
                                SizedBox(height: 5), 
                                Text('评论',style: TextStyle(color: Global().colorFont))
                              ],)),
                              Container(child: Column(children: [
                                IconFont.iconFont(0xfb93,const Color.fromRGBO(255, 170, 89, 1),30),
                                SizedBox(height: 5),
                                Text('收藏',style: TextStyle(color: Global().colorFont))
                              ],)),
                              Container(child: Column(children: [
                                IconFont.iconFont(0xe8c7,const Color.fromRGBO(251, 191, 41, 1),30),
                                SizedBox(height: 5),
                                Text('插眼',style: TextStyle(color: Global().colorFont))
                              ],)),
                              Container(child: Column(children: [
                                IconFont.iconFont(0xe643,const Color.fromRGBO(255, 192, 192, 1),30),
                                SizedBox(height: 5),
                                Text('赞',style: TextStyle(color: Global().colorFont))
                              ],)),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                          ),
                        ),
                        // 成长卡片
                        Container(
                          height: 130,
                          margin: const EdgeInsets.only(top:15),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Global().colorBTBg,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Column(children: [
                            Container(
                              height: 50,
                              padding: const EdgeInsets.only(left:20),
                              alignment: Alignment.centerLeft,
                              child: Text('与右成长',style:TextStyle(fontWeight:FontWeight.w600,fontSize: 18,color: Global().colorFont)),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Global().colorBorder))
                              ),
                            ),
                            Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(top:10),
                              child: 
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    child: Container(
                                      child: Column(children: [
                                        IconFont.iconFont(0xe622, const Color.fromRGBO(72, 170, 237, 1),30),
                                        SizedBox(height: 5),
                                        Text('创造中心',style: TextStyle(color: Global().colorFont))
                                      ],),
                                    ),
                                    onTap: (){print('创造中心');},
                                  ),
                                  InkWell(
                                    child: Container(
                                      child: Column(children: [
                                        IconFont.iconFont(0xe68b, const Color.fromRGBO(248, 174, 40, 1),30),
                                        SizedBox(height: 5),
                                        Text('最右勋章',style: TextStyle(color: Global().colorFont))
                                      ],),
                                    ),
                                    onTap: (){print('最右勋章');},
                                  ),
                                  InkWell(
                                    child: Container(
                                      child: Column(children: [
                                        IconFont.iconFont(0xe752, const Color.fromRGBO(148, 142, 240, 1),30),
                                        SizedBox(height: 5),
                                        Text('审核专区',style: TextStyle(color: Global().colorFont))
                                      ],),
                                    ),
                                    onTap: (){print('审核专区');},
                                  ),
                                  InkWell(
                                    child: Container(
                                      child: Column(children: [
                                        IconFont.iconFont(0xe62e, const Color.fromRGBO(238, 129, 141, 1),30),
                                        SizedBox(height: 5),
                                        Text('护右联盟',style: TextStyle(color: Global().colorFont))
                                      ],),
                                    ),
                                    onTap: (){print('护右联盟');},
                                  ),
                                ]
                              ),
                            ),
                          ],),
                        ),
                        // 推荐卡片
                        Container(
                          margin: const EdgeInsets.only(top:15),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Global().colorBTBg,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Column(children: [
                            Container(
                              height: 50,
                              padding: const EdgeInsets.only(left:20),
                              alignment: Alignment.centerLeft,
                              child: Text('小右推荐',style:TextStyle(fontWeight:FontWeight.w600,fontSize: 18,color: Global().colorFont)),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Global().colorBorder))
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Column(children: [
                                Container(
                                  height: 80,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(top:10),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          child: Column(children: [
                                            IconFont.iconFont(0xe6ad, const Color.fromRGBO(155, 143, 230, 1),30),
                                            SizedBox(height: 5),
                                            Text('小游戏',style: TextStyle(color: Global().colorFont))
                                          ],),
                                        ),
                                        onTap: (){print('小游戏');},
                                      ),
                                      InkWell(
                                        child: Container(
                                          child: Column(children: [
                                            IconFont.iconFont(0xe610, const Color.fromRGBO(155, 143, 230, 1),30),
                                            SizedBox(height: 5),
                                            Text('旅行章鱼',style: TextStyle(color: Global().colorFont))
                                          ])
                                        ),
                                        onTap: (){print('旅行章鱼');},
                                      ),
                                      InkWell(
                                        child: Container(
                                          child: Column(children: [
                                            IconFont.iconFont(0xe636,const Color.fromRGBO(246, 175, 49, 1),30),
                                            SizedBox(height: 5),
                                            Text('决议区',style: TextStyle(color: Global().colorFont))
                                          ],),
                                        ),
                                        onTap: (){print('决议区');},
                                      ),
                                      InkWell(
                                        child: Container(
                                          child: Column(children: [
                                            IconFont.iconFont(0xe644,const Color.fromRGBO(224, 52, 76, 1),30),
                                            SizedBox(height: 5),
                                            Text('最右family',style: TextStyle(color: Global().colorFont))
                                          ],),
                                        ),
                                        onTap: (){print('最右family');},
                                      ),
                                    ]
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(top:10),
                                  child: 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          child: Column(children: [
                                            IconFont.iconFont(0xe605,const Color.fromRGBO(246, 175, 49, 1),30),
                                            SizedBox(height: 5),
                                            Text('小右福利',style: TextStyle(color: Global().colorFont))
                                          ],),
                                        ),
                                        onTap: (){print('小右福利');},
                                      ),
                                      op,
                                      op,
                                      op
                                    ]
                                  ),
                                ),

                              ]),
                            )
                          ]),
                        ),
                        // 服务卡片
                        Container(
                          margin: const EdgeInsets.only(top:15),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Global().colorBTBg,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Column(children: [
                            Container(
                              height: 50,
                              padding: const EdgeInsets.only(left:20),
                              alignment: Alignment.centerLeft,
                              child: Text('跟多服务',style:TextStyle(fontWeight:FontWeight.w600,fontSize: 18,color: Global().colorFont)),
                              decoration:  BoxDecoration(
                                border: Border(bottom: BorderSide(color: Global().colorBorder))
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Column(children: [
                                Container(
                                  height: 80,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(top:10),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          child: Column(children: [
                                            if(Global.isDark)
                                            IconFont.iconFont(0xe611,const Color.fromRGBO(74, 176, 243, 1),30)
                                            else
                                            IconFont.iconFont(0xe624,const Color.fromRGBO(74, 176, 243, 1),30),
                                            SizedBox(height: 5),
                                            Text('夜间模式',style: TextStyle(color: Global().colorFont))
                                          ],),
                                        ),
                                        onTap: (){
                                          Show().getShowModalBottomSheet(
                                            context, Global().colorBg, 160, 
                                            Container(
                                              child: Column(children: [
                                                Container(
                                                  height: 40,
                                                  child: const Text('夜间模式',style:TextStyle(fontWeight: FontWeight.w600,fontSize: 17)),
                                                  alignment: Alignment.topCenter,
                                                  decoration: BoxDecoration(
                                                    border: Border(bottom: BorderSide(color: Global().colorBorder))
                                                  ),
                                                ),
                                                
                                                InkWell(
                                                  child: Container(
                                                    height: 60,
                                                    child: Text('日间',style: TextStyle(fontSize: 16),),
                                                    alignment: Alignment.centerLeft,
                                                    padding: const EdgeInsets.only(left:10,right: 10),
                                                    decoration: BoxDecoration(
                                                      border: Border(bottom: BorderSide(color: Global().colorBorder))
                                                    ),
                                                  ),
                                                  onTap: (){
                                                    Global.isDark = false;
                                                    Provider.of<AppInfoProvider>(context, listen: false).setBrightness('light');
                                                    Navigator.pop(context);
                                                    setState(() {});
                                                  },
                                                ),
                                                InkWell(
                                                  child: Container(
                                                    height: 60,
                                                    child: Text('夜间',style: TextStyle(fontSize: 16),),
                                                    alignment: Alignment.centerLeft,
                                                    padding: const EdgeInsets.only(left:10,right: 10),
                                                    decoration: BoxDecoration(
                                                      border: Border(bottom: BorderSide(color: Global().colorBorder))
                                                    ),
                                                  ),
                                                  onTap: (){
                                                    Global.isDark = true;
                                                    Provider.of<AppInfoProvider>(context, listen: false).setBrightness('dark');
                                                    Navigator.pop(context);
                                                    setState(() {});
                                                  },
                                                ),
                                                  
                                              ]),
                                            )
                                          );
                                        },
                                      ),
                                      InkWell(
                                        child: Container(
                                          child: Column(children: [
                                            IconFont.iconFont(0xe63a,const Color.fromRGBO(244, 181, 61, 1),30),
                                            SizedBox(height: 5),
                                            Text('浏览历史',style: TextStyle(color: Global().colorFont))
                                          ],),
                                        ),
                                        onTap: (){print('浏览历史');},
                                      ),
                                      InkWell(
                                        child: Container(
                                          child: Column(children: [
                                            IconFont.iconFont(0xe61b,const Color.fromRGBO(111, 138, 253, 1),30),
                                            SizedBox(height: 5),
                                            Text('视频壁纸',style: TextStyle(color: Global().colorFont))
                                          ],),
                                        ),
                                        onTap: (){print('视频壁纸');},
                                      ),
                                      InkWell(
                                        child: Container(
                                          child: Column(children: [
                                            IconFont.iconFont(0xe7bf,const Color.fromRGBO(252, 183, 46, 1),30),
                                            SizedBox(height: 5),
                                            Text('青年模式',style: TextStyle(color: Global().colorFont))
                                          ],),
                                        ),
                                        onTap: (){print('青年模式');},
                                      ),
                                    ]
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(top:10),
                                  child: 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          child: Column(children: [
                                            IconFont.iconFont(0xeea5,const Color.fromRGBO(253, 127, 143, 1),30),
                                            SizedBox(height: 5),
                                            Text('右有态度',style: TextStyle(color: Global().colorFont))
                                          ],),
                                        ),
                                        onTap: (){print('右有态度');},
                                      ),
                                      InkWell(
                                        child: Container(
                                          child: Column(children: [
                                            IconFont.iconFont(0xe612,const Color.fromRGBO(242, 100, 142, 1),30),
                                            SizedBox(height: 5),
                                            Text('帮助反馈',style: TextStyle(color: Global().colorFont))
                                          ],),
                                        ),
                                        onTap: (){print('帮助反馈');},
                                      ),
                                      InkWell(
                                        child: Container(
                                          child: Column(children: [
                                            IconFont.iconFont(0xe61c,const Color.fromRGBO(109, 138, 252, 1),30),
                                            SizedBox(height: 5),
                                            Text('我的下载',style: TextStyle(color: Global().colorFont))
                                          ],),
                                        ),
                                        onTap: (){print('我的下载');},
                                      ),
                                      InkWell(
                                        child: Container(
                                          child: Column(children: [
                                            IconFont.iconFont(0xe64f,const Color.fromRGBO(81, 210, 171, 1),30),
                                            SizedBox(height: 5),
                                            Text('免流服务',style: TextStyle(color: Global().colorFont))
                                          ],),
                                        ),
                                        onTap: (){print('免流服务');},
                                      ),
                                    ]
                                  ),
                                ),

                              ]),
                            )
                          ]),
                        ),
                      ]),
                    );
                  },
                  childCount: 1,
                )
              )
            ],
          ),
        )
      )
    );
  }
  //自定义方法，图片的放大由它完成
  updatePicHeight(changed){
    if(prev_dy == 0){//如果是手指第一次点下时，我们不希望图片大小就直接发生变化，所以进行一个判定。
      prev_dy = changed;
    }
    if(extraPicHeight >= 45){//当我们加载到图片上的高度大于某个值的时候，改变图片的填充方式，让它由以宽度填充变为以高度填充，从而实现了图片视角上的放大。
      fitType = BoxFit.fitHeight;
    }
    else{
      fitType = BoxFit.cover;
    }
    extraPicHeight += changed - prev_dy;//新的一个y值减去前一次的y值然后累加，作为加载到图片上的高度。
    setState(() {//更新数据
      prev_dy = changed;
      extraPicHeight = extraPicHeight;
      fitType = fitType;
    });
  }

  // 动画
  runAnimate(){//设置动画让extraPicHeight的值从当前的值渐渐回到 0
    setState(() {
      anim = Tween(begin: extraPicHeight, end: 0.0).animate(animationController)
        ..addListener((){
          if(extraPicHeight>=45){//同样改变图片填充类型
            fitType = BoxFit.fitHeight;
          }
          else{
            fitType = BoxFit.cover;
          }
          setState(() {
            extraPicHeight = anim.value;
            fitType = fitType;
          });
        });
      prev_dy = 0;//同样归零
    });
  }
}

// 自定义控件的封装
class SliverTopBar extends StatelessWidget{
  const SliverTopBar({Key? key, required this.extraPicHeight, required this.fitType}) : super(key: key);
  final double extraPicHeight;//传入的加载到图片上的高度
  final BoxFit fitType;//传入的填充方式

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(//缩放的图片
          width: MediaQuery.of(context).size.width,
          child: Image.network("https://hbimg.huabanimg.com/da99d43ae4a7f1d78c7bfbceb18e689a7a3acd3d5e181e-6VlHEp_fw658/format/webp",
              height: 230 + extraPicHeight,fit: fitType),
        ),
        Positioned(
          top: 145 + extraPicHeight,
          child: Container(
            height: 80,
            padding: const EdgeInsets.only(left: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 16,top: 10),
                  child: const Text("呆i36622",style: TextStyle(color: Colors.white)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 16,top: 8),
                  child: const Text("这家伙很懒，什么的没写~",style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 30,
          top: 80 + extraPicHeight,
          
          child: Container(
            width: 65,
            height: 65,
            // ignore: prefer_const_constructors
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://hbimg.huabanimg.com/7e08832e359c8b41f6a0a4be91ab4eccf53915c730ae7-32JfVO_fw658/format/webp'),
            ),
          ),

        )
      ],

    );
  }

}

