import 'package:freezed_annotation/freezed_annotation.dart';

part 'gemini_response_model.freezed.dart';
part 'gemini_response_model.g.dart';

@freezed
abstract class GeminiResponse with _$GeminiResponse {
  const factory GeminiResponse({String? message, Response? response}) =
      _GeminiResponse;

  factory GeminiResponse.fromJson(Map<String, dynamic> json) =>
      _$GeminiResponseFromJson(json);
}

@freezed
abstract class Response with _$Response {
  const factory Response({
    String? findings,
    String? impression,
    String? title,
    String? description,
  }) = _Response;

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}
