import '../../../ct_scan_screen/domain/entities/report_entity.dart';

abstract class ReportRepository {
  Future<List<ReportEntity>?> getReportsByIds(List<String>? reportIds);
}
