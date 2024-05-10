import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'hospital_item_model.dart';
export 'hospital_item_model.dart';

class HospitalItemWidget extends StatefulWidget {
  const HospitalItemWidget({
    super.key,
    required this.hospitalDocument,
  });

  final HospitalsRecord? hospitalDocument;

  @override
  State<HospitalItemWidget> createState() => _HospitalItemWidgetState();
}

class _HospitalItemWidgetState extends State<HospitalItemWidget> {
  late HospitalItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HospitalItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0x19105DFB),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: Image.network(
                widget.hospitalDocument!.image,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 12.0),
            child: Text(
              valueOrDefault<String>(
                widget.hospitalDocument?.name,
                '-',
              ).maybeHandleOverflow(
                maxChars: 15,
                replacement: '…',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 20.0,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.hospitalDocument?.address,
                          '-',
                        ).maybeHandleOverflow(
                          maxChars: 10,
                          replacement: '…',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'SingleHospitalPage',
                          queryParameters: {
                            'hospitalDocument': serializeParam(
                              widget.hospitalDocument,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'hospitalDocument': widget.hospitalDocument,
                          },
                        );
                      },
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
          ),
        ],
      ),
    );
  }
}
