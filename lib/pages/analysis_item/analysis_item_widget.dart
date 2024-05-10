import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'analysis_item_model.dart';
export 'analysis_item_model.dart';

class AnalysisItemWidget extends StatefulWidget {
  const AnalysisItemWidget({
    super.key,
    required this.analysisDocument,
  });

  final AnalysisRecord? analysisDocument;

  @override
  State<AnalysisItemWidget> createState() => _AnalysisItemWidgetState();
}

class _AnalysisItemWidgetState extends State<AnalysisItemWidget> {
  late AnalysisItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnalysisItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0x19105DFB),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.analysisDocument?.analysisName,
                    '-',
                  ).maybeHandleOverflow(
                    maxChars: 29,
                    replacement: '…',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.hotel,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 12.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.analysisDocument?.address,
                                  '-',
                                ).maybeHandleOverflow(
                                  maxChars: 20,
                                  replacement: '…',
                                ),
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.calendar_today_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 20.0,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 12.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                dateTimeFormat(
                                    'd/M/y', widget.analysisDocument?.date),
                                '-',
                              ).maybeHandleOverflow(
                                maxChars: 20,
                                replacement: '…',
                              ),
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'SingleAnalysis',
                        queryParameters: {
                          'analysisDocument': serializeParam(
                            widget.analysisDocument,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'analysisDocument': widget.analysisDocument,
                        },
                      );
                    },
                    child: Container(
                      width: 60.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FaIcon(
                          FontAwesomeIcons.arrowRight,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
