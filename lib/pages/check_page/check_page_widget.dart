import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/analysis_item/analysis_item_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'check_page_model.dart';
export 'check_page_model.dart';

class CheckPageWidget extends StatefulWidget {
  const CheckPageWidget({super.key});

  @override
  State<CheckPageWidget> createState() => _CheckPageWidgetState();
}

class _CheckPageWidgetState extends State<CheckPageWidget> {
  late CheckPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Your Checks',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: FlutterFlowChoiceChips(
                      options: const [ChipData('Analysis'), ChipData('Med Hardware')],
                      onChanged: (val) async {
                        setState(
                            () => _model.choiceChipsValue = val?.firstOrNull);
                        setState(() {
                          _model.type = _model.choiceChipsValue!;
                        });
                      },
                      selectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                        iconSize: 18.0,
                        labelPadding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 2.0, 12.0, 2.0),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: const Color(0x0E12151C),
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter',
                                  color: const Color(0x6512151C),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                        iconColor: FlutterFlowTheme.of(context).secondaryText,
                        iconSize: 12.0,
                        labelPadding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 2.0, 12.0, 2.0),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      chipSpacing: 12.0,
                      rowSpacing: 12.0,
                      multiselect: false,
                      initialized: _model.choiceChipsValue != null,
                      alignment: WrapAlignment.start,
                      controller: _model.choiceChipsValueController ??=
                          FormFieldController<List<String>>(
                        ['Analysis'],
                      ),
                      wrapped: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        const Duration(milliseconds: 1000),
                        () => setState(() {}),
                      ),
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Search',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  color: const Color(0x6712151C),
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x0C12151C),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        prefixIcon: const Icon(
                          Icons.search_sharp,
                          color: Color(0x6512151C),
                          size: 20.0,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                if (_model.type == 'Analysis')
                  Expanded(
                    child: StreamBuilder<List<AnalysisRecord>>(
                      stream: queryAnalysisRecord(
                        parent: currentUserReference,
                        queryBuilder: (analysisRecord) => analysisRecord.where(
                          'isHardware',
                          isEqualTo: false,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<AnalysisRecord> listViewAnalysisRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewAnalysisRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewAnalysisRecord =
                                listViewAnalysisRecordList[listViewIndex];
                            return AnalysisItemWidget(
                              key: Key(
                                  'Keynvp_${listViewIndex}_of_${listViewAnalysisRecordList.length}'),
                              analysisDocument: listViewAnalysisRecord,
                            );
                          },
                        );
                      },
                    ),
                  ),
                if (_model.type == 'Med Hardware')
                  Expanded(
                    child: StreamBuilder<List<AnalysisRecord>>(
                      stream: queryAnalysisRecord(
                        parent: currentUserReference,
                        queryBuilder: (analysisRecord) => analysisRecord.where(
                          'isHardware',
                          isEqualTo: true,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<AnalysisRecord> listViewAnalysisRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewAnalysisRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewAnalysisRecord =
                                listViewAnalysisRecordList[listViewIndex];
                            return AnalysisItemWidget(
                              key: Key(
                                  'Key0w3_${listViewIndex}_of_${listViewAnalysisRecordList.length}'),
                              analysisDocument: listViewAnalysisRecord,
                            );
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
