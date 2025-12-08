import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nephroscan/features/ct_scan_screen/presentation/cubit/ct_scan_upload_cubit/ct_scan_upload_cubit.dart';
import 'package:nephroscan/features/ct_scan_screen/data/models/report_model.dart';

import 'mocks.dart';

void main() {
  late MockCtScanRepository mockCtScanRepository;
  late CtScanUploadCubit cubit;

  setUp(() {
    mockCtScanRepository = MockCtScanRepository();
    cubit = CtScanUploadCubit(ctScanRepository: mockCtScanRepository);
  });

  tearDown(() {
    cubit.close();
  });

  group('CtScanUploadCubit', () {
    final report = ReportModel(id: 'r', title: 't', description: 'd');
    final file = File('test_resources/dummy');

    blocTest<CtScanUploadCubit, CtScanUploadState>(
      'emits [loading, success] when upload succeeds',
      build: () {
        when(() => mockCtScanRepository.uploadCtScanData(report, file))
            .thenAnswer((_) async {});
        return cubit;
      },
      act: (c) => c.uploadCtScanData(report: report, ctScanFile: file),
      expect: () => [
        const CtScanUploadState.loading(),
        const CtScanUploadState.success(),
      ],
    );

    blocTest<CtScanUploadCubit, CtScanUploadState>(
      'emits [loading, error] when repository throws',
      build: () {
        when(() => mockCtScanRepository.uploadCtScanData(report, file))
            .thenThrow(Exception('bad'));
        return cubit;
      },
      act: (c) => c.uploadCtScanData(report: report, ctScanFile: file),
      expect: () => [
        const CtScanUploadState.loading(),
        CtScanUploadState.error('Exception: bad'),
      ],
    );
  });
}

