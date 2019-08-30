import 'package:flutter/material.dart';
import 'dart:async';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     new Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed("app");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Image.asset('images/loading.jpg'),
    );
  }
}