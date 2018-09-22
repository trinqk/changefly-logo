import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:changefly_coding_challenge/changefly.dart';

void main() => runApp(BasicFlutterApp());

class BasicFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      showPerformanceOverlay: false,
      title: "Basic Flutter App",
      home: ChangeFly(),
    );
  }
}
