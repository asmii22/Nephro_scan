import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nephroscan/features/profile_screen/presentation/cubits/get_all_reports_cubit/get_all_reports_cubit.dart';

import 'mocks.dart';

void main() {
  late MockDashboardRepository mockDashboardRepository;
  late GetAllReportsCubit cubit;

  setUp(() {
    mockDashboardRepository = MockDashboardRepository();
    cubit = GetAllReportsCubit(dashboardRepository: mockDashboardRepository);
  });

  tearDown(() {
    cubit.close();
  });

  group('GetAllReportsCubit', () {
    final ids = ['a', 'b'];

    blocTest<GetAllReportsCubit, GetAllReportsState>(
      'emits [loading, allReports] when getAllReports succeeds',
      build: () {
        when(() => mockDashboardRepository.getReportDocIds())
            .thenAnswer((_) async => ids);
        return cubit;
      },
      act: (c) => c.getAllReports(),
      expect: () => [
        const GetAllReportsState.loading(),
        GetAllReportsState.allReports(ids),
      ],
    );

    blocTest<GetAllReportsCubit, GetAllReportsState>(
      'emits [loading, error] when repository throws',
      build: () {
        when(() => mockDashboardRepository.getReportDocIds())
            .thenThrow(Exception('nope'));
        return cubit;
      },
      act: (c) => c.getAllReports(),
      expect: () => [
        const GetAllReportsState.loading(),
        GetAllReportsState.error('Exception: nope'),
      ],
    );
  });
}

