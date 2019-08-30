import 'package:flutter/material.dart';
import 'package:flutter_wechat/pages/chat/message_data.dart';


class ChatPage extends StatefulWidget {
  final MessageData msgitem;
  ChatPage(this.msgitem);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChatPageState(msgitem);
  }
}

class _ChatPageState extends State<ChatPage> {
  MessageData msgitem;
  String nikeName = 'Ai卓玛';
  String inputValue = 'ces';
  TextEditingController textEditingController = new TextEditingController();
  List<ChatItem> items = new List();
  _ChatPageState(this.msgitem);

  @override
  Widget build(BuildContext context) {
    nikeName = msgitem.title;
    inputValue = msgitem.subTitle;
    print(msgitem.title);
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title: new Text(
          '$nikeName',
          style: TextStyle(color: Colors.white),
        )),
        body: Container(
          child: Column(
            children: <Widget>[
              new Expanded(
                  child: new ListView.builder(
                itemBuilder: (context, i) {
                  return ChatListView(items[i]);
                },
                itemCount: items.length,
              )),
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new TextField(
                      decoration: new InputDecoration(
                        hintText: '请输入内容',
                      ),
                      onChanged: _onInputTextChange,
                      controller: textEditingController,
                    )),
                    new GestureDetector(
                      child: new Text('发送'),
                      onTap: _sendMsg,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  _onInputTextChange(String value) {
    inputValue = value;
  }

  void _sendMsg() {
    print('发送消息');
    ChatItem chatItem = new ChatItem();
    chatItem.msg = inputValue;
    chatItem.type = 0;
    chatItem.avatar = 0;
    ChatItem chatItem2 = new ChatItem();
    chatItem2.msg = getoutValue(inputValue);
    chatItem2.avatar = 0;
    chatItem2.type = 1;
    setState(() {
      this.items.add(chatItem);
      this.items.add(chatItem2);
    });
    textEditingController.clear();
  }

  ///
  /// Ai核心代码,价值无限
  ///
  ///
  getoutValue(String inputValue) {
    String value = inputValue;
    value = value.replaceAll('我', '你');
    value = value.replaceAll('吗', '');
    value = value.replaceAll('?', '!');
    value = value.replaceAll('？', '!');
    return value;
  }
}

class ChatItem {
  var msg;
  var avatar;
  int type;

  String getMsg() {
    return msg;
  }
}

class ChatListView extends StatefulWidget {
  ChatItem item;

  ChatListView(this.item);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChatListViewState(item);
  }
}

class _ChatListViewState extends State<ChatListView> {
  ChatItem item;
  //var defaultAvatar = 'images/ww_default_avatar.png';

  _ChatListViewState(this.item);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return getItem();
  }

  Widget getItem() {
    if (item.type == 0) {
      return new Container(
          height: 30,
          child: new Row(
            children: <Widget>[
              new Expanded(
                  child: new Text(
                item.msg,
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.black),
              )),
              new Image.asset(item.avatar, width: 44.0, height: 44.0),
            ],
          ));
    } else {
      return new Container(
        height: 30,
        child: new Row(
          children: <Widget>[
            new Image.asset(item.avatar, width: 44.0, height: 44.0),
            new Expanded(
                child: new Text(
              item.msg,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.red),
            ))
          ],
        ),
      );
    }
  }
}
