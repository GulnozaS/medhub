import '/flutter_flow/flutter_flow_util.dart';
import 'single_analysis_widget.dart' show SingleAnalysisWidget;
import 'package:flutter/material.dart';

class SingleAnalysisModel extends FlutterFlowModel<SingleAnalysisWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
