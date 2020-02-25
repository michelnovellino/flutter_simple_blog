import 'package:flutter/material.dart';
import 'package:flutter_simple_blog/src/router/router.dart';

void main() => runApp(Run());
const String homeRoute = '/';
const String blogRoute = '/blog';

class Run extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      initialRoute: homeRoute,
    );
  }
}
