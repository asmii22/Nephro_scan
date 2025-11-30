part of 'ct_scan_upload_cubit.dart';

@freezed
class CtScanUploadState with _$CtScanUploadState {
  const factory CtScanUploadState.initial() = _Initial;
  const factory CtScanUploadState.loading() = _Loading;
  const factory CtScanUploadState.success() = _Success;
  const factory CtScanUploadState.error(String? message) = _Error;
}
