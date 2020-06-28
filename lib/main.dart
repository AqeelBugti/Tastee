import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tastee/Screen/homepage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xffff3ea5),
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      theme: ThemeData(
        accentColor: Color(0xff04d4ee), //////////// Python color
        primaryColor: Color(0xffff3ea5), /////// Pink Wala Color
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}
