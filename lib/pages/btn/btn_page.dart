import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  double? _x = 0, _y = 0;
  final TextEditingController _textController = TextEditingController();
  String? _savedText = '';

  void _onSaved() {
    _savedText = _textController.text;
    setState(() {});
  }

  @override
  void initState() {
    _textController.addListener(() {
      if (kDebugMode) {
        print(
            'text::: ${_textController.text}  selection::: ${_textController.selection.baseOffset}');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                          elevation: MaterialStateProperty.all<double>(10)),
                      onPressed: () {},
                      child: const Text('press me'))),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 200,
                  height: 60,
                  child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              width: 2,
                              color: Colors.red,
                              style: BorderStyle.solid),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('press me'))),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 200,
                  height: 60,
                  child: CupertinoButton(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green,
                      onPressed: () {},
                      child: const Text('press me'))),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 200,
                  height: 60,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      splashColor: Colors.blue,
                      overlayColor: MaterialStatePropertyAll<Color>(
                        Colors.blue.shade100,
                      ),
                      onTap: () {
                        if (kDebugMode) {
                          print('Pressed');
                        }
                      },
                      child: const Center(child: Text('press me')))),
              const SizedBox(
                height: 20,
              ),
              Transform.translate(
                offset: Offset(_x!, _y!),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ColoredBox(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print('Pressed');
                              _onSaved();
                            }
                          },
                          onDoubleTap: () {
                            _x = 0;
                            _y = 0;
                            setState(() {});
                          },
                          onPanUpdate: (details) {
                            if (kDebugMode) {
                              print(
                                  "(x,y) = (${details.delta.dx},${details.delta.dy})");
                            }
                            _x = _x! + details.delta.dx;
                            _y = _y! + details.delta.dy;

                            setState(() {});
                          },
                          child: const Text(
                            'save taxt or drag button',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 15, right: 15),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.smartphone),
                        hintText: 'Phone',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      _savedText!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/login');
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
