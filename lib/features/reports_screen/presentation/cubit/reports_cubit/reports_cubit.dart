import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nephroscan/features/reports_screen/domain/repositories/report_repository.dart';

import '../../../../ct_scan_screen/domain/entities/report_entity.dart';

part 'reports_cubit.freezed.dart';
part 'reports_state.dart';

@injectable
class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit({required ReportRepository reportRepository})
    : _reportRepository = reportRepository,
      super(const ReportsState.initial());

  final ReportRepository _reportRepository;

  Future<void> getReportsByIds(List<String>? reportIds) async {
    emit(const ReportsState.loading());
    try {
      final reports = await _reportRepository.getReportsByIds(reportIds);
      emit(ReportsState.success(reports));
    } catch (e) {
      emit(ReportsState.error(e.toString()));
    }
  }
}
