import 'package:flutter/material.dart';

class PreviusPage extends StatefulWidget {
  const PreviusPage({super.key});

  @override
  State<PreviusPage> createState() => _PreviusPageState();
}

class _PreviusPageState extends State<PreviusPage>
    with TickerProviderStateMixin {
  PageController? _pageController;
  TabController? _tabController;
  int? _currentIndex = 0;
  @override
  void initState() {
    _pageController = PageController();
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
            controller: _tabController,
            onTap: (value) {
              _currentIndex = value;
              _pageController!.jumpToPage(_currentIndex!);
              setState(() {});
            },
            tabs: const [
              Tab(
                text: 'home',
                icon: Icon(Icons.home),
              ),
              Tab(
                text: 'search',
                icon: Icon(Icons.search),
              ),
              Tab(
                text: 'notification',
                icon: Icon(Icons.notification_add),
              ),
            ]),
      ),
      // body: TabBarView(
      //   children: [
      //     Container(
      //       color: Colors.red,
      //       alignment: Alignment.center,
      //       child: const Text(
      //         'Home',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //     ),
      //     Container(
      //       color: Colors.green,
      //       alignment: Alignment.center,
      //       child: const Text(
      //         'Search',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //     ),
      //     Container(
      //       color: Colors.blue,
      //       alignment: Alignment.center,
      //       child: const Text(
      //         'Notification',
      //         style: TextStyle(fontSize: 30),
      //       ),
      //     ),
      //   ],
      // ),

      body: PageView(
        onPageChanged: (value) {
          _currentIndex = value;
          setState(() {});
        },
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text(
              'Home',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text(
              'Search',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text(
              'Notification',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex!,
        onDestinationSelected: (value) {
          _currentIndex = value;
          _pageController!.animateToPage(_currentIndex!,
              duration: const Duration(seconds: 1), curve: Curves.bounceOut);
          _tabController!.animateTo(_currentIndex!,
              duration: const Duration(seconds: 1), curve: Curves.easeIn);
          setState(() {});
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'home'),
          NavigationDestination(
              icon: Icon(Icons.notification_add), label: 'home'),
        ],
      ),
    );
  }
}
