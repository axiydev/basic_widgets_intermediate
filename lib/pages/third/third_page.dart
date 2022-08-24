import 'package:flutter/material.dart';

/*
Created by Axmadjon Isaqov on 09:06:59 24.08.2022
© 2022 @axi_dev 
*/
/*
Mavzu::: Flutter Widgets Adanced
*/
class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late MediaQueryData _mediaQueryData;
  @override
  void didChangeDependencies() {
    _mediaQueryData = MediaQuery.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
          height: _mediaQueryData.size.height,
          width: _mediaQueryData.size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
                image: AssetImage('assets/images/image_1.jpeg')),
          ),
          child: DecoratedBox(
            position: DecorationPosition.foreground,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.red.withOpacity(0.9),
                      Colors.black.withOpacity(0.8),
                      Colors.green.withOpacity(0.7)
                    ])),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/fourth');
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
