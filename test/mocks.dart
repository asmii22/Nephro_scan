// ...existing code...
import 'package:mocktail/mocktail.dart';
import 'package:nephroscan/features/reports_screen/domain/repositories/report_repository.dart';
import 'package:nephroscan/features/sign_in_sign_up_screen/domain/repositories/sign_up_repository.dart';
import 'package:nephroscan/features/dashboard_screen/domain/repositories/dashboard_repository.dart';
import 'package:nephroscan/features/ct_scan_screen/domain/repositories/ct_scan_repository.dart';

class MockReportRepository extends Mock implements ReportRepository {}
class MockSignUpRepository extends Mock implements SignUpRepository {}
class MockDashboardRepository extends Mock implements DashboardRepository {}
class MockCtScanRepository extends Mock implements CtScanRepository {}

