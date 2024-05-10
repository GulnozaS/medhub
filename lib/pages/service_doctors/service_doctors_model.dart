import '/flutter_flow/flutter_flow_util.dart';
import 'service_doctors_widget.dart' show ServiceDoctorsWidget;
import 'package:flutter/material.dart';

class ServiceDoctorsModel extends FlutterFlowModel<ServiceDoctorsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
