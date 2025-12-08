part of 'get_all_reports_cubit.dart';

@freezed
class GetAllReportsState with _$GetAllReportsState {
  const factory GetAllReportsState.initial() = _Initial;
  const factory GetAllReportsState.loading() = _Loading;
  const factory GetAllReportsState.allReports(List<String>? allReports) =
      _AllReports;
  const factory GetAllReportsState.error(String? message) = _Error;
}
