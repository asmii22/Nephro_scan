part of 'reports_cubit.dart';

@freezed
class ReportsState with _$ReportsState {
  const factory ReportsState.initial() = _Initial;
  const factory ReportsState.loading() = _Loading;
  const factory ReportsState.success(List<ReportEntity>? reports) = _Success;
  const factory ReportsState.error(String message) = _Error;
}
