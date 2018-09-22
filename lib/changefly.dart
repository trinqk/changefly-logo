import 'package:flutter/material.dart';

import 'package:changefly_coding_challenge/logo/changefly_animation.dart';

class ChangeFly extends StatefulWidget {
  @override
  _ChangeFlyState createState() => _ChangeFlyState();
}

class _ChangeFlyState extends State<ChangeFly> with SingleTickerProviderStateMixin{

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1100));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeFlyAnimation(controller: _controller,),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF50cbdf),
        child: Icon(Icons.refresh,),
        onPressed: () {
          _controller.reset();
          _controller.forward();
        },
      ),
    );
  }

}
