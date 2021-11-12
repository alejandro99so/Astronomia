import 'package:astronomycalculator/routes.dart';
import 'package:astronomycalculator/theme.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  @override
  Widget build(context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Astronomia asd',
      routes: appRoutes,
      initialRoute: INITIAL_ROUTE,
      theme: appTheme,
    );
  }

}
