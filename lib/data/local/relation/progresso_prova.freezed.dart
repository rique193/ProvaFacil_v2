// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progresso_prova.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgressoProva {

 int get provaId;/// Alunos cadastrados na `provas.turma` (0 se a prova não tem turma).
 int get totalAlunosTurma;/// Resultados salvos da prova.
 int get totalCorrigidos;
/// Create a copy of ProgressoProva
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressoProvaCopyWith<ProgressoProva> get copyWith => _$ProgressoProvaCopyWithImpl<ProgressoProva>(this as ProgressoProva, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProgressoProva;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressoProva&&(identical(other.provaId, _this.provaId) || other.provaId == _this.provaId)&&(identical(other.totalAlunosTurma, _this.totalAlunosTurma) || other.totalAlunosTurma == _this.totalAlunosTurma)&&(identical(other.totalCorrigidos, _this.totalCorrigidos) || other.totalCorrigidos == _this.totalCorrigidos));
}


@override
int get hashCode {
  final _this = this as ProgressoProva;
  return Object.hash(runtimeType,_this.provaId,_this.totalAlunosTurma,_this.totalCorrigidos);
}

@override
String toString() {
  final _this = this as ProgressoProva;
  return 'ProgressoProva(provaId: ${_this.provaId}, totalAlunosTurma: ${_this.totalAlunosTurma}, totalCorrigidos: ${_this.totalCorrigidos})';
}


}

/// @nodoc
abstract mixin class $ProgressoProvaCopyWith<$Res>  {
  factory $ProgressoProvaCopyWith(ProgressoProva value, $Res Function(ProgressoProva) _then) = _$ProgressoProvaCopyWithImpl;
@useResult
$Res call({
 int provaId, int totalAlunosTurma, int totalCorrigidos
});




}
/// @nodoc
class _$ProgressoProvaCopyWithImpl<$Res>
    implements $ProgressoProvaCopyWith<$Res> {
  _$ProgressoProvaCopyWithImpl(this._self, this._then);

  final ProgressoProva _self;
  final $Res Function(ProgressoProva) _then;

/// Create a copy of ProgressoProva
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provaId = null,Object? totalAlunosTurma = null,Object? totalCorrigidos = null,}) {
  return _then(ProgressoProva(
provaId: null == provaId ? _self.provaId : provaId // ignore: cast_nullable_to_non_nullable
as int,totalAlunosTurma: null == totalAlunosTurma ? _self.totalAlunosTurma : totalAlunosTurma // ignore: cast_nullable_to_non_nullable
as int,totalCorrigidos: null == totalCorrigidos ? _self.totalCorrigidos : totalCorrigidos // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgressoProva].
extension ProgressoProvaPatterns on ProgressoProva {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgressoProva value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressoProva() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgressoProva value)  $default,){
final _that = this;
switch (_that) {
case _ProgressoProva():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgressoProva value)?  $default,){
final _that = this;
switch (_that) {
case _ProgressoProva() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int provaId,  int totalAlunosTurma,  int totalCorrigidos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressoProva() when $default != null:
return $default(_that.provaId,_that.totalAlunosTurma,_that.totalCorrigidos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int provaId,  int totalAlunosTurma,  int totalCorrigidos)  $default,) {final _that = this;
switch (_that) {
case _ProgressoProva():
return $default(_that.provaId,_that.totalAlunosTurma,_that.totalCorrigidos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int provaId,  int totalAlunosTurma,  int totalCorrigidos)?  $default,) {final _that = this;
switch (_that) {
case _ProgressoProva() when $default != null:
return $default(_that.provaId,_that.totalAlunosTurma,_that.totalCorrigidos);case _:
  return null;

}
}

}

/// @nodoc


class _ProgressoProva extends ProgressoProva {
  const _ProgressoProva({required this.provaId, required this.totalAlunosTurma, required this.totalCorrigidos}): super._();
  

@override final  int provaId;
/// Alunos cadastrados na `provas.turma` (0 se a prova não tem turma).
@override final  int totalAlunosTurma;
/// Resultados salvos da prova.
@override final  int totalCorrigidos;

/// Create a copy of ProgressoProva
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressoProvaCopyWith<_ProgressoProva> get copyWith => __$ProgressoProvaCopyWithImpl<_ProgressoProva>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressoProva&&(identical(other.provaId, provaId) || other.provaId == provaId)&&(identical(other.totalAlunosTurma, totalAlunosTurma) || other.totalAlunosTurma == totalAlunosTurma)&&(identical(other.totalCorrigidos, totalCorrigidos) || other.totalCorrigidos == totalCorrigidos));
}


@override
int get hashCode {
    return Object.hash(runtimeType,provaId,totalAlunosTurma,totalCorrigidos);
}

@override
String toString() {
    return 'ProgressoProva(provaId: $provaId, totalAlunosTurma: $totalAlunosTurma, totalCorrigidos: $totalCorrigidos)';
}


}

/// @nodoc
abstract mixin class _$ProgressoProvaCopyWith<$Res> implements $ProgressoProvaCopyWith<$Res> {
  factory _$ProgressoProvaCopyWith(_ProgressoProva value, $Res Function(_ProgressoProva) _then) = __$ProgressoProvaCopyWithImpl;
@override @useResult
$Res call({
 int provaId, int totalAlunosTurma, int totalCorrigidos
});




}
/// @nodoc
class __$ProgressoProvaCopyWithImpl<$Res>
    implements _$ProgressoProvaCopyWith<$Res> {
  __$ProgressoProvaCopyWithImpl(this._self, this._then);

  final _ProgressoProva _self;
  final $Res Function(_ProgressoProva) _then;

/// Create a copy of ProgressoProva
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provaId = null,Object? totalAlunosTurma = null,Object? totalCorrigidos = null,}) {
  return _then(_ProgressoProva(
provaId: null == provaId ? _self.provaId : provaId // ignore: cast_nullable_to_non_nullable
as int,totalAlunosTurma: null == totalAlunosTurma ? _self.totalAlunosTurma : totalAlunosTurma // ignore: cast_nullable_to_non_nullable
as int,totalCorrigidos: null == totalCorrigidos ? _self.totalCorrigidos : totalCorrigidos // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
