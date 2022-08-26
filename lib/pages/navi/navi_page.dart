import 'package:flutter/material.dart';

class NaviPage extends StatefulWidget {
  const NaviPage({super.key});

  @override
  State<NaviPage> createState() => _NaviPageState();
}

class _NaviPageState extends State<NaviPage> {
  PageController? _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  int? _currentIndex = 0;
  final List<Widget> _textList = [
    Container(color: Colors.red, child: const Center(child: Text('home'))),
    const ColoredBox(color: Colors.blue, child: Center(child: Text('search'))),
    Container(
        color: Colors.green,
        child: const Center(
            child: RotatedBox(quarterTurns: 3, child: Text('notification')))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            NavigationRail(
                labelType: NavigationRailLabelType.selected,
                onDestinationSelected: (newIndex) {
                  _pageController!.animateToPage(newIndex,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn);
                  setState(() {
                    _currentIndex = newIndex;
                  });
                },
                destinations: const [
                  NavigationRailDestination(
                      icon: Icon(Icons.favorite_border), label: Text('home')),
                  NavigationRailDestination(
                      icon: Icon(Icons.bookmark), label: Text('home')),
                  NavigationRailDestination(
                      icon: Icon(Icons.star), label: Text('home')),
                ],
                selectedIndex: _currentIndex),
            Expanded(
                child: PageView(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              onPageChanged: (newIndex) => setState(() {
                _currentIndex = newIndex;
              }),
              children: _textList,
            ))
          ],
        ),
      ),
    );
  }
}
