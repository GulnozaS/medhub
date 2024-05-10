// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MedicineCompanyStruct extends FFFirebaseStruct {
  MedicineCompanyStruct({
    String? companyName,
    String? country,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _companyName = companyName,
        _country = country,
        super(firestoreUtilData);

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  set companyName(String? val) => _companyName = val;
  bool hasCompanyName() => _companyName != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;
  bool hasCountry() => _country != null;

  static MedicineCompanyStruct fromMap(Map<String, dynamic> data) =>
      MedicineCompanyStruct(
        companyName: data['company_name'] as String?,
        country: data['country'] as String?,
      );

  static MedicineCompanyStruct? maybeFromMap(dynamic data) => data is Map
      ? MedicineCompanyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'company_name': _companyName,
        'country': _country,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'company_name': serializeParam(
          _companyName,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
      }.withoutNulls;

  static MedicineCompanyStruct fromSerializableMap(Map<String, dynamic> data) =>
      MedicineCompanyStruct(
        companyName: deserializeParam(
          data['company_name'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MedicineCompanyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MedicineCompanyStruct &&
        companyName == other.companyName &&
        country == other.country;
  }

  @override
  int get hashCode => const ListEquality().hash([companyName, country]);
}

MedicineCompanyStruct createMedicineCompanyStruct({
  String? companyName,
  String? country,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MedicineCompanyStruct(
      companyName: companyName,
      country: country,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MedicineCompanyStruct? updateMedicineCompanyStruct(
  MedicineCompanyStruct? medicineCompany, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    medicineCompany
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMedicineCompanyStructData(
  Map<String, dynamic> firestoreData,
  MedicineCompanyStruct? medicineCompany,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (medicineCompany == null) {
    return;
  }
  if (medicineCompany.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && medicineCompany.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final medicineCompanyData =
      getMedicineCompanyFirestoreData(medicineCompany, forFieldValue);
  final nestedData =
      medicineCompanyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = medicineCompany.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMedicineCompanyFirestoreData(
  MedicineCompanyStruct? medicineCompany, [
  bool forFieldValue = false,
]) {
  if (medicineCompany == null) {
    return {};
  }
  final firestoreData = mapToFirestore(medicineCompany.toMap());

  // Add any Firestore field values
  medicineCompany.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMedicineCompanyListFirestoreData(
  List<MedicineCompanyStruct>? medicineCompanys,
) =>
    medicineCompanys
        ?.map((e) => getMedicineCompanyFirestoreData(e, true))
        .toList() ??
    [];
