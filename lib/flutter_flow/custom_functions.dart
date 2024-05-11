import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<AnalysisRecord> searchAnalysis(
  List<AnalysisRecord> analysisDocs,
  String searchText,
) {
  List<AnalysisRecord> result = [];
  analysisDocs.forEach((element) {
    if (element.analysisName.toLowerCase().contains(searchText.toLowerCase())) {
      result.add(element);
    }
  });
  return result;
}

List<HospitalsRecord> searchHospital(
  List<HospitalsRecord> hospitalsDoc,
  String searchText,
  String location,
) {
  List<HospitalsRecord> result = [];
  hospitalsDoc.forEach((element) {
    if (element.name.toLowerCase().contains(searchText.toLowerCase()) &&
        element.address.contains(location)) {
      result.add(element);
    }
  });
  return result;
}

List<HospitalsRecord> searchHospitalCopy(
  List<HospitalsRecord> hospitalsDoc,
  String searchText,
) {
  List<HospitalsRecord> result = [];
  hospitalsDoc.forEach((element) {
    if (element.name.toLowerCase().contains(searchText.toLowerCase())) {
      result.add(element);
    }
  });
  return result;
}
