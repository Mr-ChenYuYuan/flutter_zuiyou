import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 设置 tab长度
    _tabController = TabController(length: 2, vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.ac_unit,color: Colors.black,))
        ],
        title: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
          tabs: [
            Tab(text: '提醒'),
            Tab(text: '消息'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Text('data'),
          Text('data'),
        ],
      ),
    );
  }
}