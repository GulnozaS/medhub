import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/analysis_item/analysis_item_widget.dart';
import '/pages/medication_item/medication_item_widget.dart';
import 'package:flutter/material.dart';
import 'single_disease_page_model.dart';
export 'single_disease_page_model.dart';

class SingleDiseasePageWidget extends StatefulWidget {
  const SingleDiseasePageWidget({
    super.key,
    required this.diseaseDocument,
  });

  final DiseaseHistoryRecord? diseaseDocument;

  @override
  State<SingleDiseasePageWidget> createState() =>
      _SingleDiseasePageWidgetState();
}

class _SingleDiseasePageWidgetState extends State<SingleDiseasePageWidget> {
  late SingleDiseasePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleDiseasePageModel());

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
          leading: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 0.0, 10.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 12.0,
              buttonSize: 20.0,
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 16.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.diseaseDocument?.diagnosisName,
                              '-',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Details: ${valueOrDefault<String>(
                              widget.diseaseDocument?.details,
                              '-',
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Icon(
                            Icons.person,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 20.0,
                          ),
                        ),
                        Expanded(
                          child: StreamBuilder<DoctorsRecord>(
                            stream: DoctorsRecord.getDocument(
                                widget.diseaseDocument!.doctorRef!),
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
                              final textDoctorsRecord = snapshot.data!;
                              return Text(
                                'Doctor: ${textDoctorsRecord.firstName} ${textDoctorsRecord.lastName} ${textDoctorsRecord.middleName}. ${textDoctorsRecord.experienceInfo}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Icon(
                            Icons.date_range,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 20.0,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Date: ${dateTimeFormat('d/M/y', widget.diseaseDocument?.date)}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Icon(
                            Icons.location_on,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 20.0,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Address: ${valueOrDefault<String>(
                              widget.diseaseDocument?.address,
                              '-',
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Text(
                      'Medication:',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      final medicationItem =
                          widget.diseaseDocument?.medicineInfo.toList() ?? [];
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(medicationItem.length,
                            (medicationItemIndex) {
                          final medicationItemItem =
                              medicationItem[medicationItemIndex];
                          return MedicationItemWidget(
                            key: Key(
                                'Keyan6_${medicationItemIndex}_of_${medicationItem.length}'),
                            medicationInfo: medicationItemItem,
                          );
                        }),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Text(
                      'Analysis:',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      final analysisRef =
                          widget.diseaseDocument?.analysis.toList() ?? [];
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(analysisRef.length,
                            (analysisRefIndex) {
                          final analysisRefItem = analysisRef[analysisRefIndex];
                          return StreamBuilder<AnalysisRecord>(
                            stream: AnalysisRecord.getDocument(analysisRefItem),
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
                              final analysisItemAnalysisRecord = snapshot.data!;
                              return AnalysisItemWidget(
                                key: Key(
                                    'Keyodl_${analysisRefIndex}_of_${analysisRef.length}'),
                                analysisDocument: analysisItemAnalysisRecord,
                              );
                            },
                          );
                        }),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
