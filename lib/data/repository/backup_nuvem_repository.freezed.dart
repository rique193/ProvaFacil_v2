// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_nuvem_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResumoEnvioNuvem {

 int get resultados; int get alunos;
/// Create a copy of ResumoEnvioNuvem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResumoEnvioNuvemCopyWith<ResumoEnvioNuvem> get copyWith => _$ResumoEnvioNuvemCopyWithImpl<ResumoEnvioNuvem>(this as ResumoEnvioNuvem, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ResumoEnvioNuvem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResumoEnvioNuvem&&(identical(other.resultados, _this.resultados) || other.resultados == _this.resultados)&&(identical(other.alunos, _this.alunos) || other.alunos == _this.alunos));
}


@override
int get hashCode {
  final _this = this as ResumoEnvioNuvem;
  return Object.hash(runtimeType,_this.resultados,_this.alunos);
}

@override
String toString() {
  final _this = this as ResumoEnvioNuvem;
  return 'ResumoEnvioNuvem(resultados: ${_this.resultados}, alunos: ${_this.alunos})';
}


}

/// @nodoc
abstract mixin class $ResumoEnvioNuvemCopyWith<$Res>  {
  factory $ResumoEnvioNuvemCopyWith(ResumoEnvioNuvem value, $Res Function(ResumoEnvioNuvem) _then) = _$ResumoEnvioNuvemCopyWithImpl;
@useResult
$Res call({
 int resultados, int alunos
});




}
/// @nodoc
class _$ResumoEnvioNuvemCopyWithImpl<$Res>
    implements $ResumoEnvioNuvemCopyWith<$Res> {
  _$ResumoEnvioNuvemCopyWithImpl(this._self, this._then);

  final ResumoEnvioNuvem _self;
  final $Res Function(ResumoEnvioNuvem) _then;

/// Create a copy of ResumoEnvioNuvem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resultados = null,Object? alunos = null,}) {
  return _then(ResumoEnvioNuvem(
resultados: null == resultados ? _self.resultados : resultados // ignore: cast_nullable_to_non_nullable
as int,alunos: null == alunos ? _self.alunos : alunos // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ResumoEnvioNuvem].
extension ResumoEnvioNuvemPatterns on ResumoEnvioNuvem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResumoEnvioNuvem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResumoEnvioNuvem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResumoEnvioNuvem value)  $default,){
final _that = this;
switch (_that) {
case _ResumoEnvioNuvem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResumoEnvioNuvem value)?  $default,){
final _that = this;
switch (_that) {
case _ResumoEnvioNuvem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int resultados,  int alunos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResumoEnvioNuvem() when $default != null:
return $default(_that.resultados,_that.alunos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int resultados,  int alunos)  $default,) {final _that = this;
switch (_that) {
case _ResumoEnvioNuvem():
return $default(_that.resultados,_that.alunos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int resultados,  int alunos)?  $default,) {final _that = this;
switch (_that) {
case _ResumoEnvioNuvem() when $default != null:
return $default(_that.resultados,_that.alunos);case _:
  return null;

}
}

}

/// @nodoc


class _ResumoEnvioNuvem implements ResumoEnvioNuvem {
  const _ResumoEnvioNuvem({required this.resultados, required this.alunos});
  

@override final  int resultados;
@override final  int alunos;

/// Create a copy of ResumoEnvioNuvem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResumoEnvioNuvemCopyWith<_ResumoEnvioNuvem> get copyWith => __$ResumoEnvioNuvemCopyWithImpl<_ResumoEnvioNuvem>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResumoEnvioNuvem&&(identical(other.resultados, resultados) || other.resultados == resultados)&&(identical(other.alunos, alunos) || other.alunos == alunos));
}


@override
int get hashCode {
    return Object.hash(runtimeType,resultados,alunos);
}

@override
String toString() {
    return 'ResumoEnvioNuvem(resultados: $resultados, alunos: $alunos)';
}


}

/// @nodoc
abstract mixin class _$ResumoEnvioNuvemCopyWith<$Res> implements $ResumoEnvioNuvemCopyWith<$Res> {
  factory _$ResumoEnvioNuvemCopyWith(_ResumoEnvioNuvem value, $Res Function(_ResumoEnvioNuvem) _then) = __$ResumoEnvioNuvemCopyWithImpl;
@override @useResult
$Res call({
 int resultados, int alunos
});




}
/// @nodoc
class __$ResumoEnvioNuvemCopyWithImpl<$Res>
    implements _$ResumoEnvioNuvemCopyWith<$Res> {
  __$ResumoEnvioNuvemCopyWithImpl(this._self, this._then);

  final _ResumoEnvioNuvem _self;
  final $Res Function(_ResumoEnvioNuvem) _then;

/// Create a copy of ResumoEnvioNuvem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resultados = null,Object? alunos = null,}) {
  return _then(_ResumoEnvioNuvem(
resultados: null == resultados ? _self.resultados : resultados // ignore: cast_nullable_to_non_nullable
as int,alunos: null == alunos ? _self.alunos : alunos // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
