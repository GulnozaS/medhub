import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PatientsRecord extends FirestoreRecord {
  PatientsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "middle_name" field.
  String? _middleName;
  String get middleName => _middleName ?? '';
  bool hasMiddleName() => _middleName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "blood_group" field.
  String? _bloodGroup;
  String get bloodGroup => _bloodGroup ?? '';
  bool hasBloodGroup() => _bloodGroup != null;

  // "date_of_birth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _lastName = snapshotData['last_name'] as String?;
    _middleName = snapshotData['middle_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _address = snapshotData['address'] as String?;
    _bloodGroup = snapshotData['blood_group'] as String?;
    _dateOfBirth = snapshotData['date_of_birth'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('patients');

  static Stream<PatientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PatientsRecord.fromSnapshot(s));

  static Future<PatientsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PatientsRecord.fromSnapshot(s));

  static PatientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PatientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PatientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PatientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PatientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PatientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPatientsRecordData({
  String? lastName,
  String? middleName,
  String? phoneNumber,
  String? address,
  String? bloodGroup,
  DateTime? dateOfBirth,
  String? email,
  String? displayName,
  String? uid,
  String? photoUrl,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'last_name': lastName,
      'middle_name': middleName,
      'phone_number': phoneNumber,
      'address': address,
      'blood_group': bloodGroup,
      'date_of_birth': dateOfBirth,
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'photo_url': photoUrl,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class PatientsRecordDocumentEquality implements Equality<PatientsRecord> {
  const PatientsRecordDocumentEquality();

  @override
  bool equals(PatientsRecord? e1, PatientsRecord? e2) {
    return e1?.lastName == e2?.lastName &&
        e1?.middleName == e2?.middleName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.address == e2?.address &&
        e1?.bloodGroup == e2?.bloodGroup &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(PatientsRecord? e) => const ListEquality().hash([
        e?.lastName,
        e?.middleName,
        e?.phoneNumber,
        e?.address,
        e?.bloodGroup,
        e?.dateOfBirth,
        e?.email,
        e?.displayName,
        e?.uid,
        e?.photoUrl,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is PatientsRecord;
}
