import 'package:flutter/material.dart';
const String _name = "hekaiyou";

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;//动画控制器追加
  @override
  Widget build(BuildContext context) {
    return new SizeTransition( //动画效果
            sizeFactor: new CurvedAnimation(
              parent: animationController,
              curve: Curves.easeOut
            ),
            axisAlignment: 0.0,
          
            child:new Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    child: new CircleAvatar(child: new Text(_name[0])),
                  ),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(_name, style: Theme.of(context).textTheme.subhead),
                      new Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: new Text(text),
                      )
                    ]
                  )
                ]
              )
            )
          );
  }
}
