import '/flutter_flow/flutter_flow_util.dart';
import 'vaccinations_page_widget.dart' show VaccinationsPageWidget;
import 'package:flutter/material.dart';

class VaccinationsPageModel extends FlutterFlowModel<VaccinationsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
