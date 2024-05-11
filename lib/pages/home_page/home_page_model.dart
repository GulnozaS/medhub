import '/flutter_flow/flutter_flow_util.dart';
import '/pages/personal_info_item/personal_info_item_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PersonalInfoItem component.
  late PersonalInfoItemModel personalInfoItemModel1;
  // Model for PersonalInfoItem component.
  late PersonalInfoItemModel personalInfoItemModel2;
  // Model for PersonalInfoItem component.
  late PersonalInfoItemModel personalInfoItemModel3;
  // Model for PersonalInfoItem component.
  late PersonalInfoItemModel personalInfoItemModel4;
  // Model for PersonalInfoItem component.
  late PersonalInfoItemModel personalInfoItemModel5;
  // Model for PersonalInfoItem component.
  late PersonalInfoItemModel personalInfoItemModel6;
  // Model for PersonalInfoItem component.
  late PersonalInfoItemModel personalInfoItemModel7;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {
    personalInfoItemModel1 =
        createModel(context, () => PersonalInfoItemModel());
    personalInfoItemModel2 =
        createModel(context, () => PersonalInfoItemModel());
    personalInfoItemModel3 =
        createModel(context, () => PersonalInfoItemModel());
    personalInfoItemModel4 =
        createModel(context, () => PersonalInfoItemModel());
    personalInfoItemModel5 =
        createModel(context, () => PersonalInfoItemModel());
    personalInfoItemModel6 =
        createModel(context, () => PersonalInfoItemModel());
    personalInfoItemModel7 =
        createModel(context, () => PersonalInfoItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    personalInfoItemModel1.dispose();
    personalInfoItemModel2.dispose();
    personalInfoItemModel3.dispose();
    personalInfoItemModel4.dispose();
    personalInfoItemModel5.dispose();
    personalInfoItemModel6.dispose();
    personalInfoItemModel7.dispose();
    textFieldFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
