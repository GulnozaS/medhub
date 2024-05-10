import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class MedicineRecord extends FirestoreRecord {
  MedicineRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "company" field.
  MedicineCompanyStruct? _company;
  MedicineCompanyStruct get company => _company ?? MedicineCompanyStruct();
  bool hasCompany() => _company != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _company = MedicineCompanyStruct.maybeFromMap(snapshotData['company']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medicine');

  static Stream<MedicineRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicineRecord.fromSnapshot(s));

  static Future<MedicineRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicineRecord.fromSnapshot(s));

  static MedicineRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicineRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicineRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicineRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicineRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicineRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicineRecordData({
  String? name,
  MedicineCompanyStruct? company,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'company': MedicineCompanyStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "company" field.
  addMedicineCompanyStructData(firestoreData, company, 'company');

  return firestoreData;
}

class MedicineRecordDocumentEquality implements Equality<MedicineRecord> {
  const MedicineRecordDocumentEquality();

  @override
  bool equals(MedicineRecord? e1, MedicineRecord? e2) {
    return e1?.name == e2?.name && e1?.company == e2?.company;
  }

  @override
  int hash(MedicineRecord? e) =>
      const ListEquality().hash([e?.name, e?.company]);

  @override
  bool isValidKey(Object? o) => o is MedicineRecord;
}
