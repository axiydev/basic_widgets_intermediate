import 'package:flutter/material.dart';

///24.08.2022
class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ///linear gradient
            ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Colors.red.withOpacity(0.9),
                    Colors.red.withOpacity(0.7),
                    Colors.red.withOpacity(0.6),
                    Colors.blue.withOpacity(0.8),
                    Colors.blue.withOpacity(0.7),
                    Colors.blue.withOpacity(0.6),
                    Colors.blue.withOpacity(0.5),
                    Colors.green.withOpacity(0.7),
                    Colors.green.withOpacity(0.6),
                    Colors.green.withOpacity(0.5),
                  ]).createShader(bounds),
              child: const Text(
                'Hello World',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),

            ///sweepGradient
            DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                    colors: [Colors.red, Colors.green, Colors.blue]),
              ),
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            ///radial gradient
            DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                    colors: [Colors.red, Colors.green, Colors.blue]),
              ),
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/button');
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
