import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:changefly_coding_challenge/logo/header_animation.dart';
import 'package:changefly_coding_challenge/logo/cube_animation.dart';

class ChangeflyAnimation extends StatelessWidget {

  ChangeflyAnimation({
    Key key,
    @required this.controller,
  }) : super(key : key);

  /// Logo animation necessities
  /// This [AnimationController] can be handled more effectively but,
  /// I think it's pretty overkill so I'm passing it manually
  final AnimationController controller;

  // animationCurve is defined on changefly.com
  static final Curve animationCurve = Cubic(0.42,0.0,0.58,1.0);

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        // Assemble the logo
        LogoCube(controller: controller, animationCurve: animationCurve, screenWidth: screenWidth),
        LogoHeader(controller: controller, animationCurve: animationCurve),

      ],
    );
  }
}
