import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

/// 图片View  photoList: 图片list集合
class PhotpGalleryPage extends StatefulWidget {
  const PhotpGalleryPage({Key ? key,required this.photoList,required this.index}) : super(key: key);
  final List photoList;
  final int index;
  
  @override
  _PhotpGalleryPageState createState() => _PhotpGalleryPageState();
}
 
class _PhotpGalleryPageState extends State<PhotpGalleryPage> {

  

  @override
  int currentIndex = 0;
  int? initialIndex; //初始index
  int? length;
  int? title;
  
  @override
  void initState() {
    currentIndex = widget.index;
    initialIndex = widget.index;
    length = widget.photoList.length;
    title = initialIndex! + 1;
    super.initState();
  }
 
  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
      title = index + 1;
    });
  }
 
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        
        child: 
        Container(
          child: Hero(
            tag: 'hero',
            child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              PhotoViewGallery.builder(
                scrollDirection: Axis.horizontal,
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    maxScale: 3.0,
                    minScale :  0.3,
                    imageProvider: NetworkImage(widget.photoList[index]),
                    initialScale: PhotoViewComputedScale.contained * 1,
                  );
                },
                itemCount: widget.photoList.length,
                // loadingChild: loadingChild,
                backgroundDecoration: BoxDecoration(
                  color: Colors.black,
                ),
                pageController: PageController(initialPage: int.parse(initialIndex.toString())), //点进去哪页默认就显示哪一页
                onPageChanged: onPageChanged,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Image ${currentIndex + 1}",
                  style: const TextStyle(color: Colors.white, fontSize: 17.0, decoration: null),
                ),
              )
            ],
          )
        ),
          ),
        ),
        
        
        // onTap: (){Navigator.pop(context);},
        onTap: (){
          Navigator.pop(context);
        },
        onLongPress: (){
          showModalBottomSheet(
            context:context,
            builder:(BuildContext context){
                return Container(
                  height: MediaQuery.of(context).size.height/6,
                    child: Column(
                        children:[
                            Expanded(flex:1,child: InkWell(
                              child: Center(child: Text('保存图片')),
                            )), 
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 10,
                              color: Color.fromRGBO(245, 245, 245, 1),
                            ),
                            Expanded(flex:1,child: Center(child: Text('取消'),)), 
                        ]
                    ),
                );
            },
          );
        },
      )
      
    );
  }
  
}