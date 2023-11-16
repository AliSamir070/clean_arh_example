import 'package:clean_archticture/core/utils/route_manager.dart';
import 'package:clean_archticture/features/Posts/presentation/pages/posts_screen.dart';
import 'package:flutter/material.dart';

class MyRouter{
  static Route? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesManager.postsRoute:return MaterialPageRoute(builder: (_)=>PostsScreen());
    }
  }
}
