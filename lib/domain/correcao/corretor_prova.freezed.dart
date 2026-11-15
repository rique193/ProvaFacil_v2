// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'corretor_prova.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GabaritoQuestao {

 int get questaoId; int get numero; String? get letraCorreta;
/// Create a copy of GabaritoQuestao
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GabaritoQuestaoCopyWith<GabaritoQuestao> get copyWith => _$GabaritoQuestaoCopyWithImpl<GabaritoQuestao>(this as GabaritoQuestao, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GabaritoQuestao;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GabaritoQuestao&&(identical(other.questaoId, _this.questaoId) || other.questaoId == _this.questaoId)&&(identical(other.numero, _this.numero) || other.numero == _this.numero)&&(identical(other.letraCorreta, _this.letraCorreta) || other.letraCorreta == _this.letraCorreta));
}


@override
int get hashCode {
  final _this = this as GabaritoQuestao;
  return Object.hash(runtimeType,_this.questaoId,_this.numero,_this.letraCorreta);
}

@override
String toString() {
  final _this = this as GabaritoQuestao;
  return 'GabaritoQuestao(questaoId: ${_this.questaoId}, numero: ${_this.numero}, letraCorreta: ${_this.letraCorreta})';
}


}

/// @nodoc
abstract mixin class $GabaritoQuestaoCopyWith<$Res>  {
  factory $GabaritoQuestaoCopyWith(GabaritoQuestao value, $Res Function(GabaritoQuestao) _then) = _$GabaritoQuestaoCopyWithImpl;
@useResult
$Res call({
 int questaoId, int numero, String? letraCorreta
});




}
/// @nodoc
class _$GabaritoQuestaoCopyWithImpl<$Res>
    implements $GabaritoQuestaoCopyWith<$Res> {
  _$GabaritoQuestaoCopyWithImpl(this._self, this._then);

  final GabaritoQuestao _self;
  final $Res Function(GabaritoQuestao) _then;

/// Create a copy of GabaritoQuestao
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questaoId = null,Object? numero = null,Object? letraCorreta = freezed,}) {
  return _then(GabaritoQuestao(
questaoId: null == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int,numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,letraCorreta: freezed == letraCorreta ? _self.letraCorreta : letraCorreta // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GabaritoQuestao].
extension GabaritoQuestaoPatterns on GabaritoQuestao {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GabaritoQuestao value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GabaritoQuestao() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GabaritoQuestao value)  $default,){
final _that = this;
switch (_that) {
case _GabaritoQuestao():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GabaritoQuestao value)?  $default,){
final _that = this;
switch (_that) {
case _GabaritoQuestao() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int questaoId,  int numero,  String? letraCorreta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GabaritoQuestao() when $default != null:
return $default(_that.questaoId,_that.numero,_that.letraCorreta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int questaoId,  int numero,  String? letraCorreta)  $default,) {final _that = this;
switch (_that) {
case _GabaritoQuestao():
return $default(_that.questaoId,_that.numero,_that.letraCorreta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int questaoId,  int numero,  String? letraCorreta)?  $default,) {final _that = this;
switch (_that) {
case _GabaritoQuestao() when $default != null:
return $default(_that.questaoId,_that.numero,_that.letraCorreta);case _:
  return null;

}
}

}

/// @nodoc


class _GabaritoQuestao implements GabaritoQuestao {
  const _GabaritoQuestao({required this.questaoId, required this.numero, required this.letraCorreta});
  

@override final  int questaoId;
@override final  int numero;
@override final  String? letraCorreta;

/// Create a copy of GabaritoQuestao
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GabaritoQuestaoCopyWith<_GabaritoQuestao> get copyWith => __$GabaritoQuestaoCopyWithImpl<_GabaritoQuestao>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GabaritoQuestao&&(identical(other.questaoId, questaoId) || other.questaoId == questaoId)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.letraCorreta, letraCorreta) || other.letraCorreta == letraCorreta));
}


@override
int get hashCode {
    return Object.hash(runtimeType,questaoId,numero,letraCorreta);
}

@override
String toString() {
    return 'GabaritoQuestao(questaoId: $questaoId, numero: $numero, letraCorreta: $letraCorreta)';
}


}

/// @nodoc
abstract mixin class _$GabaritoQuestaoCopyWith<$Res> implements $GabaritoQuestaoCopyWith<$Res> {
  factory _$GabaritoQuestaoCopyWith(_GabaritoQuestao value, $Res Function(_GabaritoQuestao) _then) = __$GabaritoQuestaoCopyWithImpl;
@override @useResult
$Res call({
 int questaoId, int numero, String? letraCorreta
});




}
/// @nodoc
class __$GabaritoQuestaoCopyWithImpl<$Res>
    implements _$GabaritoQuestaoCopyWith<$Res> {
  __$GabaritoQuestaoCopyWithImpl(this._self, this._then);

  final _GabaritoQuestao _self;
  final $Res Function(_GabaritoQuestao) _then;

/// Create a copy of GabaritoQuestao
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questaoId = null,Object? numero = null,Object? letraCorreta = freezed,}) {
  return _then(_GabaritoQuestao(
questaoId: null == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int,numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,letraCorreta: freezed == letraCorreta ? _self.letraCorreta : letraCorreta // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
