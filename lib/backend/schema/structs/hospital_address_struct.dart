// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class HospitalAddressStruct extends FFFirebaseStruct {
  HospitalAddressStruct({
    String? region,
    String? streetAddress,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _region = region,
        _streetAddress = streetAddress,
        super(firestoreUtilData);

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  set region(String? val) => _region = val;
  bool hasRegion() => _region != null;

  // "street_address" field.
  String? _streetAddress;
  String get streetAddress => _streetAddress ?? '';
  set streetAddress(String? val) => _streetAddress = val;
  bool hasStreetAddress() => _streetAddress != null;

  static HospitalAddressStruct fromMap(Map<String, dynamic> data) =>
      HospitalAddressStruct(
        region: data['region'] as String?,
        streetAddress: data['street_address'] as String?,
      );

  static HospitalAddressStruct? maybeFromMap(dynamic data) => data is Map
      ? HospitalAddressStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'region': _region,
        'street_address': _streetAddress,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'region': serializeParam(
          _region,
          ParamType.String,
        ),
        'street_address': serializeParam(
          _streetAddress,
          ParamType.String,
        ),
      }.withoutNulls;

  static HospitalAddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      HospitalAddressStruct(
        region: deserializeParam(
          data['region'],
          ParamType.String,
          false,
        ),
        streetAddress: deserializeParam(
          data['street_address'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HospitalAddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HospitalAddressStruct &&
        region == other.region &&
        streetAddress == other.streetAddress;
  }

  @override
  int get hashCode => const ListEquality().hash([region, streetAddress]);
}

HospitalAddressStruct createHospitalAddressStruct({
  String? region,
  String? streetAddress,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HospitalAddressStruct(
      region: region,
      streetAddress: streetAddress,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HospitalAddressStruct? updateHospitalAddressStruct(
  HospitalAddressStruct? hospitalAddress, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    hospitalAddress
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHospitalAddressStructData(
  Map<String, dynamic> firestoreData,
  HospitalAddressStruct? hospitalAddress,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (hospitalAddress == null) {
    return;
  }
  if (hospitalAddress.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && hospitalAddress.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final hospitalAddressData =
      getHospitalAddressFirestoreData(hospitalAddress, forFieldValue);
  final nestedData =
      hospitalAddressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = hospitalAddress.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHospitalAddressFirestoreData(
  HospitalAddressStruct? hospitalAddress, [
  bool forFieldValue = false,
]) {
  if (hospitalAddress == null) {
    return {};
  }
  final firestoreData = mapToFirestore(hospitalAddress.toMap());

  // Add any Firestore field values
  hospitalAddress.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHospitalAddressListFirestoreData(
  List<HospitalAddressStruct>? hospitalAddresss,
) =>
    hospitalAddresss
        ?.map((e) => getHospitalAddressFirestoreData(e, true))
        .toList() ??
    [];
