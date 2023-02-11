
import 'package:flutter/material.dart';
import 'package:task_app_bloc/screens/recycle_bin.dart';


import '../screens/tabs_screen.dart';

class AppRouter{
  Route? onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case RecycleBin.routeName:
        return MaterialPageRoute(builder: (_) => RecycleBin());
      case TabsScreen.routeName:
        return MaterialPageRoute(builder: (_) => TabsScreen());
      default:
        return null;
    }
  }
}