import 'package:flutter/material.dart';

import 'package:changefly_coding_challenge/logo/changefly_animation.dart';

class ChangeFly extends StatefulWidget {
  @override
  _ChangeFlyState createState() => _ChangeFlyState();
}

class _ChangeFlyState extends State<ChangeFly> with SingleTickerProviderStateMixin{

  // Controller for the animation.
  AnimationController _controller;
  // Animation duration control
  // Default duration is 1.1s(You can change it if you want)
  // 0.6s duration for the cube animation
  // 0.5s delay, and then 0.6s duration header animation
  int animationDuration = 1100;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: animationDuration));
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

      // Changefly animation
      body: Center(
        child: ChangeflyAnimation(controller: _controller,),
      ),

      // Repeat animation button
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
