import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:zuiyou/global/variable.dart';
import 'package:zuiyou/utils/tool/loadLvAnimation.dart';

import 'child/home/articleInfo.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  late EasyRefreshController _easyRefreshController;

  List item = [
    { "name":'158sad',"img":'dasihduiq.jpg',"zan":'15',"zhuan":'16',"ping":'62',"tu":3 },
  ];

  List _tab = [
    "推荐","搞笑","社死","壁纸","声控","jk","文案","洛丽塔"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = new TabController(length: 4, vsync: this);
    _easyRefreshController = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    
    Color colorFont = Global.isDark ? Global.darkFont:  Colors.black;
    Color colorBg = Global.isDark ? Global.darkBg :  Colors.white;


    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: colorBg,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,color: colorFont,)),
        ],
        title: Container(
          child: TabBar(
            controller: this._tabController,
            indicatorColor: colorBg,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.blue,
            unselectedLabelColor: colorFont,
            tabs: [
              Tab(text: '发现'),
              Tab(text: '关注'),
              Tab(text: '视频'),
              Tab(text: '文图'),
            ],
          ),
        )
      ),
      body: Container(
        color: Global.isDark ? const Color.fromRGBO(29, 29, 41, 1) :  const Color.fromRGBO(244, 243, 248, 1),
        child: TabBarView(
          controller: _tabController,
          children: [
            // 推荐
            DefaultTabController(
              length: 8,
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: colorBg,
                  title: Row(
                    children: [
                      Expanded(
                        child: TabBar(
                          onTap: (int index){
                            // print('Selected......$index');
                          },
                          isScrollable: true,
                          indicatorColor: colorBg,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: Colors.blue,
                          unselectedLabelColor: colorFont,
                          tabs: _tab.map<Widget>((item){
                            return Tab(text: item.toString(),);
                          }).toList()
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 1),
                              Color.fromRGBO(255, 255, 255, 0),
                              
                            ],
                          )
                        ),
                        child: IconButton(
                          icon: Icon(Icons.ac_unit,color: Colors.black,),
                          onPressed: (){},
                        ),
                      )
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    
                    EasyRefresh.custom(
                      controller: _easyRefreshController,
                      enableControlFinishRefresh: false,
                      enableControlFinishLoad: true,
                      topBouncing: true,
                      header: PhoenixHeader(),
                      footer: BezierBounceFooter(),
                      // 下拉刷新回调函数
                      onRefresh: ()async{
                        await Future.delayed(Duration(seconds: 2),(){
                          print('下拉刷新回调函数');
                        });
                        _easyRefreshController.resetLoadState();
                      },
                      // 上拉加载回调函数
                      onLoad: ()async{
                        await Future.delayed(Duration(seconds: 2),(){
                          print('上拉加载回调函数');
                        });

                        _easyRefreshController.finishLoad(noMore: false);

                      },
                      // list
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate((context,index){
                            return WorkOrderCheckItem(
                              index: index,
                              child:Container(
                                color: colorBg,
                                margin: EdgeInsets.only(bottom: 8),
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    // 头部
                                    InkWell(
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                        child: Row(
                                          children: [
                                            // 头像
                                            Expanded(flex: 1,child: InkWell(
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage('http://hbimg.huabanimg.com/2877a0b12d7c9ba589cb3078562a47a098f90e2a190fb-Z6oYsq_fw658/format/webp'),
                                                ),
                                              ),
                                              onTap: (){print('userInfo');},
                                            )),
                                            // username 用户名
                                            Expanded(flex: 3,child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: InkWell(
                                                child: Text(
                                                  '3132486name',
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Global.isDark ? Global.darkFont:Color.fromRGBO(128, 128, 128, 1),fontSize: 17),
                                                ),
                                                onTap: (){print('userInfo');},
                                              )
                                            )),
                                            // 叉
                                            Expanded(flex: 1,child: Container(
                                              // child: Text('X'),
                                              child: InkWell(
                                                child: Icon(Icons.add,color: colorFont),
                                                onTap: (){print('XX');},
                                              )
                                            )),
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        // Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){
                                        //   return ArticleInfo();
                                        // }));
                                      },
                                    ),
                                      

                                    // 内容
                                    InkWell(
                                      child: item[0]['tu'] > 1 ?Container(
                                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                        child: Column(children: [
                                          // 文字 
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.fromLTRB(0, 18, 0, 12),
                                            child: Text(
                                              'qwewopsdjoiqw'*100,
                                              style: TextStyle(fontSize: 18,color: colorFont),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 4,
                                            ),
                                          ),
                                          // 图片/视频
                                          Container( // 多个视频/图片时用grid显示
                                            height: item[0]['tu'] > 3 && item[0]['tu'] < 6 ? 230 : item[0]['tu'] >3 ? 345 : 115 ,
                                            child: GridView(
                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                mainAxisSpacing: 3,
                                                crossAxisSpacing: 3
                                              ),
                                              children: [

                                                InkWell(
                                                  child: Container(
                                                    height: 80,
                                                    color: Colors.primaries[0],
                                                  ),
                                                  onTap: (){print('图/视频/1');},
                                                ),
                                                
                                                InkWell(
                                                  child: Container(
                                                    height: 80,
                                                    color: Colors.primaries[1],
                                                  ),
                                                  onTap: (){print('图/视频/2');},
                                                ),

                                                InkWell(
                                                  child: Container(
                                                    height: 80,
                                                    color: Colors.primaries[2],
                                                  ),
                                                  onTap: (){print('图/视频/3');},
                                                )
                                              ],
                                            ),
                                          )
                                          

                                        ],),
                                      ):
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                        child: Column(
                                          children: [
                                            // 文字
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.fromLTRB(0, 18, 0, 12),
                                              child: Text(
                                                '186asdjasd'*100,
                                                style: TextStyle(fontSize: 18),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 4,
                                              ),
                                            ),
                                            // 视频/图片
                                            Container(
                                              height: 250,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Image.network('https://hbimg.huabanimg.com/5d25e894d7ba2121eade87b918bbf892f7c8f62e17f98b-0dpbgw_fw658/format/webp',fit: BoxFit.cover),
                                              ),
                                            )
                                          ],
                                        )
                                      ),
                                      onTap: (){
                                        // Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){
                                        //   return ArticleInfo();
                                        // }));
                                      },
                                    ),
                                    
                                    
                                    // 标签
                                    InkWell(
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                        child: Row(children: [
                                          // 标签
                                          Expanded(
                                            flex: 3,
                                            child: InkWell(
                                              child: Container(
                                                padding: const EdgeInsets.fromLTRB(9, 8, 9, 8),
                                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(30),
                                                  color: Global.isDark ? const Color.fromRGBO(35, 50, 73, 1): const Color.fromRGBO(165, 227, 255, .3)
                                                ),
                                                child: Row(children: [
                                                  Container(
                                                    height: 25,
                                                    width: 25,
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.only(right: 8),
                                                    child: Text('#',style: TextStyle(fontSize: 18,color: Colors.white)),
                                                    decoration: BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius: BorderRadius.circular(25)
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text('软妹收容所',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
                                                  ),
                                                ]),
                                              ),
                                              onTap: (){print('标签');},
                                            ),
                                            
                                          ),

                                          // 发表
                                          Expanded(flex: 5,child: Container(
                                            alignment: Alignment.centerRight,
                                            padding: const EdgeInsets.fromLTRB(9, 8, 9, 8),
                                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                            child: Text('295人发表了态度',style: TextStyle(color: Colors.grey,fontSize: 15))
                                          )),
                                        ],),
                                      ),
                                      onTap: (){
                                        // Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){
                                        //   return ArticleInfo();
                                        // }));
                                      }
                                    ),
                                    
                                    // ?神评? 
                                    /* 先判断有没有神评  有 ？ 显示 ： 不显示 */
                                    InkWell(
                                      child: Container(
                                        margin: const EdgeInsets.all(8),
                                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10 ),
                                        decoration: BoxDecoration(
                                          color: Global.isDark ? Global.darkBTBg: const Color.fromRGBO(246, 246, 246, .9),
                                          borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Column(
                                          children: [
                                            // 神评 title 
                                            Container(
                                              child: Row(
                                                children: [
                                                  // 神评icon 
                                                  Container(  
                                                    padding: EdgeInsets.fromLTRB(1, 1, 2, 1),
                                                    // margin: EdgeInsets.only(left: 15),
                                                    child: Row(children: [
                                                      Container(child: Icon(Icons.ac_unit)),
                                                      Container(child: Text('神评',style: TextStyle(
                                                        color: colorFont
                                                      ),),padding: EdgeInsets.all(5),)
                                                    ]),
                                                    decoration: BoxDecoration(
                                                      color: Global.isDark ? Color.fromRGBO(128, 70, 85, 1) : Color.fromRGBO(255, 120, 150, 1),
                                                      borderRadius: BorderRadius.circular(30)
                                                    ),
                                                  ),
                                                  // 空白符
                                                  Expanded(child: Container(),flex: 2),
                                                  // 赞/踩
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      child: Row(children: [
                                                        // 上
                                                        InkWell(
                                                          child: Icon(Icons.arrow_upward,color: Colors.blue),
                                                          onTap: (){print('赞');},
                                                        ),
                                                        // 数值
                                                        InkWell(
                                                          child: Container(
                                                            child: Text('4.1W',style: TextStyle(color: Colors.blue)),
                                                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                          ),
                                                          onTap: (){print('赞');},
                                                        ),
                                                        // 下
                                                        InkWell(
                                                          child: Icon(Icons.arrow_downward,color: Colors.blue),
                                                          onTap: (){print('踩');},
                                                        ),
                                                      ],),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ),
                                            // 神评内容
                                            Container(
                                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                              child: Column(children: [
                                                // 文字  
                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  padding: EdgeInsets.fromLTRB(0, 18, 0, 12),
                                                  child: Text(
                                                    '哇哦',
                                                    style: TextStyle(fontSize: 18,color: colorFont),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 4,
                                                  ),
                                                ),
                                                // 图片/视频
                                                Container( // 多个视频/图片时用grid显示
                                                  height: item[0]['tu'] > 3 && item[0]['tu'] < 6 ? 300 : item[0]['tu'] >3 ? 450 : 115 ,
                                                  child: GridView(
                                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      mainAxisSpacing: 3,
                                                      crossAxisSpacing: 3
                                                    ),
                                                    children: [
                                                      InkWell(
                                                        child: Container(
                                                          height: 80,
                                                          color: Colors.primaries[0],
                                                        ),
                                                        onTap: (){print('图/视频/1');},
                                                      ),
                                                      
                                                      InkWell(
                                                        child: Container(
                                                          height: 80,
                                                          color: Colors.primaries[1],
                                                        ),
                                                        onTap: (){print('图/视频/2');},
                                                      ),

                                                      InkWell(
                                                        child: Container(
                                                          height: 80,
                                                          color: Colors.primaries[2],
                                                        ),
                                                        onTap: (){print('图/视频/3');},
                                                      )
                                                    ],
                                                  ),
                                                )

                                              ],),
                                            )
                                            
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        // Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){
                                        //   return ArticleInfo();
                                        // }));
                                      },
                                    ),
                                    
                                    // 赞/转发/评论/踩
                                    InkWell(
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                                        child: Row(children: [
                                          // 转发
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              child: Container(
                                                alignment: Alignment.centerRight,
                                                child: Icon(Icons.face,color:colorFont),
                                              ),
                                              onTap: (){print('转发');}
                                            ),
                                          ),
                                          // 转发
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text('546',style: TextStyle(color:colorFont)),
                                              ),
                                              onTap: (){print('转发');}
                                            ),
                                          ),
                                          // 评论
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              child: Container(
                                                alignment: Alignment.centerRight,
                                                child: Icon(Icons.image,color:colorFont),
                                              ),
                                              onTap: (){print('评论');}
                                            ),
                                          ),
                                          // 评论
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text('2990',style: TextStyle(color:colorFont)),
                                              ),
                                              onTap: (){print('评论');}
                                            ),
                                          ),
                                          // 赞
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              child: Container(
                                                alignment: Alignment.centerRight,
                                                child: Icon(Icons.arrow_upward,color:colorFont),
                                              ),
                                              onTap: (){print('赞');}
                                            ),
                                          ),
                                          // 赞
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text('2.2W',style: TextStyle(color:colorFont)),
                                              ),
                                              onTap: (){print('赞');}
                                            ),
                                            
                                          ),
                                          // 踩
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              child: Container(
                                                child: Icon(Icons.arrow_downward,color:colorFont),
                                              ),
                                              onTap: (){print('踩');}
                                            ), 
                                          )

                                        ]),
                                      ),
                                      onTap: (){
                                        
                                      },
                                    ),
                                  ],
                                )
                                
                              )
                            )
                            ;
                          },childCount: 50),
                        )
                      ]
                    ),
                    Text('14'),
                    Text('13'),
                    Text('14'),
                    Text('13'),
                    Text('14'),
                    Text('13'),
                    Text('14'),
                  ],
                ),
                    
                  
                
                
              ),
            ),
            // 
            Text('1'),
            Text('13'),
            Text('14'),
          ],
        ),
      )
        
    );
  }
}