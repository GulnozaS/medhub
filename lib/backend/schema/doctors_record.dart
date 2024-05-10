import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class DoctorsRecord extends FirestoreRecord {
  DoctorsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "middle_name" field.
  String? _middleName;
  String get middleName => _middleName ?? '';
  bool hasMiddleName() => _middleName != null;

  // "experience_info" field.
  String? _experienceInfo;
  String get experienceInfo => _experienceInfo ?? '';
  bool hasExperienceInfo() => _experienceInfo != null;

  // "degree" field.
  String? _degree;
  String get degree => _degree ?? '';
  bool hasDegree() => _degree != null;

  // "date_of_birth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "service" field.
  String? _service;
  String get service => _service ?? '';
  bool hasService() => _service != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _middleName = snapshotData['middle_name'] as String?;
    _experienceInfo = snapshotData['experience_info'] as String?;
    _degree = snapshotData['degree'] as String?;
    _dateOfBirth = snapshotData['date_of_birth'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _service = snapshotData['service'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('doctors')
          : FirebaseFirestore.instance.collectionGroup('doctors');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('doctors').doc(id);

  static Stream<DoctorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DoctorsRecord.fromSnapshot(s));

  static Future<DoctorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DoctorsRecord.fromSnapshot(s));

  static DoctorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DoctorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DoctorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DoctorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DoctorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DoctorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDoctorsRecordData({
  String? firstName,
  String? lastName,
  String? middleName,
  String? experienceInfo,
  String? degree,
  DateTime? dateOfBirth,
  String? image,
  String? service,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'middle_name': middleName,
      'experience_info': experienceInfo,
      'degree': degree,
      'date_of_birth': dateOfBirth,
      'image': image,
      'service': service,
    }.withoutNulls,
  );

  return firestoreData;
}

class DoctorsRecordDocumentEquality implements Equality<DoctorsRecord> {
  const DoctorsRecordDocumentEquality();

  @override
  bool equals(DoctorsRecord? e1, DoctorsRecord? e2) {
    return e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.middleName == e2?.middleName &&
        e1?.experienceInfo == e2?.experienceInfo &&
        e1?.degree == e2?.degree &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.image == e2?.image &&
        e1?.service == e2?.service;
  }

  @override
  int hash(DoctorsRecord? e) => const ListEquality().hash([
        e?.firstName,
        e?.lastName,
        e?.middleName,
        e?.experienceInfo,
        e?.degree,
        e?.dateOfBirth,
        e?.image,
        e?.service
      ]);

  @override
  bool isValidKey(Object? o) => o is DoctorsRecord;
}
