import 'package:basic_widgets_intermediate/pages/first/first_page.dart';
import 'package:basic_widgets_intermediate/pages/grid_page/grid_page.dart';
import 'package:basic_widgets_intermediate/pages/home/home_page.dart';
import 'package:basic_widgets_intermediate/pages/page/previus_page.dart';
import 'package:basic_widgets_intermediate/pages/second/second_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/first': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(),
        '/grid_page': (context) => const GridPage(),
        '/previus': (context) => const PreviusPage()
      },
      initialRoute: '/',
    );
  }
}
