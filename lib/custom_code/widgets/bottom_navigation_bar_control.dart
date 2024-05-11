// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:med_hub/index.dart';

class BottomNavigationBarControl extends StatefulWidget {
  const BottomNavigationBarControl({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<BottomNavigationBarControl> createState() =>
      _BottomNavigationBarControlState();
}

class _BottomNavigationBarControlState
    extends State<BottomNavigationBarControl> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomePageWidget(),
      CheckPageWidget(),
      HospitalsPageWidget()
    ];

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: _widgetOptions[FFAppState().pageIndex]);
  }
}
