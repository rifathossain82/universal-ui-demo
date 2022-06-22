import 'package:flutter/material.dart';
import 'package:universe_ui_demo/src/pages/homepage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Universe UI Demo',
      home: Homepage(),
    );
  }
}
