import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIndex(int value) {
    _pageIndex = value;
  }

  String _emailaddress = 'sabirjonovagulnoza@gmail.com';
  String get emailaddress => _emailaddress;
  set emailaddress(String value) {
    _emailaddress = value;
  }

  String _password = '111111';
  String get password => _password;
  set password(String value) {
    _password = value;
  }

  List<MedicineInfoStruct> _medicineInfo = [
    MedicineInfoStruct.fromSerializableMap(jsonDecode(
        '{\"medicine\":\"{\\\"company_name\\\":\\\"Hello World\\\",\\\"country\\\":\\\"Hello World\\\"}\",\"prescription\":\"Hello World\"}'))
  ];
  List<MedicineInfoStruct> get medicineInfo => _medicineInfo;
  set medicineInfo(List<MedicineInfoStruct> value) {
    _medicineInfo = value;
  }

  void addToMedicineInfo(MedicineInfoStruct value) {
    _medicineInfo.add(value);
  }

  void removeFromMedicineInfo(MedicineInfoStruct value) {
    _medicineInfo.remove(value);
  }

  void removeAtIndexFromMedicineInfo(int index) {
    _medicineInfo.removeAt(index);
  }

  void updateMedicineInfoAtIndex(
    int index,
    MedicineInfoStruct Function(MedicineInfoStruct) updateFn,
  ) {
    _medicineInfo[index] = updateFn(_medicineInfo[index]);
  }

  void insertAtIndexInMedicineInfo(int index, MedicineInfoStruct value) {
    _medicineInfo.insert(index, value);
  }

  List<DocumentReference> _analysis = [
    FirebaseFirestore.instance.doc(
        '/patients/NJFsVnkpsSf19emcCfFdDL9NfeB2/analysis/HUGllP5Gvxfj5URB00Or'),
    FirebaseFirestore.instance.doc(
        '/patients/NJFsVnkpsSf19emcCfFdDL9NfeB2/analysis/XRubLxdvPUprPikmHl5t')
  ];
  List<DocumentReference> get analysis => _analysis;
  set analysis(List<DocumentReference> value) {
    _analysis = value;
  }

  void addToAnalysis(DocumentReference value) {
    _analysis.add(value);
  }

  void removeFromAnalysis(DocumentReference value) {
    _analysis.remove(value);
  }

  void removeAtIndexFromAnalysis(int index) {
    _analysis.removeAt(index);
  }

  void updateAnalysisAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _analysis[index] = updateFn(_analysis[index]);
  }

  void insertAtIndexInAnalysis(int index, DocumentReference value) {
    _analysis.insert(index, value);
  }

  List<MedicineInfoStruct> _medInfo = [
    MedicineInfoStruct.fromSerializableMap(jsonDecode(
        '{\"prescription\":\"Dosage: 500 mg per tablet. Take 1 tablet in the morning and 1 tablet in the evening with water. Continue for 7 days.\",\"medicine\":\"/medicine/2dc86gUhdGccgVPknlum\"}')),
    MedicineInfoStruct.fromSerializableMap(jsonDecode(
        '{\"prescription\":\"Dosage: 850 mg per tablet. Take 1 tablet in the morning with breakfast. If you experience stomach upset, take with a small snack.\",\"medicine\":\"/medicine/FsdMgS0N6xgursgFpBSz\"}')),
    MedicineInfoStruct.fromSerializableMap(jsonDecode(
        '{\"prescription\":\"Dosage: 10 mg per tablet. Take 1 tablet in the morning before breakfast. Ensure consistent daily intake at the same time.\",\"medicine\":\"/medicine/JRzTb5gx5havcIvorFan\"}')),
    MedicineInfoStruct.fromSerializableMap(jsonDecode(
        '{\"prescription\":\"Dosage: 20 mg per tablet. Take 1 tablet in the evening before going to bed. Avoid eating grapefruit or drinking grapefruit juice while on this medication.\",\"medicine\":\"/medicine/NLDE46m1YJFNd7rolWkt\"}'))
  ];
  List<MedicineInfoStruct> get medInfo => _medInfo;
  set medInfo(List<MedicineInfoStruct> value) {
    _medInfo = value;
  }

  void addToMedInfo(MedicineInfoStruct value) {
    _medInfo.add(value);
  }

  void removeFromMedInfo(MedicineInfoStruct value) {
    _medInfo.remove(value);
  }

  void removeAtIndexFromMedInfo(int index) {
    _medInfo.removeAt(index);
  }

  void updateMedInfoAtIndex(
    int index,
    MedicineInfoStruct Function(MedicineInfoStruct) updateFn,
  ) {
    _medInfo[index] = updateFn(_medInfo[index]);
  }

  void insertAtIndexInMedInfo(int index, MedicineInfoStruct value) {
    _medInfo.insert(index, value);
  }

  DocumentReference? _doctorref = FirebaseFirestore.instance
      .doc('/hospitals/VKbSrUiZ9TgwhfFDRCox/doctors/Im4XwfSbzYVlxFF70UE7');
  DocumentReference? get doctorref => _doctorref;
  set doctorref(DocumentReference? value) {
    _doctorref = value;
  }

  DocumentReference? _daigd = FirebaseFirestore.instance.doc(
      '/patients/NJFsVnkpsSf19emcCfFdDL9NfeB2/disease_history/zMIl7cTerUQPxUNJu5n0');
  DocumentReference? get daigd => _daigd;
  set daigd(DocumentReference? value) {
    _daigd = value;
  }

  String _location = 'All';
  String get location => _location;
  set location(String value) {
    _location = value;
  }
}
