import 'package:injectable/injectable.dart';

import '../../../../core/firebase_client/authorized_firebase_client.dart';
import '../../../ct_scan_screen/data/models/report_model.dart';

abstract class ReportRemoteDatasource {
  Future<List<ReportModel>?> getReportsByIds(List<String>? reportIds);
}

@LazySingleton(as: ReportRemoteDatasource)
class ReportRemoteDatasourceImpl implements ReportRemoteDatasource {
  final AuthorizedFirebaseClient _authorizedFirebaseClient;

  ReportRemoteDatasourceImpl(this._authorizedFirebaseClient);

  @override
  Future<List<ReportModel>?> getReportsByIds(List<String>? reportIds) {
    try {
      if (reportIds == null || reportIds.isEmpty) {
        throw Exception('Report IDs list is null or empty');
      }
      return _authorizedFirebaseClient.getReportsByIds(reportIds);
    } catch (e) {
      throw Exception('Get reports by IDs failed: $e');
    }
  }
}
