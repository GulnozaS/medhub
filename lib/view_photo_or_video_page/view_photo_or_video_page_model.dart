import '/flutter_flow/flutter_flow_util.dart';
import 'view_photo_or_video_page_widget.dart' show ViewPhotoOrVideoPageWidget;
import 'package:flutter/material.dart';

class ViewPhotoOrVideoPageModel
    extends FlutterFlowModel<ViewPhotoOrVideoPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
