import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class DiseaseHistoryRecord extends FirestoreRecord {
  DiseaseHistoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "diagnosis_name" field.
  String? _diagnosisName;
  String get diagnosisName => _diagnosisName ?? '';
  bool hasDiagnosisName() => _diagnosisName != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "analysis" field.
  List<DocumentReference>? _analysis;
  List<DocumentReference> get analysis => _analysis ?? const [];
  bool hasAnalysis() => _analysis != null;

  // "medicineInfo" field.
  List<MedicineInfoStruct>? _medicineInfo;
  List<MedicineInfoStruct> get medicineInfo => _medicineInfo ?? const [];
  bool hasMedicineInfo() => _medicineInfo != null;

  // "doctorRef" field.
  DocumentReference? _doctorRef;
  DocumentReference? get doctorRef => _doctorRef;
  bool hasDoctorRef() => _doctorRef != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _diagnosisName = snapshotData['diagnosis_name'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _address = snapshotData['address'] as String?;
    _analysis = getDataList(snapshotData['analysis']);
    _medicineInfo = getStructList(
      snapshotData['medicineInfo'],
      MedicineInfoStruct.fromMap,
    );
    _doctorRef = snapshotData['doctorRef'] as DocumentReference?;
    _details = snapshotData['details'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('disease_history')
          : FirebaseFirestore.instance.collectionGroup('disease_history');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('disease_history').doc(id);

  static Stream<DiseaseHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DiseaseHistoryRecord.fromSnapshot(s));

  static Future<DiseaseHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DiseaseHistoryRecord.fromSnapshot(s));

  static DiseaseHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DiseaseHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiseaseHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiseaseHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiseaseHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DiseaseHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDiseaseHistoryRecordData({
  String? diagnosisName,
  DateTime? date,
  String? address,
  DocumentReference? doctorRef,
  String? details,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'diagnosis_name': diagnosisName,
      'date': date,
      'address': address,
      'doctorRef': doctorRef,
      'details': details,
    }.withoutNulls,
  );

  return firestoreData;
}

class DiseaseHistoryRecordDocumentEquality
    implements Equality<DiseaseHistoryRecord> {
  const DiseaseHistoryRecordDocumentEquality();

  @override
  bool equals(DiseaseHistoryRecord? e1, DiseaseHistoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.diagnosisName == e2?.diagnosisName &&
        e1?.date == e2?.date &&
        e1?.address == e2?.address &&
        listEquality.equals(e1?.analysis, e2?.analysis) &&
        listEquality.equals(e1?.medicineInfo, e2?.medicineInfo) &&
        e1?.doctorRef == e2?.doctorRef &&
        e1?.details == e2?.details;
  }

  @override
  int hash(DiseaseHistoryRecord? e) => const ListEquality().hash([
        e?.diagnosisName,
        e?.date,
        e?.address,
        e?.analysis,
        e?.medicineInfo,
        e?.doctorRef,
        e?.details
      ]);

  @override
  bool isValidKey(Object? o) => o is DiseaseHistoryRecord;
}
