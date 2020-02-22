import 'package:social_app/api/get_service.dart';
import 'package:social_app/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SocialApp extends StatelessWidget {
  const SocialApp({
    Key key,
    @required this.service,
  }) : super(key: key);

  static GetService serviceOf(BuildContext context) {
    return Provider.of<GetService>(context);
  }

  final GetService service;

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<GetService>.value(
      value: service,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal,
          textTheme: TextTheme(
            subtitle1: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
