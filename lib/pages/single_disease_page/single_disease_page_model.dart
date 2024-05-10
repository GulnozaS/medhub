import '/flutter_flow/flutter_flow_util.dart';
import 'single_disease_page_widget.dart' show SingleDiseasePageWidget;
import 'package:flutter/material.dart';

class SingleDiseasePageModel extends FlutterFlowModel<SingleDiseasePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
