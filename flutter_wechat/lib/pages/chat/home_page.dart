import 'package:flutter/material.dart';
import 'package:flutter_wechat/pages/chat/message_data.dart';
import 'package:flutter_wechat/pages/chat/message_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
        itemCount: messageData.length,
          itemBuilder: (BuildContext context, int index){
            return new MessageItem(messageData[index]);
          }
      ),
    );
  }
}