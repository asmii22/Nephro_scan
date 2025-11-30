import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nephroscan/features/ct_scan_screen/domain/repositories/ct_scan_repository.dart';

import '../../../data/models/report_model.dart';

part 'ct_scan_upload_cubit.freezed.dart';
part 'ct_scan_upload_state.dart';

@injectable
class CtScanUploadCubit extends Cubit<CtScanUploadState> {
  CtScanUploadCubit({required CtScanRepository ctScanRepository})
    : _ctScanRepository = ctScanRepository,
      super(const CtScanUploadState.initial());

  final CtScanRepository _ctScanRepository;

  Future<void> uploadCtScanData({
    required ReportModel? report,
    required File? ctScanFile,
  }) async {
    emit(const CtScanUploadState.loading());
    try {
      await _ctScanRepository.uploadCtScanData(report, ctScanFile);
      emit(const CtScanUploadState.success());
    } catch (e) {
      emit(CtScanUploadState.error(e.toString()));
    }
  }
}
