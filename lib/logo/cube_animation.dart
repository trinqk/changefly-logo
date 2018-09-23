import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class LogoCube extends StatelessWidget {

  LogoCube({
    Key key,
    @required this.controller,
    @required this.animationCurve,
    @required this.screenWidth,
  }) :
      // ** cubeOpacity **
      // Fade in the cube portion of animation
      // 0% of the cube animation   0.0 opacity
      // 80% of the cube animation  1.0 opacity
      cubeOpacity = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
              0.0, 0.43636363636,
              curve: animationCurve
          ),
        ),
      ),

      // ** cubeWidth **
      // Make cube bigger initially then decrease size
      cubeWidth = Tween<double>(
        begin: (screenWidth * 0.56) * 2.0,
        end: screenWidth * 0.56,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
              0.0, 0.43636363636,
              curve: animationCurve
          ),
        ),
      ),

      // ** cubeWidthIncrease && cubeWidthDecrease **
      // Increase and then decrease cube width looks like the cube is swelling
      // Starts with a delay
      cubeWidthIncrease = Tween<double> (
        begin: -20.0,
        end: 0.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
              0.43636363636, 0.4909090909,
              curve: animationCurve
          ),
        ),
      ),
      cubeWidthDecrease = Tween<double> (
        begin: 20.0,
        end: 0.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.4909090909, 0.54545454545,
            curve: animationCurve,
          ),
        ),
      ),

      // ** leftRightPadding && bottomPadding **
      // leftCube and rightCube have a padding to make it look like they're closing in on each other from opposite directions
      // 0% of the cube animation     pushed cubeWidth in opposite directions
      // 80% of the cube animation    end location
      leftRightPadding = Tween<double> (
        begin: (screenWidth * 0.56) * 0.9,
        end: 0.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
              0.0, 0.43636363636,
              curve: animationCurve
          ),
        ),
      ),
      bottomPadding = Tween<double> (
          begin: (screenWidth * 0.56) * 0.3,
          end: 0.0
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
              0.0, 0.43636363636,
              curve: animationCurve
          ),
        ),
      ),

      // ** topCubeY **
      // topCube is initially set a distance above the actually location and comes down
      // 0% of the topCube animation    end location + width of cube
      // 80% of the topCube animation   end location
      topCubeY = Tween<double>(
        begin: -(screenWidth * 0.56) * 2.0,
        end: 0.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
              0.0, 0.43636363636,
              curve: animationCurve
          ),
        ),
      ),

      // ** leftCubeSkew && rightCubeSkew **
      // leftCube and rightCube are skewed 50deg and return to normal
      // 50deg == 0.872665
      leftCubeSkew = Tween<double> (
        begin: 0.872665,
        end: 0.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
              0.0, 0.43636363636,
              curve: animationCurve
          ),
        ),
      ),
      rightCubeSkew = Tween<double> (
        begin: -0.872665,
        end: 0.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
              0.0, 0.43636363636,
              curve: animationCurve
          ),
        ),
      ),
      super(key: key);

  /// Asset locations
  final String topCube = "assets/images/changefly-cube-top.png";
  final String leftCube = "assets/images/changefly-cube-left.png";
  final String rightCube = "assets/images/changefly-cube-right.png";

  /// Logo animation necessities
  final AnimationController controller;
  final Curve animationCurve;
  final double screenWidth;
  
  /// Cube [Animation]s
  final Animation<double> cubeOpacity;
  final Animation<double> cubeWidth;
  final Animation<double> cubeWidthIncrease;
  final Animation<double> cubeWidthDecrease;
  final Animation<double> leftRightPadding;
  final Animation<double> bottomPadding;
  final Animation<double> topCubeY;
  final Animation<double> leftCubeSkew;
  final Animation<double> rightCubeSkew;

  // Construct the cube
  Widget _buildCubeAnimation(BuildContext context, Widget child) {
    return Opacity(
      opacity: cubeOpacity.value,
      child: Container(
        width: cubeWidth.value + cubeWidthIncrease.value + cubeWidthDecrease.value,
        child: Stack(
          children: <Widget>[

            // topCube
            Transform(
              transform: Matrix4.translationValues(0.0, topCubeY.value, 0.0),
              child: Image.asset(topCube),
            ),

            // leftCube
            Transform(
              transform: Matrix4.translationValues(-leftRightPadding.value, bottomPadding.value, 0.0),
              child: Transform(
                transform: Matrix4.skewX(leftCubeSkew.value),
                child: Image.asset(leftCube),
              ),
            ),

            // rightCube
            Transform(
              transform: Matrix4.translationValues(leftRightPadding.value, bottomPadding.value, 0.0),
              child: Transform(
                transform: Matrix4.skewX(rightCubeSkew.value),
                child: Image.asset(rightCube),
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildCubeAnimation,
      animation: controller,
    );
  }
}
