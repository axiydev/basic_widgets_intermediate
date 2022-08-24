import 'package:flutter/material.dart';

///24.08.2022
class FlowPage extends StatefulWidget {
  const FlowPage({super.key});

  @override
  State<FlowPage> createState() => _FlowPageState();
}

class _FlowPageState extends State<FlowPage>
    with SingleTickerProviderStateMixin {
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

  _onPressButton() {
    if (_animation!.status == AnimationStatus.completed) {
      _animationController!.reverse();
    } else {
      _animationController!.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.grey[100],
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        alignment: Alignment.bottomRight,
        child: Flow(
            delegate: CustomFlowDelegate(animation: _animation!),
            children: [
              FloatingActionButton(
                heroTag: 'second',
                onPressed: _onPressButton,
                child: const Icon(Icons.abc),
              ),
              FloatingActionButton(
                heroTag: 'third',
                onPressed: _onPressButton,
                child: const Icon(Icons.notification_add),
              ),
              FloatingActionButton(
                heroTag: 'last',
                onPressed: _onPressButton,
                child: const Icon(Icons.search),
              ),
              FloatingActionButton(
                heroTag: 'first',
                onPressed: _onPressButton,
                child: const Icon(Icons.menu),
              ),
            ]),
      ),
    );
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
          transform: Matrix4.translationValues(dy * animation.value, 0, 0));
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return const Size(double.infinity, 60);
  }

  @override
  bool shouldRepaint(CustomFlowDelegate oldDelegate) {
    return oldDelegate.animation != animation;
  }
}
