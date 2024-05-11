import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/personal_info_item/personal_info_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    _model.emailTextController ??= TextEditingController();
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          iconTheme: IconThemeData(color: FlutterFlowTheme.of(context).primary),
          automaticallyImplyLeading: false,
          title: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (_model.emailTextController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Email required!',
                    ),
                  ),
                );
                return;
              }
              await authManager.resetPassword(
                email: _model.emailTextController.text,
                context: context,
              );
            },
            child: Text(
              'MedHub',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).primary,
                    fontSize: 28.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 2.0, 25.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Personal Information',
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: FlutterFlowIconButton(
                            borderColor: const Color(0x66344054),
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 30.0,
                            icon: Icon(
                              Icons.logout_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 12.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  AuthUserStreamWidget(
                    builder: (context) => wrapWithModel(
                      model: _model.personalInfoItemModel1,
                      updateCallback: () => setState(() {}),
                      child: PersonalInfoItemWidget(
                        title: 'Full Name',
                        info:
                            '$currentUserDisplayName ${valueOrDefault(currentUserDocument?.lastName, '')} ${valueOrDefault(currentUserDocument?.middleName, '')}',
                      ),
                    ),
                  ),
                  AuthUserStreamWidget(
                    builder: (context) => wrapWithModel(
                      model: _model.personalInfoItemModel2,
                      updateCallback: () => setState(() {}),
                      child: PersonalInfoItemWidget(
                        title: 'Date of birth',
                        info: dateTimeFormat(
                            'd/M/y', currentUserDocument!.dateOfBirth!),
                      ),
                    ),
                  ),
                  AuthUserStreamWidget(
                    builder: (context) => wrapWithModel(
                      model: _model.personalInfoItemModel3,
                      updateCallback: () => setState(() {}),
                      child: PersonalInfoItemWidget(
                        title: 'Phone Number',
                        info: currentPhoneNumber,
                      ),
                    ),
                  ),
                  AuthUserStreamWidget(
                    builder: (context) => wrapWithModel(
                      model: _model.personalInfoItemModel4,
                      updateCallback: () => setState(() {}),
                      child: PersonalInfoItemWidget(
                        title: 'Address',
                        info: valueOrDefault(currentUserDocument?.address, ''),
                      ),
                    ),
                  ),
                  AuthUserStreamWidget(
                    builder: (context) => wrapWithModel(
                      model: _model.personalInfoItemModel5,
                      updateCallback: () => setState(() {}),
                      child: PersonalInfoItemWidget(
                        title: 'Blood group',
                        info:
                            valueOrDefault(currentUserDocument?.bloodGroup, ''),
                      ),
                    ),
                  ),
                  StreamBuilder<List<VaccinationHistoryRecord>>(
                    stream: queryVaccinationHistoryRecord(
                      parent: currentUserReference,
                      queryBuilder: (vaccinationHistoryRecord) =>
                          vaccinationHistoryRecord.orderBy('date',
                              descending: true),
                      singleRecord: true,
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
                      List<VaccinationHistoryRecord>
                          personalInfoItemVaccinationHistoryRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final personalInfoItemVaccinationHistoryRecord =
                          personalInfoItemVaccinationHistoryRecordList
                                  .isNotEmpty
                              ? personalInfoItemVaccinationHistoryRecordList
                                  .first
                              : null;
                      return wrapWithModel(
                        model: _model.personalInfoItemModel6,
                        updateCallback: () => setState(() {}),
                        child: PersonalInfoItemWidget(
                          title: 'Last Vaccination',
                          info: personalInfoItemVaccinationHistoryRecord!
                              .vaccinationName,
                        ),
                      );
                    },
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('VaccinationsPage');
                    },
                    child: Container(
                      width: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 20.0, 10.0),
                          child: FaIcon(
                            FontAwesomeIcons.arrowRight,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  StreamBuilder<List<DiseaseHistoryRecord>>(
                    stream: queryDiseaseHistoryRecord(
                      parent: currentUserReference,
                      queryBuilder: (diseaseHistoryRecord) =>
                          diseaseHistoryRecord.orderBy('date',
                              descending: true),
                      singleRecord: true,
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
                      List<DiseaseHistoryRecord>
                          personalInfoItemDiseaseHistoryRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final personalInfoItemDiseaseHistoryRecord =
                          personalInfoItemDiseaseHistoryRecordList.isNotEmpty
                              ? personalInfoItemDiseaseHistoryRecordList.first
                              : null;
                      return wrapWithModel(
                        model: _model.personalInfoItemModel7,
                        updateCallback: () => setState(() {}),
                        child: PersonalInfoItemWidget(
                          title: 'Last Disease',
                          info: personalInfoItemDiseaseHistoryRecord!
                              .diagnosisName,
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('DiseasesPage');
                      },
                      child: Container(
                        width: 60.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: FaIcon(
                              FontAwesomeIcons.arrowRight,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: TextFormField(
                      controller: _model.emailTextController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Label here...',
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                      validator: _model.emailTextControllerValidator
                          .asValidator(context),
                    ),
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
