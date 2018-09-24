import 'package:flutter/material.dart';

class ChangeflyAnimation2 extends StatelessWidget {

  ChangeflyAnimation2({
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
    return Container(width: 100.0,
    height: 100.0,
    color: Colors.grey,);
  }
}
