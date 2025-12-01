import 'package:injectable/injectable.dart';
import 'package:nephroscan/features/ct_scan_screen/domain/entities/report_entity.dart';

import '../../domain/repositories/report_repository.dart';
import '../datasources/report_remote_datasource.dart';

@LazySingleton(as: ReportRepository)
class ReportRepositoryImpl implements ReportRepository {
  final ReportRemoteDatasource remoteDataSource;

  ReportRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ReportEntity>?> getReportsByIds(List<String>? reportIds) async {
    try {
      final reports = await remoteDataSource.getReportsByIds(reportIds);
      return reports?.map((singleReport) => singleReport.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }
}
