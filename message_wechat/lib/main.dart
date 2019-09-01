import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

void main() {
  runApp(new TalkcasuallyApp());
}

class TalkcasuallyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '谈天说地',
       theme: defaultTargetPlatform == TargetPlatform.iOS
        ? kIOSTheme
        : kDefaultTheme,
      home: new ChatScreen(),
    );
  }
}
//iOS（浅灰色、橙色
final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);
//Android（紫色、橙色）
final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

