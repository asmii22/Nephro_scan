import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nephroscan/features/dashboard_screen/domain/repositories/dashboard_repository.dart';

part 'get_all_reports_cubit.freezed.dart';
part 'get_all_reports_state.dart';

@injectable
class GetAllReportsCubit extends Cubit<GetAllReportsState> {
  GetAllReportsCubit({required DashboardRepository dashboardRepository})
    : _dashboardRepository = dashboardRepository,
      super(const GetAllReportsState.initial());
  final DashboardRepository _dashboardRepository;

  Future<void> getAllReports() async {
    emit(const GetAllReportsState.loading());
    try {
      final reportDocIds = await _dashboardRepository.getReportDocIds();
      emit(GetAllReportsState.allReports(reportDocIds));
    } catch (e) {
      emit(GetAllReportsState.error(e.toString()));
    }
  }
}
