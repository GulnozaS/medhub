import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'single_analysis_model.dart';
export 'single_analysis_model.dart';

class SingleAnalysisWidget extends StatefulWidget {
  const SingleAnalysisWidget({
    super.key,
    required this.analysisDocument,
  });

  final AnalysisRecord? analysisDocument;

  @override
  State<SingleAnalysisWidget> createState() => _SingleAnalysisWidgetState();
}

class _SingleAnalysisWidgetState extends State<SingleAnalysisWidget> {
  late SingleAnalysisModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleAnalysisModel());

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
          title: Text(
            'Results',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.network(
                            widget.analysisDocument!.image,
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'ViewPhotoOrVideoPage',
                                queryParameters: {
                                  'isPhoto': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                  'imageUrl': serializeParam(
                                    widget.analysisDocument?.image,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              width: 70.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: const Color(0x0C12151C),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'View',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FlutterFlowVideoPlayer(
                            path:
                                'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                            videoType: VideoType.network,
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            autoPlay: false,
                            looping: false,
                            showControls: false,
                            allowFullScreen: true,
                            allowPlaybackSpeedMenu: false,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'ViewPhotoOrVideoPage',
                                  queryParameters: {
                                    'isPhoto': serializeParam(
                                      false,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                width: 70.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: const Color(0x0C12151C),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'View',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 10.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.analysisDocument?.analysisName,
                      '-',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: Icon(
                          Icons.location_on,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          valueOrDefault<String>(
                            widget.analysisDocument?.address,
                            '-',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 14.0,
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: Icon(
                        Icons.date_range_rounded,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 20.0,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          dateTimeFormat(
                              'yMMMd', widget.analysisDocument?.date),
                          '-',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 10.0),
                    child: StreamBuilder<DoctorsRecord>(
                      stream: DoctorsRecord.getDocument(
                          widget.analysisDocument!.doctor!),
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
                          'Directed from: ${'${textDoctorsRecord.firstName} ${textDoctorsRecord.lastName} ${textDoctorsRecord.middleName}'}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        );
                      },
                    ),
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
