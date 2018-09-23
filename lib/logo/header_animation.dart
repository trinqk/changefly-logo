import 'package:flutter/material.dart';

class LogoHeader extends StatelessWidget {

  LogoHeader({
    Key key,
    @required this.controller,
    @required this.animationCurve,
  }) :
      // ** headerOpacity **
      // The header fades in
      // Starts with a calculated delay and lasts through duration
      headerOpacity = Tween<double> (
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.45454545454, 1.0,
            curve: animationCurve,
          ),
        ),
      ),
      super(key: key);

  /// Asset location
  final String header = "assets/images/changefly-name.png";

  /// Logo animation necessities
  final AnimationController controller;
  final Curve animationCurve;
  
  /// Header [Animation]
  final Animation<double> headerOpacity;

  Widget _buildHeaderAnimation(BuildContext context, Widget child) {

    final screenWidth = MediaQuery.of(context).size.width;

    return Opacity(
      opacity: headerOpacity.value,
      child: Padding(
        padding: EdgeInsets.only(top: 24.0),
        child: Container(
          width: screenWidth * 0.78,
          child: Image.asset(header),
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildHeaderAnimation,
      animation: controller,
    );
  }
}
