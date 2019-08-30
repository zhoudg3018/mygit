import 'package:flutter/material.dart';
import 'package:flutter_wechat/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debug标签去除
      debugShowCheckedModeBanner: false,
      title: 'WeChat',
      theme:mDefaultTheme,
      //路由初始化
      initialRoute:'/',
        //设置命名路由
      onGenerateRoute: onGenerateRoute,
    );
  }
}

final ThemeData mDefaultTheme = new ThemeData(
  primaryColor: Color(0xff303030),
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Color(0xff393a3f),
);