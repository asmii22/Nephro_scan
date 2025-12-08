import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nephroscan/features/reports_screen/presentation/cubit/reports_cubit/reports_cubit.dart';
import 'package:nephroscan/features/ct_scan_screen/domain/entities/report_entity.dart';

import 'mocks.dart';

void main() {
  late MockReportRepository mockReportRepository;
  late ReportsCubit reportsCubit;

  setUp(() {
    mockReportRepository = MockReportRepository();
    reportsCubit = ReportsCubit(reportRepository: mockReportRepository);
  });

  tearDown(() {
    reportsCubit.close();
  });

  group('ReportsCubit', () {
    final List<ReportEntity> reports = [
      ReportEntity(id: '1', title: 'r1', description: 'd1', ctScanImageUrl: null),
    ];

    blocTest<ReportsCubit, ReportsState>(
      'emits [loading, success] when getReportsByIds succeeds',
      build: () {
        when(() => mockReportRepository.getReportsByIds(any()))
            .thenAnswer((_) async => reports);
        return reportsCubit;
      },
      act: (cubit) => cubit.getReportsByIds(['1']),
      expect: () => [
        const ReportsState.loading(),
        ReportsState.success(reports),
      ],
    );

    blocTest<ReportsCubit, ReportsState>(
      'emits [loading, error] when repository throws',
      build: () {
        when(() => mockReportRepository.getReportsByIds(any()))
            .thenThrow(Exception('oops'));
        return reportsCubit;
      },
      act: (cubit) => cubit.getReportsByIds(['1']),
      expect: () => [
        const ReportsState.loading(),
        ReportsState.error('Exception: oops'),
      ],
    );
  });
}
