import 'dart:math';

import 'package:flutter/material.dart';

class SliverPage extends StatefulWidget {
  const SliverPage({super.key});

  @override
  State<SliverPage> createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              stretch: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Instagram'),
                centerTitle: true,
                stretchModes: const [
                  StretchMode.blurBackground,
                  // StretchMode.fadeTitle,
                  StretchMode.zoomBackground
                ],
                background: DecoratedBox(
                  position: DecorationPosition.foreground,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: FractionalOffset.topCenter,
                          colors: [
                        Colors.black,
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.1),
                      ])),
                  child: Image.asset(
                    'assets/images/image.jpeg',
                    fit: BoxFit.cover,
                    alignment: FractionalOffset.center,
                  ),
                ),
              ),
            ),

            SliverPersistentHeader(
              pinned: true,
              delegate: CustomSliverPersistanceHeaderDelegate(
                  label: 'Sliver List',
                  color: Colors.blue,
                  maxHeight: 80,
                  minHeight: 50),
            ),

            ///Sliver List
            SliverList(
                delegate: SliverChildListDelegate([
              const ListTile(
                title: Text('Salom'),
              ),
              const ListTile(
                title: Text('Salom'),
              ),
              for (var i = 0; i <= 30; i++)
                const ListTile(
                  title: Text('Salom'),
                ),
            ])),
            // const SliverFillRemaining()
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomSliverPersistanceHeaderDelegate(
                  label: 'Sliver Grid',
                  color: Colors.green,
                  maxHeight: 80,
                  minHeight: 50),
            ),

            ///SliverGrid
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    childCount: 30,
                    (context, index) => const Card(
                          child: FlutterLogo(),
                        )),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10)),
          ],
        ),
      ),
    );
  }
}

// SliverChildBuilderDelegate(
//             childCount: 30,
//             (context, index) => ListTile(
//               title: Text('Salom $index'),
//             ),
//           )

class CustomSliverPersistanceHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double? maxHeight;
  final double? minHeight;
  final Color? color;
  final String? label;
  CustomSliverPersistanceHeaderDelegate(
      {required this.label,
      required this.maxHeight,
      required this.minHeight,
      required this.color});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxHeight,
      width: double.infinity,
      alignment: Alignment.center,
      color: color,
      child: Text(
        label!,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  @override
  double get maxExtent => max(maxHeight!, minHeight!);

  @override
  double get minExtent => minHeight!;

  @override
  bool shouldRebuild(CustomSliverPersistanceHeaderDelegate oldDelegate) {
    return label != oldDelegate.label ||
        minHeight != oldDelegate.minHeight ||
        maxHeight != oldDelegate.maxHeight;
  }
}
