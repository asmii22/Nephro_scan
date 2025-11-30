import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:nephroscan/features/ct_scan_screen/data/datasources/ct_scan_data_source.dart';
import 'package:nephroscan/features/ct_scan_screen/data/models/report_model.dart';

import '../../domain/repositories/ct_scan_repository.dart';

@LazySingleton(as: CtScanRepository)
class CtScanRepositoryImpl implements CtScanRepository {
  final CtScanDataSource remoteDataSource;
  CtScanRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> uploadCtScanData(ReportModel? report, File? ctScanFile) async {
    try {
      final ctScan = await remoteDataSource.uploadCtScanData(
        report,
        ctScanFile,
      );
      return ctScan;
    } catch (e) {
      rethrow;
    }
  }
}
