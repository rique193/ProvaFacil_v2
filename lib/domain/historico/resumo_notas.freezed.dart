// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resumo_notas.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResumoNotas {

 double get media; double get maiorNota; double get menorNota;
/// Create a copy of ResumoNotas
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResumoNotasCopyWith<ResumoNotas> get copyWith => _$ResumoNotasCopyWithImpl<ResumoNotas>(this as ResumoNotas, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ResumoNotas;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResumoNotas&&(identical(other.media, _this.media) || other.media == _this.media)&&(identical(other.maiorNota, _this.maiorNota) || other.maiorNota == _this.maiorNota)&&(identical(other.menorNota, _this.menorNota) || other.menorNota == _this.menorNota));
}


@override
int get hashCode {
  final _this = this as ResumoNotas;
  return Object.hash(runtimeType,_this.media,_this.maiorNota,_this.menorNota);
}

@override
String toString() {
  final _this = this as ResumoNotas;
  return 'ResumoNotas(media: ${_this.media}, maiorNota: ${_this.maiorNota}, menorNota: ${_this.menorNota})';
}


}

/// @nodoc
abstract mixin class $ResumoNotasCopyWith<$Res>  {
  factory $ResumoNotasCopyWith(ResumoNotas value, $Res Function(ResumoNotas) _then) = _$ResumoNotasCopyWithImpl;
@useResult
$Res call({
 double media, double maiorNota, double menorNota
});




}
/// @nodoc
class _$ResumoNotasCopyWithImpl<$Res>
    implements $ResumoNotasCopyWith<$Res> {
  _$ResumoNotasCopyWithImpl(this._self, this._then);

  final ResumoNotas _self;
  final $Res Function(ResumoNotas) _then;

/// Create a copy of ResumoNotas
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? media = null,Object? maiorNota = null,Object? menorNota = null,}) {
  return _then(ResumoNotas(
media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as double,maiorNota: null == maiorNota ? _self.maiorNota : maiorNota // ignore: cast_nullable_to_non_nullable
as double,menorNota: null == menorNota ? _self.menorNota : menorNota // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ResumoNotas].
extension ResumoNotasPatterns on ResumoNotas {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResumoNotas value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResumoNotas() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResumoNotas value)  $default,){
final _that = this;
switch (_that) {
case _ResumoNotas():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResumoNotas value)?  $default,){
final _that = this;
switch (_that) {
case _ResumoNotas() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double media,  double maiorNota,  double menorNota)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResumoNotas() when $default != null:
return $default(_that.media,_that.maiorNota,_that.menorNota);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double media,  double maiorNota,  double menorNota)  $default,) {final _that = this;
switch (_that) {
case _ResumoNotas():
return $default(_that.media,_that.maiorNota,_that.menorNota);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double media,  double maiorNota,  double menorNota)?  $default,) {final _that = this;
switch (_that) {
case _ResumoNotas() when $default != null:
return $default(_that.media,_that.maiorNota,_that.menorNota);case _:
  return null;

}
}

}

/// @nodoc


class _ResumoNotas extends ResumoNotas {
  const _ResumoNotas({required this.media, required this.maiorNota, required this.menorNota}): super._();
  

@override final  double media;
@override final  double maiorNota;
@override final  double menorNota;

/// Create a copy of ResumoNotas
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResumoNotasCopyWith<_ResumoNotas> get copyWith => __$ResumoNotasCopyWithImpl<_ResumoNotas>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResumoNotas&&(identical(other.media, media) || other.media == media)&&(identical(other.maiorNota, maiorNota) || other.maiorNota == maiorNota)&&(identical(other.menorNota, menorNota) || other.menorNota == menorNota));
}


@override
int get hashCode {
    return Object.hash(runtimeType,media,maiorNota,menorNota);
}

@override
String toString() {
    return 'ResumoNotas(media: $media, maiorNota: $maiorNota, menorNota: $menorNota)';
}


}

/// @nodoc
abstract mixin class _$ResumoNotasCopyWith<$Res> implements $ResumoNotasCopyWith<$Res> {
  factory _$ResumoNotasCopyWith(_ResumoNotas value, $Res Function(_ResumoNotas) _then) = __$ResumoNotasCopyWithImpl;
@override @useResult
$Res call({
 double media, double maiorNota, double menorNota
});




}
/// @nodoc
class __$ResumoNotasCopyWithImpl<$Res>
    implements _$ResumoNotasCopyWith<$Res> {
  __$ResumoNotasCopyWithImpl(this._self, this._then);

  final _ResumoNotas _self;
  final $Res Function(_ResumoNotas) _then;

/// Create a copy of ResumoNotas
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? media = null,Object? maiorNota = null,Object? menorNota = null,}) {
  return _then(_ResumoNotas(
media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as double,maiorNota: null == maiorNota ? _self.maiorNota : maiorNota // ignore: cast_nullable_to_non_nullable
as double,menorNota: null == menorNota ? _self.menorNota : menorNota // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
