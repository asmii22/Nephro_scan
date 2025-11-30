import 'dart:io';

import '../../data/models/report_model.dart';

abstract class CtScanRepository {
  Future<void> uploadCtScanData(ReportModel? report, File? ctScanFile);
}
