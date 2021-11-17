// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:zuiyou/data/data.dart';
import 'package:zuiyou/global/app_provider.dart';
import 'package:zuiyou/global/variable.dart';
import 'package:zuiyou/utils/tool/icon.dart';
import 'package:zuiyou/utils/tool/showDialog.dart';

class ArticleInfo extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ArticleInfo({Key ? key,required this.arguments}) : super(key: key);
  Map arguments;

  @override
  _ArticleInfoState createState() => _ArticleInfoState(arguments:this.arguments);
}

class _ArticleInfoState extends State<ArticleInfo> {
  Map arguments;
  _ArticleInfoState({required this.arguments});

  late EasyRefreshController _easyRefreshController;

  List itemInfo = [
    { "name":'158sad',"img":'dasihduiq.jpg',"zan":'15',"zhuan":'16',"ping":'62',"tu":3 },
  ];

  late List imgList;
  late int itemIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _easyRefreshController = EasyRefreshController();

    itemIndex = int.parse(arguments["id"]);
    imgList = item[itemIndex]['tu'];
  }

  @override
  Widget build(BuildContext context) {
    Color colorFont = Global.isDark ? Global.darkFont:  Colors.black;
    Color colorBg = Global.isDark ? Global.darkBg :  Colors.white;
    var size = MediaQuery.of(context).size;
    

    // 分享 List 遍历
    getShare(){
      List<Widget> item = [];
      for(int i = 0; i < 6; i++){
        item.add(
          Container(
            width: size.width/5,
            padding: const EdgeInsets.fromLTRB(3, 5, 3, 5),
            child: Column(children: [
              Container(
                height: 60,
                width: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://hbimg.huabanimg.com/55f5ba935f1fd633750b78a0fddd997d715344f140ff0-lP5Knk_fw658/format/webp')
                  ),
                  borderRadius: BorderRadius.circular(80)
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text('微信好友'),
              ),
            ],),
          )
        );
      }
      return item;
    }
    // 评论排序
    getComm(){
      List<Widget> item = [];
      for(int i = 0; i < 4; i++){
        item.add(
          Container(
            child:  ListTile(
              title: Text('1',style: TextStyle(color:colorFont)),
              leading: const Icon(Icons.ac_unit),
              trailing: const Icon(Icons.access_alarm),
            ),
            decoration: const BoxDecoration(
              border:  Border(
                top: BorderSide(color:Color.fromRGBO(251, 251, 251, 1))
              )
            ),
          )
        );
      }
      return item;
    }

    return Scaffold(
      appBar: AppBar( 
        title:  Text('最右',style: TextStyle(color: colorFont,fontFamily: 'myfont')),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorBg,
        leading: InkWell(
          child:Icon(Icons.arrow_back_ios,color: Global.isDark ? Global.darkFont : Colors.black54,size: 18,),
          onTap:(){Navigator.pop(context);}
        ),
        actions: [
          IconButton(onPressed: (){

            Show().getShowModalBottomSheet(
              context, Global.isDark ? Global.darkBTBg :  Colors.white,200,
              Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey
                          )
                        )
                      ),
                      width: size.width,
                      height: 100,
                      child: ListView(
                        //设置水平方向排列
                        scrollDirection: Axis.horizontal,
                        children: getShare(),
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 100,
                      child: ListView(
                        //设置水平方向排列
                        scrollDirection: Axis.horizontal,
                        children: getShare(),
                      ),
                    )
                  ],
                ),
              ), 
            );

          }, icon:  Icon(Icons.favorite,color: Global.isDark ? Global.darkFont :  Colors.black))
        ],
      ),
      body: Container(
        color: Global.isDark ? const Color.fromRGBO(29, 29, 41, 1) :  const Color.fromRGBO(244, 243, 248, 1),
        child: EasyRefresh.custom(
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
                return Container(
                  child: Column(children: [
                    // 上半部
                    Container(
                      color: colorBg,
                      margin: const EdgeInsets.only(top:1),
                      child: Column(
                        children: [
                          // user
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 15, 0),
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
                                  onTap: (){
                                    Global.isDark = true;
                                    Provider.of<AppInfoProvider>(context, listen: false).setTheme('purple');
                                    Provider.of<AppInfoProvider>(context, listen: false).setBrightness('dark');
                                    setState(() {});
                                  },
                                )),
                                // username 用户名
                                Expanded(flex: 3,child: Container(
                                  child: InkWell(
                                    child: Column(children: [
                                      Container(
                                        child: Text(
                                          '3132486name',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Global.isDark ? Global.darkFont :  Color.fromRGBO(84, 84, 86, 1),fontSize: 18),
                                        ),
                                        alignment: Alignment.centerLeft,
                                      ),
                                      Container(
                                        child: Text(
                                          '10/30',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Global.isDark ? Global.darkFont : Color.fromRGBO(128, 128, 128, 1),fontSize: 14),
                                        ),
                                        alignment: Alignment.centerLeft,
                                      ),
                                    ],),
                                    onTap: (){print('userInfo');},
                                  )
                                )),
                                // 关注
                                Expanded(flex: 1,child: Container(
                                  // child: Text('X'),
                                  child: InkWell(
                                    child: AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 500),
                                      transitionBuilder: (Widget child, Animation<double> animation) {
                                        //执行缩放动画
                                        return ScaleTransition(child: child, scale: animation);
                                      },
                                      child: Container(
                                        child: Text('+关注',style:TextStyle(color: Global.isDark ? Global.darkFont : Colors.white,fontSize: 16)),
                                        padding: EdgeInsets.fromLTRB(15, 7, 15, 8),
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(30)
                                        ),
                                      ),
                                    ),
                                    onTap: (){
                                      print('userInfo');
                                    },
                                  )
                                )),
                              ],
                            ),
                          ),
                          
                          // content
                          imgList.length > 1 ?Container(
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
                                height: item[index]['tu'].length > 3 && item[index]['tu'].length < 6 ? 255 : item[index]['tu'].length >3 ? 385 : 125 ,
                                child: GridView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 3,
                                    crossAxisSpacing: 3
                                  ),
                                  children: imgList.map((e){
                                    return InkWell(
                                      child: Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(e),
                                            fit: BoxFit.cover
                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                      ),
                                      onTap: (){
                                        print(index);
                                        // print(item[index]['_id']);
                                        Navigator.pushNamed(context, '/imgview',arguments:{
                                          "id": item[itemIndex]['_id'],
                                          "index": item[itemIndex]['tu'].indexOf(e)
                                        });
                                      },
                                    );
                                  }).toList()
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
                                    style: TextStyle(fontSize: 18,color: colorFont),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                  ),
                                ),
                                // 视频/图片
                                Container(
                                  height: 250,
                                  alignment: Alignment.bottomLeft,
                                  child: InkWell(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(item[itemIndex]['tu'][0], fit :BoxFit.cover),
                                    ),
                                    onTap: (){
                                      Navigator.pushNamed(context, '/imgview',arguments:{
                                        "id": item[itemIndex]['_id'],
                                        "index": 0
                                      });
                                    },
                                  )
                                )
                              ],
                            )
                          ),
                          
                          // 表态
                          Container(
                            margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            decoration: BoxDecoration(
                              color: Global.isDark ? Global.darkBTBg : const Color.fromRGBO(246, 246, 246, .9),
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Row(children: [
                              Expanded(flex: 1,child: Text('表个态吧',style: TextStyle(color: colorFont))),
                              Expanded(flex: 4,child: Row(children: [
                                // 笑喷
                                Expanded(flex: 1,child: Container(
                                  child: Row(children: [
                                    Container(
                                      child: IconFont.iconFont(0xe66a,const Color.fromRGBO(70, 124, 253, 1),30),
                                    ),
                                    Container(
                                      child: Text('笑喷',style: TextStyle(color:colorFont)),
                                    ),
                                  ],),
                                )),
                                // 暖心
                                Expanded(flex: 1,child: Container(
                                  child: Row(children: [
                                    Container(
                                      child: IconFont.iconFont(0xeaba,const Color.fromRGBO(191, 130, 86, 1),30),
                                    ),
                                    Container(
                                      child: Text('暖心',style: TextStyle(color: colorFont)),
                                    ),
                                  ],),
                                )),
                                // 沙雕
                                Expanded(flex: 1,child: Container(
                                  child: Row(children: [
                                    Container(
                                      child: IconFont.iconFont(0xead3,const Color.fromRGBO(243, 197, 39, 1),30),
                                    ),
                                    Container(
                                      child: Text('沙雕',style: TextStyle(color: colorFont)),
                                    ),
                                  ],),
                                )),
                                // 还不错
                                Expanded(flex: 1,child: Container(
                                  child: Row(children: [
                                    Container(
                                      child: IconFont.iconFont(0xe6eb,const Color.fromRGBO(235, 197, 210, 1),30),
                                    ),
                                    Container(
                                      child: Text('还不错',style: TextStyle(color: colorFont)),
                                    ),
                                  ],),
                                )),

                              ],)),
                            ],),
                          ),
                          
                          // 赞/转发/评论
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(children: [
                              // 转发
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: IconFont.iconFont(0xe60f,colorFont,26),
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
                                    child: Text('546',style: TextStyle(color: colorFont)),
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
                                    child: IconFont.iconFont(0xe602,colorFont,26),
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
                                    child: Text('2990',style: TextStyle(color: colorFont)),
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
                                    child: Icon(Icons.arrow_upward,color: colorFont),
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
                                    child: Text('2.2W',style: TextStyle(color: colorFont)),
                                  ),
                                  onTap: (){print('赞');}
                                ),
                                
                              ),
                              // 踩
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  child: Container(
                                    child: Icon(Icons.arrow_downward,color: colorFont),
                                  ),
                                  onTap: (){print('踩');}
                                ), 
                              )

                            ]),
                          )
                          
                        ],
                      ),
                    ),
                    
                    // tag  
                    Container(
                      color: Global.isDark ? Global.darkBg : Colors.white,
                      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Row(
                        children: [
                          // 图片
                          Container(
                            width: 55,
                            height: 55,
                            margin: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: const NetworkImage('https://hbimg.huabanimg.com/0f2c83bc9a115368298d9e19f77c0052e69ff320d522-Yjlsb0_fw658/format/webp')
                              )
                            ),
                          ),
                          // info
                          Expanded(flex: 2,child: Column(children: [
                            Container(
                              child: Text('#朋友圈文案',style: TextStyle(color: colorFont)),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              child:  Text('73419 星旅者',style: TextStyle(color: colorFont)),
                              alignment: Alignment.centerLeft,
                            ),
                          ])),
                          // 进入
                          Expanded(flex: 1,child: Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            alignment: Alignment.center,
                            child: Text('进入',style: TextStyle(fontSize: 17,color: Colors.blue),),
                            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                            decoration: BoxDecoration(
                              border: Border.all(color:Colors.blue),
                              borderRadius: BorderRadius.circular(30)
                            ),
                          )),
                        ],
                      ),
                    ),
                    
                    // 最热评论
                    Container(
                      color: colorBg,
                      padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
                      child: Row(
                        children: [
                          // 最热评论
                          Expanded(flex: 6,child: InkWell(
                            child: Container(
                              child: Row(children: [
                                IconFont.iconFont(0xe6bc,const Color.fromRGBO(253, 108, 87, 1),24),
                                const SizedBox(width: 3),
                                Text('最热评论',style: TextStyle(color: colorFont)),
                                const SizedBox(width: 3),
                                IconFont.iconFont(0xe62a,colorFont,18),
                              ],),
                            ),
                            onTap: (){
                              Show().getShowModalBottomSheet(
                                context, Global.isDark ? Global.darkBTBg :  Colors.white,260,
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text('评论排序',style: TextStyle(color:colorFont)),
                                      ),
                                      // 评论排序List
                                      Container(
                                        child: Column(children: getComm(),),
                                      ),
                                    ],
                                  ),
                                ), 
                              );
                            },
                          )),
                          // 空白符
                          Expanded(
                            flex: 8,
                            child: Container(),
                          ),
                          // 插眼
                          Expanded(flex: 4,child: Container(
                            padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.grey)
                            ),
                            child: Row(children: [ 
                              Text('插眼',style: TextStyle(color: colorFont)),
                              const SizedBox(width: 3),
                              IconFont.iconFont(0xe639,Color.fromRGBO(253, 212, 0, 1),24)
                            ],),
                          )),
                        ],
                      ),
                    )
                  ],),
                );
              },childCount: 1),
            ),
            // 评论部分
            SliverList(
              delegate: SliverChildBuilderDelegate((context,index){
                return Container(
                  color: colorBg,
                  child: Column(
                    children: [
                      // 头部
                      Container(
                        margin: const EdgeInsets.only(top:1),
                        child: Row(children: [
                          // 神评
                          // ignore: avoid_unnecessary_containers
                          Container(
                            child:  Text(index != 0? ' ':'神',style: TextStyle(color: colorFont)),
                            // padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                            alignment: Alignment.topLeft,
                            height: 50,
                            width: 15,
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(0),
                                right: Radius.circular(50),
                              )
                            ),
                          ),
                          // 头像
                          Expanded(flex: 3,child: Container(
                            height: 50,
                            width: 50,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage('https://hbimg.huabanimg.com/cc7d34dfb254ce2a7e3adf8fae29176c1bd0f3ad51b4e-cof2CL_fw658/format/webp'),
                            ),
                          )),
                          // 名称
                          Expanded(flex: 7,child: Column(children: [
                            Container(
                              child: Text('Reach out',style: TextStyle(color: colorFont)),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              child: Text('10/30',style: TextStyle(color: colorFont)),
                              alignment: Alignment.centerLeft,
                            )
                          ],)),
                          // 回复
                          Expanded(flex: 3,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Text('回复',style: TextStyle(color: colorFont)),
                              padding: const EdgeInsets.fromLTRB(11, 3, 5, 4),
                              decoration: BoxDecoration(
                                color:  Global.isDark ? Global.darkHFBg : const Color.fromRGBO(246, 245, 250, 1),
                                borderRadius: BorderRadius.circular(15)
                              ),
                            )
                          ),
                          // 赞/踩
                          Expanded(flex: 4,child: Row(children: [
                            Icon(Icons.arrow_upward,color: Colors.blue,),
                            Container(
                              child: Text('162',style: TextStyle(color: Colors.blue)),
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            ),
                            Icon(Icons.arrow_downward,color: Colors.blue,),
                          ]))
                        ]),
                      ),
                      // 内容
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        margin: const EdgeInsets.only(left:65),
                        child: Column(children: [
                          // 文字 
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(0, 18, 0, 12),
                            child: Text(
                              '还行',
                              style: TextStyle(fontSize: 18,color: colorFont),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                          ),
                          // 图片/视频
                          Container( // 多个视频/图片时用grid显示
                            height: itemInfo[0]['tu'] > 3 && itemInfo[0]['tu'] < 6 ? 230 : itemInfo[0]['tu'] >3 ? 345 : 115 ,
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
                                
                                index%3!=0 || index%5!=0 ?InkWell(
                                  child: Container(
                                    height: 80,
                                    color: Colors.primaries[1],
                                  ),
                                  onTap: (){print('${index}%3!=0 || ${index}%5!=0:${index%3!=0 || index%5!=0}');},
                                ):Text(''),

                                
                              ],
                            ),
                          )
                          

                        ],),
                      ),
                      // 二级评论
                      Container(
                        margin: const EdgeInsets.fromLTRB(65, 0, 15, 8),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Global.isDark ? Global.darkBTBg : const Color.fromRGBO(246, 245, 250, 1),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(children: [
                          // 第一条评论
                          Container(
                            child: Html(
                              data: ''' 
                              <div style=" overflow: hidden; text-overflow: ellipsis; white-space: nowrap; ">
                              <span>
                                <span style="color:#4eaaff">寡陋书生</span>
                                <span style="${Global.isDark ? 'color:#8d98ae' : 'color:#686870'}">
                                ：当时子先生退出文坛，我是极力反对的
                                </span>
                              </span>
                              </div>
                              ''',
                            )
                          ),
                          // 第二条评论
                          Container(
                            child: Html(
                              data: '''
                              <div style=" overflow: hidden; text-overflow: ellipsis; white-space: nowrap; ">
                              <span>
                                <span style="color:#4eaaff">寡陋书生</span>
                                <span style="${Global.isDark ? 'color:#8d98ae' : 'color:#686870'}">
                                ：当时子先生退出文坛，我是极力反对的
                                </span>
                              </span>
                              </div>
                              ''',
                            )
                          ),
                          // 评论条数
                          Container(
                            child: Html(
                              data: '''
                              <div style=" overflow: hidden; text-overflow: ellipsis; white-space: nowrap; ">
                                <span style="color:#4eaaff">查看41条评论</span>
                              </div>
                              ''',
                            )
                          ),
                        ],),
                      )
                    ],
                  ),
                );
              },childCount: 5),
            ),
          ]
        ),
      )
    );
  }
}