// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gemini_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeminiResponse _$GeminiResponseFromJson(Map<String, dynamic> json) =>
    _GeminiResponse(
      message: json['message'] as String?,
      response: json['response'] == null
          ? null
          : Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeminiResponseToJson(_GeminiResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'response': instance.response,
    };

_Response _$ResponseFromJson(Map<String, dynamic> json) => _Response(
  findings: json['findings'] as String?,
  impression: json['impression'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$ResponseToJson(_Response instance) => <String, dynamic>{
  'findings': instance.findings,
  'impression': instance.impression,
  'title': instance.title,
  'description': instance.description,
};
