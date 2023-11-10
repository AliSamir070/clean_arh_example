import 'package:clean_archticture/Features/route_manager.dart';
import 'package:clean_archticture/ui/posts/posts_screen.dart';
import 'package:flutter/material.dart';

class MyRouter{
  static Route? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesManager.postsRoute:return MaterialPageRoute(builder: (_)=>PostsScreen());
    }
  }
}
