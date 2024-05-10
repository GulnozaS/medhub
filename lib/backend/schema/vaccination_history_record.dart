import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class VaccinationHistoryRecord extends FirestoreRecord {
  VaccinationHistoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "vaccination_name" field.
  String? _vaccinationName;
  String get vaccinationName => _vaccinationName ?? '';
  bool hasVaccinationName() => _vaccinationName != null;

  // "purpose" field.
  String? _purpose;
  String get purpose => _purpose ?? '';
  bool hasPurpose() => _purpose != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _vaccinationName = snapshotData['vaccination_name'] as String?;
    _purpose = snapshotData['purpose'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _address = snapshotData['address'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('vaccination_history')
          : FirebaseFirestore.instance.collectionGroup('vaccination_history');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('vaccination_history').doc(id);

  static Stream<VaccinationHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VaccinationHistoryRecord.fromSnapshot(s));

  static Future<VaccinationHistoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => VaccinationHistoryRecord.fromSnapshot(s));

  static VaccinationHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VaccinationHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VaccinationHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VaccinationHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VaccinationHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VaccinationHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVaccinationHistoryRecordData({
  String? vaccinationName,
  String? purpose,
  DateTime? date,
  String? address,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'vaccination_name': vaccinationName,
      'purpose': purpose,
      'date': date,
      'address': address,
    }.withoutNulls,
  );

  return firestoreData;
}

class VaccinationHistoryRecordDocumentEquality
    implements Equality<VaccinationHistoryRecord> {
  const VaccinationHistoryRecordDocumentEquality();

  @override
  bool equals(VaccinationHistoryRecord? e1, VaccinationHistoryRecord? e2) {
    return e1?.vaccinationName == e2?.vaccinationName &&
        e1?.purpose == e2?.purpose &&
        e1?.date == e2?.date &&
        e1?.address == e2?.address;
  }

  @override
  int hash(VaccinationHistoryRecord? e) => const ListEquality()
      .hash([e?.vaccinationName, e?.purpose, e?.date, e?.address]);

  @override
  bool isValidKey(Object? o) => o is VaccinationHistoryRecord;
}
