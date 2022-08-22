import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final List<Color> _colorList = [
    Colors.red,
    Colors.green,
    Colors.black,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.black,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.black,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.black,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.black,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: SafeArea(
      //   child: ListView.builder(
      //     shrinkWrap: true,
      //     scrollDirection: Axis.vertical,
      //     itemCount: _colorList.length,
      //     itemBuilder: (context, index) => Container(
      //         height: 100, width: double.infinity, color: _colorList[index]),
      //   ),
      // ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          _customWidget(
              text: 'Item One',
              imageUrl:
                  "https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          _customWidget(
              text: 'Item Two',
              imageUrl:
                  "https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          _customWidget(
              text: 'Item Three',
              imageUrl:
                  "https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          _customWidget(
              text: 'Item One',
              imageUrl:
                  "https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          _customWidget(
              text: 'Item Two',
              imageUrl:
                  "https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          _customWidget(
              text: 'Item Three',
              imageUrl:
                  "https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          _customWidget(
              text: 'Item One',
              imageUrl:
                  "https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          _customWidget(
              text: 'Item Two',
              imageUrl:
                  "https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          _customWidget(
              text: 'Item Three',
              imageUrl:
                  "https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          _customWidget(
              text: 'Item One',
              imageUrl:
                  "https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          _customWidget(
              text: 'Item Two',
              imageUrl:
                  "https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          _customWidget(
              text: 'Item Three',
              imageUrl:
                  "https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          _customWidget(
              text: 'Item One',
              imageUrl:
                  "https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          _customWidget(
              text: 'Item Two',
              imageUrl:
                  "https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          _customWidget(
              text: 'Item Three',
              imageUrl:
                  "https://images.pexels.com/photos/762527/pexels-photo-762527.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/second');
        },
      ),
    );
  }

  Widget _customWidget({required String? imageUrl, required String? text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: .0,
        color: Colors.transparent,
        child: SizedBox(
          width: double.infinity,
          height: 80,
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl!,
                fit: BoxFit.cover,
                width: 80,
                height: 80,
                placeholder: (context, url) => const FlutterLogo(),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(flex: 10, child: Text(text!)),
            ],
          ),
        ),
      ),
    );
  }
}
