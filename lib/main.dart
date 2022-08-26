import 'package:basic_widgets_intermediate/pages/btn/btn_page.dart';
import 'package:basic_widgets_intermediate/pages/dial/speed_dial_page.dart';
import 'package:basic_widgets_intermediate/pages/first/first_page.dart';
import 'package:basic_widgets_intermediate/pages/flow/flow_page.dart';
import 'package:basic_widgets_intermediate/pages/fourth/fourth_page.dart';
import 'package:basic_widgets_intermediate/pages/grid_page/grid_page.dart';
import 'package:basic_widgets_intermediate/pages/home/home_page.dart';
import 'package:basic_widgets_intermediate/pages/login/login_page.dart';
import 'package:basic_widgets_intermediate/pages/navi/navi_page.dart';
import 'package:basic_widgets_intermediate/pages/page/previus_page.dart';
import 'package:basic_widgets_intermediate/pages/second/second_page.dart';
import 'package:basic_widgets_intermediate/pages/sliver/sliver_page.dart';
import 'package:basic_widgets_intermediate/pages/third/third_page.dart';
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
        '/previus': (context) => const PreviusPage(),
        '/third': (context) => const ThirdPage(),
        '/fourth': (context) => const FourthPage(),
        '/button': (context) => const ButtonPage(),
        '/login': (context) => const LoginPage(),

        ///26.08.2022
        '/flow': (context) => const FlowPage(),
        '/speed': (context) => const SpeedPage(),
        '/sliver': (context) => const SliverPage(),
        '/navi': (context) => const NaviPage()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/navi',
    );
  }
}
