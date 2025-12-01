import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/report_entity.dart';

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
    String? date,
    String? title,
    String? description,
    String? ctScanImageUrl,
  }) = _ReportModel;

  factory ReportModel.fromJson(Map<String, Object?> json) =>
      _$ReportModelFromJson(json);
  const ReportModel._();
  ReportEntity toEntity() => ReportEntity(
    id: id,
    patientId: patientId,
    doctorId: doctorId,
    findings: findings,
    impression: impression,
    date: date,
    title: title,
    description: description,
    ctScanImageUrl: ctScanImageUrl,
  );

  /// Convert Entity → Model
  factory ReportModel.fromEntity(ReportEntity entity) => ReportModel(
    id: entity.id,
    patientId: entity.patientId,
    doctorId: entity.doctorId,
    findings: entity.findings,
    impression: entity.impression,
    date: entity.date,
    title: entity.title,
    description: entity.description,
    ctScanImageUrl: entity.ctScanImageUrl,
  );
}
