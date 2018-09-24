import 'package:flutter/material.dart';

import 'package:changefly_coding_challenge/logo2/header_animation.dart';
import 'package:changefly_coding_challenge/logo2/cube_animation.dart';

class ChangeflyAnimation2 extends StatelessWidget {

  ChangeflyAnimation2({
    Key key,
    @required this.controller,
  }) : super(key : key);

  /// Logo animation necessities
  /// This [AnimationController] can be handled more effectively but,
  /// I think it's pretty overkill so I'm passing it manually
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LogoCube(controller: controller),
        LogoHeader(controller: controller,),
      ],
    );
  }
}
