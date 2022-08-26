import 'package:basic_widgets_intermediate/util/logger.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SpeedPage extends StatefulWidget {
  const SpeedPage({super.key});

  @override
  State<SpeedPage> createState() => _SpeedPageState();
}

class _SpeedPageState extends State<SpeedPage> {
  int? _currentIndex = 0;
  PageController? _pageController;
  final _key = GlobalKey<CurvedNavigationBarState>();
  final List<Widget> _textList = [
    const Center(child: Text('home')),
    const Center(child: Text('search')),
    const Center(child: Text('notification')),
    const Center(child: Text('abc'))
  ];
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   gapLocation: GapLocation.center,
      //   icons: const [
      //     Icons.abc,
      //     CupertinoIcons.add,
      //     Icons.abc,
      //     CupertinoIcons.add,
      //   ],
      //   activeColor: Colors.white,
      //   inactiveColor: Colors.black,
      //   activeIndex: _currentIndex!,
      //   onTap: (newIndex) {
      //     _currentIndex = newIndex;
      //     setState(() {});
      //   },
      //   backgroundColor: Colors.amber[300],
      // ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          _currentIndex = newIndex;
          // final stateCurvedNavigation = _key.currentState;
          // stateCurvedNavigation!.setPage(newIndex);
          setState(() {});
        },
        children: _textList,
      ),
      bottomNavigationBar: CurvedNavigationBar(
          index: _currentIndex!,
          key: _key,
          onTap: (newIndex) {
            _currentIndex = newIndex;
            _pageController!.animateToPage(newIndex,
                duration: const Duration(seconds: 1), curve: Curves.easeIn);
            setState(() {});
          },
          backgroundColor: Colors.transparent,
          items: const [
            Icon(
              Icons.abc,
              size: 30,
            ),
            Icon(
              Icons.search,
              size: 30,
            ),
            Icon(
              Icons.notification_add,
              size: 30,
            ),
            Icon(
              Icons.abc,
              size: 30,
            ),
          ]),

      floatingActionButton: SpeedDial(
        // animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Colors.grey,
        buttonSize: const Size(50, 50),
        direction: SpeedDialDirection.up,
        tooltip: 'Speed dial',
        onOpen: () {
          Log.log('DIAL OPENED');
          // Log.toast('DIAL OPENED');
        },
        heroTag: 'first',
        animationDuration: const Duration(milliseconds: 450),
        labelTransitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        visible: true,
        animationCurve: Curves.easeIn,
        childrenButtonSize: const Size(50, 50),
        children: [
          SpeedDialChild(
              label: 'Home',
              child: const Icon(Icons.home),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              onTap: () {
                Log.log('HOME PRESSED');
                Navigator.of(context).pushNamed('/');
              }),
          SpeedDialChild(
              label: 'Search',
              child: const Icon(Icons.search),
              onTap: () {
                if (kDebugMode) {
                  print('SEARCH');
                }
              }),
          SpeedDialChild(
              label: 'Notification', child: const Icon(Icons.notification_add)),
        ],
        activeChild: const Icon(Icons.disabled_by_default),
        child: const Icon(Icons.menu),
      ),
    );
  }
}
