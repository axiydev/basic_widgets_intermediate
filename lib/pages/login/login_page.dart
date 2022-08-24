import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///24.08.2022
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _key = GlobalKey<FormState>();

  String? email = '', password = '';
  Animation<double>? _animation;
  Tween<double>? _tween;
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _tween = Tween(begin: .0, end: 1);
    _animation = _tween!.animate(_animationController!);
    super.didChangeDependencies();
  }

  void _login() {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.grey[100],
        body: SafeArea(
            child: Form(
          key: _key,
          child: Column(
            children: [
              ///Email
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: TextFormField(
                  validator: (valuString) {
                    if (!valuString!.endsWith('@gmail.com')) {
                      return "email tog`ri kiritilmadi";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    email = newValue;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      hintText: 'Email',
                      suffixIcon: const Icon(Icons.mail),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),

              ///Password
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  validator: (valuString) {
                    if (valuString!.length < 6) {
                      return "min characters must be 6";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    password = newValue;
                    setState(() {});
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: const Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: CupertinoButton.filled(
                      borderRadius: BorderRadius.circular(30),
                      onPressed: _login,
                      child: const Text('login')),
                ),
              ),
            ],
          ),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/flow');
          },
        ));
  }
}

class CustomFlowDelegate extends FlowDelegate {
  late Animation<double> animation;
  CustomFlowDelegate({required this.animation}) : super(repaint: animation);
  @override
  void paintChildren(FlowPaintingContext context) {
    for (var i = 0; i < context.childCount; i++) {
      double dy = (context.getChildSize(i)!.height + 10) * i;
      context.paintChild(i,
          transform: Matrix4.translationValues(0, -dy * animation.value, 0));
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return const Size(50, double.infinity);
  }

  @override
  bool shouldRepaint(CustomFlowDelegate oldDelegate) {
    return oldDelegate.animation != animation;
  }
}
