import 'package:taoke/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final AbstractRoutes routes = Routes.routes;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xxx',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [],
      home: routes.buildPage('splash', null),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<Object>(builder: (BuildContext context) {
          return routes.buildPage(settings.name, settings.arguments);
        });
      },
    );
  }
}
