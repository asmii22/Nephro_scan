import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_model.freezed.dart';
part 'report_model.g.dart';

@freezed
abstract class ReportModel with _$ReportModel {
  const factory ReportModel({
    String? id,
    String? patientId,
    String? doctorId,
    String? findings,
    String? impression,
    DateTime? date,
    String? title,
    String? description,
    String? ctScanImageUrl,
  }) = _ReportModel;

  factory ReportModel.fromJson(Map<String, Object?> json) =>
      _$ReportModelFromJson(json);
  const ReportModel._();
}
