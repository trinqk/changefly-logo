import 'package:flutter/material.dart';

class LogoCube extends StatelessWidget {

  LogoCube({
    Key key,
    @required this.controller,
  }) :
      // ** bounce **
      // Controls the y coordinate of the cube
      // Gives a bounce affect
      bounce = Tween<double>(
          begin: -150.0,
          end: 0.0
      ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.bounceOut,
          )
      ),

      // ** cubeX **
      // Controls the X coordinate of the cube
      cubeX = Tween<double>(
        begin: -175.0,
        end: 0.0,
      ).animate(
          CurvedAnimation(parent: controller, curve: Interval(0.0, 0.85, curve: Curves.easeInOut))
      ),

      // ** scale **
      // Controls the scale of cube
      // Makes it look like it's being thrown from far away
      scale = Tween<double>(
          begin: 0.15,
          end: 0.56
      ).animate(
          CurvedAnimation(parent: controller, curve: Interval(0.0, 0.4))
      ),
        super(key: key);


  /// Logo animation necessities
  final AnimationController controller;

  /// Asset locations
  final String cube = "assets/images/changefly-cube.png";

  /// Cube [Animation]s
  final Animation bounce;
  final Animation scale;
  final Animation cubeX;

  // Construct the cube
  Widget _buildCubeAnimation(BuildContext context, Widget child) {
    return Transform(
      transform: Matrix4.translationValues(cubeX.value, bounce.value, 0.0),
      child: Container(
          width: MediaQuery.of(context).size.width * scale.value,
          child: Image.asset(cube)
      ),
    );
  }

  // Return the cube
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildCubeAnimation,
      animation: controller,
    );
  }
}
