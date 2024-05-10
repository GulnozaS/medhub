import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class HospitalsRecord extends FirestoreRecord {
  HospitalsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "website_url" field.
  String? _websiteUrl;
  String get websiteUrl => _websiteUrl ?? '';
  bool hasWebsiteUrl() => _websiteUrl != null;

  // "services" field.
  List<String>? _services;
  List<String> get services => _services ?? const [];
  bool hasServices() => _services != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _email = snapshotData['email'] as String?;
    _websiteUrl = snapshotData['website_url'] as String?;
    _services = getDataList(snapshotData['services']);
    _address = snapshotData['address'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hospitals');

  static Stream<HospitalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HospitalsRecord.fromSnapshot(s));

  static Future<HospitalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HospitalsRecord.fromSnapshot(s));

  static HospitalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HospitalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HospitalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HospitalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HospitalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HospitalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHospitalsRecordData({
  String? name,
  String? phoneNumber,
  String? email,
  String? websiteUrl,
  String? address,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'phone_number': phoneNumber,
      'email': email,
      'website_url': websiteUrl,
      'address': address,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class HospitalsRecordDocumentEquality implements Equality<HospitalsRecord> {
  const HospitalsRecordDocumentEquality();

  @override
  bool equals(HospitalsRecord? e1, HospitalsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.email == e2?.email &&
        e1?.websiteUrl == e2?.websiteUrl &&
        listEquality.equals(e1?.services, e2?.services) &&
        e1?.address == e2?.address &&
        e1?.image == e2?.image;
  }

  @override
  int hash(HospitalsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.phoneNumber,
        e?.email,
        e?.websiteUrl,
        e?.services,
        e?.address,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is HospitalsRecord;
}
