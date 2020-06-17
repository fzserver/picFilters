import 'package:flutter/material.dart';
import 'package:picFilters/pages/home/homePage.dart';

class ConfigPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pic Filters',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}
