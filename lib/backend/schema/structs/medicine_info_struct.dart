// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicineInfoStruct extends FFFirebaseStruct {
  MedicineInfoStruct({
    String? prescription,
    DocumentReference? medicine,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _prescription = prescription,
        _medicine = medicine,
        super(firestoreUtilData);

  // "prescription" field.
  String? _prescription;
  String get prescription => _prescription ?? '';
  set prescription(String? val) => _prescription = val;
  bool hasPrescription() => _prescription != null;

  // "medicine" field.
  DocumentReference? _medicine;
  DocumentReference? get medicine => _medicine;
  set medicine(DocumentReference? val) => _medicine = val;
  bool hasMedicine() => _medicine != null;

  static MedicineInfoStruct fromMap(Map<String, dynamic> data) =>
      MedicineInfoStruct(
        prescription: data['prescription'] as String?,
        medicine: data['medicine'] as DocumentReference?,
      );

  static MedicineInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? MedicineInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'prescription': _prescription,
        'medicine': _medicine,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'prescription': serializeParam(
          _prescription,
          ParamType.String,
        ),
        'medicine': serializeParam(
          _medicine,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static MedicineInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      MedicineInfoStruct(
        prescription: deserializeParam(
          data['prescription'],
          ParamType.String,
          false,
        ),
        medicine: deserializeParam(
          data['medicine'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['medicine'],
        ),
      );

  @override
  String toString() => 'MedicineInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MedicineInfoStruct &&
        prescription == other.prescription &&
        medicine == other.medicine;
  }

  @override
  int get hashCode => const ListEquality().hash([prescription, medicine]);
}

MedicineInfoStruct createMedicineInfoStruct({
  String? prescription,
  DocumentReference? medicine,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MedicineInfoStruct(
      prescription: prescription,
      medicine: medicine,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MedicineInfoStruct? updateMedicineInfoStruct(
  MedicineInfoStruct? medicineInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    medicineInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMedicineInfoStructData(
  Map<String, dynamic> firestoreData,
  MedicineInfoStruct? medicineInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (medicineInfo == null) {
    return;
  }
  if (medicineInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && medicineInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final medicineInfoData =
      getMedicineInfoFirestoreData(medicineInfo, forFieldValue);
  final nestedData =
      medicineInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = medicineInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMedicineInfoFirestoreData(
  MedicineInfoStruct? medicineInfo, [
  bool forFieldValue = false,
]) {
  if (medicineInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(medicineInfo.toMap());

  // Add any Firestore field values
  medicineInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMedicineInfoListFirestoreData(
  List<MedicineInfoStruct>? medicineInfos,
) =>
    medicineInfos?.map((e) => getMedicineInfoFirestoreData(e, true)).toList() ??
    [];
