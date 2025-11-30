import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:nephroscan/features/ct_scan_screen/data/models/report_model.dart';

import '../../../../core/firebase_client/authorized_firebase_client.dart';

abstract class CtScanDataSource {
  Future<void> uploadCtScanData(ReportModel? reportModel, File? file);
}

@LazySingleton(as: CtScanDataSource)
class CtScanDataSourceImpl implements CtScanDataSource {
  final AuthorizedFirebaseClient authorizedFirebaseClient;

  CtScanDataSourceImpl(this.authorizedFirebaseClient);
  @override
  Future<void> uploadCtScanData(ReportModel? reportModel, File? file) {
    try {
      if (reportModel == null || file == null) {
        throw Exception('ReportModel or File is null');
      }
      return authorizedFirebaseClient.uploadReport(reportModel, file);
    } catch (e) {
      throw Exception('Ct Scan upload failed: $e');
    }
  }
}
