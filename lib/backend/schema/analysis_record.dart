import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AnalysisRecord extends FirestoreRecord {
  AnalysisRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "analysis_name" field.
  String? _analysisName;
  String get analysisName => _analysisName ?? '';
  bool hasAnalysisName() => _analysisName != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "isHardware" field.
  bool? _isHardware;
  bool get isHardware => _isHardware ?? false;
  bool hasIsHardware() => _isHardware != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "doctor" field.
  DocumentReference? _doctor;
  DocumentReference? get doctor => _doctor;
  bool hasDoctor() => _doctor != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _analysisName = snapshotData['analysis_name'] as String?;
    _image = snapshotData['image'] as String?;
    _video = snapshotData['video'] as String?;
    _address = snapshotData['address'] as String?;
    _isHardware = snapshotData['isHardware'] as bool?;
    _date = snapshotData['date'] as DateTime?;
    _doctor = snapshotData['doctor'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('analysis')
          : FirebaseFirestore.instance.collectionGroup('analysis');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('analysis').doc(id);

  static Stream<AnalysisRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnalysisRecord.fromSnapshot(s));

  static Future<AnalysisRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnalysisRecord.fromSnapshot(s));

  static AnalysisRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnalysisRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnalysisRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnalysisRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnalysisRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnalysisRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnalysisRecordData({
  String? analysisName,
  String? image,
  String? video,
  String? address,
  bool? isHardware,
  DateTime? date,
  DocumentReference? doctor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'analysis_name': analysisName,
      'image': image,
      'video': video,
      'address': address,
      'isHardware': isHardware,
      'date': date,
      'doctor': doctor,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnalysisRecordDocumentEquality implements Equality<AnalysisRecord> {
  const AnalysisRecordDocumentEquality();

  @override
  bool equals(AnalysisRecord? e1, AnalysisRecord? e2) {
    return e1?.analysisName == e2?.analysisName &&
        e1?.image == e2?.image &&
        e1?.video == e2?.video &&
        e1?.address == e2?.address &&
        e1?.isHardware == e2?.isHardware &&
        e1?.date == e2?.date &&
        e1?.doctor == e2?.doctor;
  }

  @override
  int hash(AnalysisRecord? e) => const ListEquality().hash([
        e?.analysisName,
        e?.image,
        e?.video,
        e?.address,
        e?.isHardware,
        e?.date,
        e?.doctor
      ]);

  @override
  bool isValidKey(Object? o) => o is AnalysisRecord;
}
