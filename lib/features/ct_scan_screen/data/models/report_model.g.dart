// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportModel _$ReportModelFromJson(Map<String, dynamic> json) => _ReportModel(
  id: json['id'] as String?,
  patientId: json['patientId'] as String?,
  doctorId: json['doctorId'] as String?,
  findings: json['findings'] as String?,
  impression: json['impression'] as String?,
  date: json['date'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  ctScanImageUrl: json['ctScanImageUrl'] as String?,
);

Map<String, dynamic> _$ReportModelToJson(_ReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'doctorId': instance.doctorId,
      'findings': instance.findings,
      'impression': instance.impression,
      'date': instance.date,
      'title': instance.title,
      'description': instance.description,
      'ctScanImageUrl': instance.ctScanImageUrl,
    };
