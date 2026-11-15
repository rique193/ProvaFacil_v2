// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questao_com_alternativas.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuestaoComAlternativas {

 QuestaoEntity get questao; List<AlternativaEntity> get alternativas;
/// Create a copy of QuestaoComAlternativas
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestaoComAlternativasCopyWith<QuestaoComAlternativas> get copyWith => _$QuestaoComAlternativasCopyWithImpl<QuestaoComAlternativas>(this as QuestaoComAlternativas, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as QuestaoComAlternativas;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestaoComAlternativas&&(identical(other.questao, _this.questao) || other.questao == _this.questao)&&const DeepCollectionEquality().equals(other.alternativas, _this.alternativas));
}


@override
int get hashCode {
  final _this = this as QuestaoComAlternativas;
  return Object.hash(runtimeType,_this.questao,const DeepCollectionEquality().hash(_this.alternativas));
}

@override
String toString() {
  final _this = this as QuestaoComAlternativas;
  return 'QuestaoComAlternativas(questao: ${_this.questao}, alternativas: ${_this.alternativas})';
}


}

/// @nodoc
abstract mixin class $QuestaoComAlternativasCopyWith<$Res>  {
  factory $QuestaoComAlternativasCopyWith(QuestaoComAlternativas value, $Res Function(QuestaoComAlternativas) _then) = _$QuestaoComAlternativasCopyWithImpl;
@useResult
$Res call({
 QuestaoEntity questao, List<AlternativaEntity> alternativas
});




}
/// @nodoc
class _$QuestaoComAlternativasCopyWithImpl<$Res>
    implements $QuestaoComAlternativasCopyWith<$Res> {
  _$QuestaoComAlternativasCopyWithImpl(this._self, this._then);

  final QuestaoComAlternativas _self;
  final $Res Function(QuestaoComAlternativas) _then;

/// Create a copy of QuestaoComAlternativas
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questao = null,Object? alternativas = null,}) {
  return _then(QuestaoComAlternativas(
questao: null == questao ? _self.questao : questao // ignore: cast_nullable_to_non_nullable
as QuestaoEntity,alternativas: null == alternativas ? _self.alternativas : alternativas // ignore: cast_nullable_to_non_nullable
as List<AlternativaEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestaoComAlternativas].
extension QuestaoComAlternativasPatterns on QuestaoComAlternativas {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestaoComAlternativas value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestaoComAlternativas() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestaoComAlternativas value)  $default,){
final _that = this;
switch (_that) {
case _QuestaoComAlternativas():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestaoComAlternativas value)?  $default,){
final _that = this;
switch (_that) {
case _QuestaoComAlternativas() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( QuestaoEntity questao,  List<AlternativaEntity> alternativas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestaoComAlternativas() when $default != null:
return $default(_that.questao,_that.alternativas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( QuestaoEntity questao,  List<AlternativaEntity> alternativas)  $default,) {final _that = this;
switch (_that) {
case _QuestaoComAlternativas():
return $default(_that.questao,_that.alternativas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( QuestaoEntity questao,  List<AlternativaEntity> alternativas)?  $default,) {final _that = this;
switch (_that) {
case _QuestaoComAlternativas() when $default != null:
return $default(_that.questao,_that.alternativas);case _:
  return null;

}
}

}

/// @nodoc


class _QuestaoComAlternativas implements QuestaoComAlternativas {
  const _QuestaoComAlternativas({required this.questao, required  List<AlternativaEntity> alternativas}): _alternativas = alternativas;
  

@override final  QuestaoEntity questao;
 final  List<AlternativaEntity> _alternativas;
@override List<AlternativaEntity> get alternativas {
  if (_alternativas is EqualUnmodifiableListView) return _alternativas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alternativas);
}


/// Create a copy of QuestaoComAlternativas
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestaoComAlternativasCopyWith<_QuestaoComAlternativas> get copyWith => __$QuestaoComAlternativasCopyWithImpl<_QuestaoComAlternativas>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestaoComAlternativas&&(identical(other.questao, questao) || other.questao == questao)&&const DeepCollectionEquality().equals(other.alternativas, _alternativas));
}


@override
int get hashCode {
    return Object.hash(runtimeType,questao,const DeepCollectionEquality().hash(_alternativas));
}

@override
String toString() {
    return 'QuestaoComAlternativas(questao: $questao, alternativas: $alternativas)';
}


}

/// @nodoc
abstract mixin class _$QuestaoComAlternativasCopyWith<$Res> implements $QuestaoComAlternativasCopyWith<$Res> {
  factory _$QuestaoComAlternativasCopyWith(_QuestaoComAlternativas value, $Res Function(_QuestaoComAlternativas) _then) = __$QuestaoComAlternativasCopyWithImpl;
@override @useResult
$Res call({
 QuestaoEntity questao, List<AlternativaEntity> alternativas
});




}
/// @nodoc
class __$QuestaoComAlternativasCopyWithImpl<$Res>
    implements _$QuestaoComAlternativasCopyWith<$Res> {
  __$QuestaoComAlternativasCopyWithImpl(this._self, this._then);

  final _QuestaoComAlternativas _self;
  final $Res Function(_QuestaoComAlternativas) _then;

/// Create a copy of QuestaoComAlternativas
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questao = null,Object? alternativas = null,}) {
  return _then(_QuestaoComAlternativas(
questao: null == questao ? _self.questao : questao // ignore: cast_nullable_to_non_nullable
as QuestaoEntity,alternativas: null == alternativas ? _self._alternativas : alternativas // ignore: cast_nullable_to_non_nullable
as List<AlternativaEntity>,
  ));
}


}

// dart format on
