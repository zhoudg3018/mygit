import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_message.dart';
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();//输入框消息处理对象
  bool _isComposing = false;


  void _handleSubmitted(String text) {
    _textController.clear();
     setState((){
      _isComposing = false;
    });
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController( //动画控制器设置
        duration: new Duration(milliseconds: 700),
        vsync: this
      )
    );
    setState((){
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  Widget _buildTextComposer() {//
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child:new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child:new Row(
          children:<Widget>[ 
            new Flexible(
              child: new TextField(
                controller: _textController,
                onChanged: (String text) { //是否发送空信息
                  setState((){
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration: new InputDecoration.collapsed(hintText: '发送消息'),
              )
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
               child: Theme.of(context).platform == TargetPlatform.iOS ?
                new CupertinoButton(
                  child: new Text('发送'),
                  onPressed: _isComposing ?
                    () => _handleSubmitted(_textController.text) : null
                ) :
                new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: _isComposing ?
                    () => _handleSubmitted(_textController.text) : null
              ),
            )
          ],
        )
      )
    );
  }
  //释放资源
  @override
  void dispose() {
    for(ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('谈天说地'),
         elevation://z坐标值为0.0没有阴影（iOS），4.0的值具有定义的阴影（Android）。
          Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
       body: new Container(
       child: new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,//reverse使ListView从屏幕底部开始
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              )
            ),
            new Divider(height: 1.0),
            new Container(
              decoration: new BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _buildTextComposer(),
            )
          ]
        ),
       decoration: Theme.of(context).platform == TargetPlatform.iOS ?
          new BoxDecoration(
            border: new Border(
              top: new BorderSide(color: Colors.grey[200]))
          ) :  null
      )
    );
  }
}