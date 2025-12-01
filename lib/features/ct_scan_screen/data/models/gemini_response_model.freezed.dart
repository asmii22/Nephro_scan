// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gemini_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeminiResponse {

 String? get message; Response? get response;
/// Create a copy of GeminiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeminiResponseCopyWith<GeminiResponse> get copyWith => _$GeminiResponseCopyWithImpl<GeminiResponse>(this as GeminiResponse, _$identity);

  /// Serializes this GeminiResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeminiResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.response, response) || other.response == response));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,response);

@override
String toString() {
  return 'GeminiResponse(message: $message, response: $response)';
}


}

/// @nodoc
abstract mixin class $GeminiResponseCopyWith<$Res>  {
  factory $GeminiResponseCopyWith(GeminiResponse value, $Res Function(GeminiResponse) _then) = _$GeminiResponseCopyWithImpl;
@useResult
$Res call({
 String? message, Response? response
});


$ResponseCopyWith<$Res>? get response;

}
/// @nodoc
class _$GeminiResponseCopyWithImpl<$Res>
    implements $GeminiResponseCopyWith<$Res> {
  _$GeminiResponseCopyWithImpl(this._self, this._then);

  final GeminiResponse _self;
  final $Res Function(GeminiResponse) _then;

/// Create a copy of GeminiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? response = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response?,
  ));
}
/// Create a copy of GeminiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponseCopyWith<$Res>? get response {
    if (_self.response == null) {
    return null;
  }

  return $ResponseCopyWith<$Res>(_self.response!, (value) {
    return _then(_self.copyWith(response: value));
  });
}
}


/// Adds pattern-matching-related methods to [GeminiResponse].
extension GeminiResponsePatterns on GeminiResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeminiResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeminiResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeminiResponse value)  $default,){
final _that = this;
switch (_that) {
case _GeminiResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeminiResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GeminiResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? message,  Response? response)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeminiResponse() when $default != null:
return $default(_that.message,_that.response);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? message,  Response? response)  $default,) {final _that = this;
switch (_that) {
case _GeminiResponse():
return $default(_that.message,_that.response);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? message,  Response? response)?  $default,) {final _that = this;
switch (_that) {
case _GeminiResponse() when $default != null:
return $default(_that.message,_that.response);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeminiResponse implements GeminiResponse {
  const _GeminiResponse({this.message, this.response});
  factory _GeminiResponse.fromJson(Map<String, dynamic> json) => _$GeminiResponseFromJson(json);

@override final  String? message;
@override final  Response? response;

/// Create a copy of GeminiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeminiResponseCopyWith<_GeminiResponse> get copyWith => __$GeminiResponseCopyWithImpl<_GeminiResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeminiResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeminiResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.response, response) || other.response == response));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,response);

@override
String toString() {
  return 'GeminiResponse(message: $message, response: $response)';
}


}

/// @nodoc
abstract mixin class _$GeminiResponseCopyWith<$Res> implements $GeminiResponseCopyWith<$Res> {
  factory _$GeminiResponseCopyWith(_GeminiResponse value, $Res Function(_GeminiResponse) _then) = __$GeminiResponseCopyWithImpl;
@override @useResult
$Res call({
 String? message, Response? response
});


@override $ResponseCopyWith<$Res>? get response;

}
/// @nodoc
class __$GeminiResponseCopyWithImpl<$Res>
    implements _$GeminiResponseCopyWith<$Res> {
  __$GeminiResponseCopyWithImpl(this._self, this._then);

  final _GeminiResponse _self;
  final $Res Function(_GeminiResponse) _then;

/// Create a copy of GeminiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? response = freezed,}) {
  return _then(_GeminiResponse(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response?,
  ));
}

/// Create a copy of GeminiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponseCopyWith<$Res>? get response {
    if (_self.response == null) {
    return null;
  }

  return $ResponseCopyWith<$Res>(_self.response!, (value) {
    return _then(_self.copyWith(response: value));
  });
}
}


/// @nodoc
mixin _$Response {

 String? get findings; String? get impression; String? get title; String? get description;
/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseCopyWith<Response> get copyWith => _$ResponseCopyWithImpl<Response>(this as Response, _$identity);

  /// Serializes this Response to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Response&&(identical(other.findings, findings) || other.findings == findings)&&(identical(other.impression, impression) || other.impression == impression)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,findings,impression,title,description);

@override
String toString() {
  return 'Response(findings: $findings, impression: $impression, title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class $ResponseCopyWith<$Res>  {
  factory $ResponseCopyWith(Response value, $Res Function(Response) _then) = _$ResponseCopyWithImpl;
@useResult
$Res call({
 String? findings, String? impression, String? title, String? description
});




}
/// @nodoc
class _$ResponseCopyWithImpl<$Res>
    implements $ResponseCopyWith<$Res> {
  _$ResponseCopyWithImpl(this._self, this._then);

  final Response _self;
  final $Res Function(Response) _then;

/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? findings = freezed,Object? impression = freezed,Object? title = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
findings: freezed == findings ? _self.findings : findings // ignore: cast_nullable_to_non_nullable
as String?,impression: freezed == impression ? _self.impression : impression // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Response].
extension ResponsePatterns on Response {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Response value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Response() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Response value)  $default,){
final _that = this;
switch (_that) {
case _Response():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Response value)?  $default,){
final _that = this;
switch (_that) {
case _Response() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? findings,  String? impression,  String? title,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Response() when $default != null:
return $default(_that.findings,_that.impression,_that.title,_that.description);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? findings,  String? impression,  String? title,  String? description)  $default,) {final _that = this;
switch (_that) {
case _Response():
return $default(_that.findings,_that.impression,_that.title,_that.description);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? findings,  String? impression,  String? title,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _Response() when $default != null:
return $default(_that.findings,_that.impression,_that.title,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Response implements Response {
  const _Response({this.findings, this.impression, this.title, this.description});
  factory _Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);

@override final  String? findings;
@override final  String? impression;
@override final  String? title;
@override final  String? description;

/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResponseCopyWith<_Response> get copyWith => __$ResponseCopyWithImpl<_Response>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Response&&(identical(other.findings, findings) || other.findings == findings)&&(identical(other.impression, impression) || other.impression == impression)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,findings,impression,title,description);

@override
String toString() {
  return 'Response(findings: $findings, impression: $impression, title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ResponseCopyWith<$Res> implements $ResponseCopyWith<$Res> {
  factory _$ResponseCopyWith(_Response value, $Res Function(_Response) _then) = __$ResponseCopyWithImpl;
@override @useResult
$Res call({
 String? findings, String? impression, String? title, String? description
});




}
/// @nodoc
class __$ResponseCopyWithImpl<$Res>
    implements _$ResponseCopyWith<$Res> {
  __$ResponseCopyWithImpl(this._self, this._then);

  final _Response _self;
  final $Res Function(_Response) _then;

/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? findings = freezed,Object? impression = freezed,Object? title = freezed,Object? description = freezed,}) {
  return _then(_Response(
findings: freezed == findings ? _self.findings : findings // ignore: cast_nullable_to_non_nullable
as String?,impression: freezed == impression ? _self.impression : impression // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
