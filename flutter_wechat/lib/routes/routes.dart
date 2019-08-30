import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/control/app.dart';
import 'package:flutter_wechat/pages/search.dart';
import 'package:flutter_wechat/pages/loading.dart';



//配置路由
final routes = 
{
  "/": (context,{arguments})=> new Loading(),
  "app": (context,{arguments})=> new App(),
  "search": (context,{arguments})=> new Search(),
};

//固定写法
var onGenerateRoute = (RouteSettings settings)
{
   //统一处理
   final String name = settings.name;
   final Function pageContentBuilder = routes[name];
   if(settings.arguments !=null)
   {
     final Route route = MaterialPageRoute
     (
       builder: (context)=> pageContentBuilder(context ,arguments:settings.arguments)
     );
     return route;
   }  
   else
   {
     final Route route = MaterialPageRoute
     (
         builder: (context)=> pageContentBuilder(context)
     );
    return route;
   }  
};