// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportModel {

 String? get id; String? get patientId; String? get doctorId; String? get findings; String? get impression; DateTime? get date; String? get title; String? get description; String? get ctScanImageUrl;
/// Create a copy of ReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportModelCopyWith<ReportModel> get copyWith => _$ReportModelCopyWithImpl<ReportModel>(this as ReportModel, _$identity);

  /// Serializes this ReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.findings, findings) || other.findings == findings)&&(identical(other.impression, impression) || other.impression == impression)&&(identical(other.date, date) || other.date == date)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.ctScanImageUrl, ctScanImageUrl) || other.ctScanImageUrl == ctScanImageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,doctorId,findings,impression,date,title,description,ctScanImageUrl);

@override
String toString() {
  return 'ReportModel(id: $id, patientId: $patientId, doctorId: $doctorId, findings: $findings, impression: $impression, date: $date, title: $title, description: $description, ctScanImageUrl: $ctScanImageUrl)';
}


}

/// @nodoc
abstract mixin class $ReportModelCopyWith<$Res>  {
  factory $ReportModelCopyWith(ReportModel value, $Res Function(ReportModel) _then) = _$ReportModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? patientId, String? doctorId, String? findings, String? impression, DateTime? date, String? title, String? description, String? ctScanImageUrl
});




}
/// @nodoc
class _$ReportModelCopyWithImpl<$Res>
    implements $ReportModelCopyWith<$Res> {
  _$ReportModelCopyWithImpl(this._self, this._then);

  final ReportModel _self;
  final $Res Function(ReportModel) _then;

/// Create a copy of ReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? patientId = freezed,Object? doctorId = freezed,Object? findings = freezed,Object? impression = freezed,Object? date = freezed,Object? title = freezed,Object? description = freezed,Object? ctScanImageUrl = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,patientId: freezed == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String?,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,findings: freezed == findings ? _self.findings : findings // ignore: cast_nullable_to_non_nullable
as String?,impression: freezed == impression ? _self.impression : impression // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,ctScanImageUrl: freezed == ctScanImageUrl ? _self.ctScanImageUrl : ctScanImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportModel].
extension ReportModelPatterns on ReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportModel value)  $default,){
final _that = this;
switch (_that) {
case _ReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? patientId,  String? doctorId,  String? findings,  String? impression,  DateTime? date,  String? title,  String? description,  String? ctScanImageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportModel() when $default != null:
return $default(_that.id,_that.patientId,_that.doctorId,_that.findings,_that.impression,_that.date,_that.title,_that.description,_that.ctScanImageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? patientId,  String? doctorId,  String? findings,  String? impression,  DateTime? date,  String? title,  String? description,  String? ctScanImageUrl)  $default,) {final _that = this;
switch (_that) {
case _ReportModel():
return $default(_that.id,_that.patientId,_that.doctorId,_that.findings,_that.impression,_that.date,_that.title,_that.description,_that.ctScanImageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? patientId,  String? doctorId,  String? findings,  String? impression,  DateTime? date,  String? title,  String? description,  String? ctScanImageUrl)?  $default,) {final _that = this;
switch (_that) {
case _ReportModel() when $default != null:
return $default(_that.id,_that.patientId,_that.doctorId,_that.findings,_that.impression,_that.date,_that.title,_that.description,_that.ctScanImageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportModel extends ReportModel {
  const _ReportModel({this.id, this.patientId, this.doctorId, this.findings, this.impression, this.date, this.title, this.description, this.ctScanImageUrl}): super._();
  factory _ReportModel.fromJson(Map<String, dynamic> json) => _$ReportModelFromJson(json);

@override final  String? id;
@override final  String? patientId;
@override final  String? doctorId;
@override final  String? findings;
@override final  String? impression;
@override final  DateTime? date;
@override final  String? title;
@override final  String? description;
@override final  String? ctScanImageUrl;

/// Create a copy of ReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportModelCopyWith<_ReportModel> get copyWith => __$ReportModelCopyWithImpl<_ReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.findings, findings) || other.findings == findings)&&(identical(other.impression, impression) || other.impression == impression)&&(identical(other.date, date) || other.date == date)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.ctScanImageUrl, ctScanImageUrl) || other.ctScanImageUrl == ctScanImageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,doctorId,findings,impression,date,title,description,ctScanImageUrl);

@override
String toString() {
  return 'ReportModel(id: $id, patientId: $patientId, doctorId: $doctorId, findings: $findings, impression: $impression, date: $date, title: $title, description: $description, ctScanImageUrl: $ctScanImageUrl)';
}


}

/// @nodoc
abstract mixin class _$ReportModelCopyWith<$Res> implements $ReportModelCopyWith<$Res> {
  factory _$ReportModelCopyWith(_ReportModel value, $Res Function(_ReportModel) _then) = __$ReportModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? patientId, String? doctorId, String? findings, String? impression, DateTime? date, String? title, String? description, String? ctScanImageUrl
});




}
/// @nodoc
class __$ReportModelCopyWithImpl<$Res>
    implements _$ReportModelCopyWith<$Res> {
  __$ReportModelCopyWithImpl(this._self, this._then);

  final _ReportModel _self;
  final $Res Function(_ReportModel) _then;

/// Create a copy of ReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? patientId = freezed,Object? doctorId = freezed,Object? findings = freezed,Object? impression = freezed,Object? date = freezed,Object? title = freezed,Object? description = freezed,Object? ctScanImageUrl = freezed,}) {
  return _then(_ReportModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,patientId: freezed == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String?,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,findings: freezed == findings ? _self.findings : findings // ignore: cast_nullable_to_non_nullable
as String?,impression: freezed == impression ? _self.impression : impression // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,ctScanImageUrl: freezed == ctScanImageUrl ? _self.ctScanImageUrl : ctScanImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
