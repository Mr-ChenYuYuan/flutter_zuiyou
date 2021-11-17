import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Community extends StatefulWidget {

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('社区',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.music_note,color: Colors.black,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.black,)),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(221, 249, 223, 0.2),
                Color.fromRGBO(247, 250, 224, 0.3),
              ]
            )
          ),
        ),
      ),
      body: Container(
        child: Text('13'),
      ),
    );
  }
}