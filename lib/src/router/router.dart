import 'package:flutter_simple_blog/src/pages/blog.page.dart';
import 'package:flutter_simple_blog/src/pages/home.page.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/blog':
        return MaterialPageRoute(builder: (_) => BlogPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
