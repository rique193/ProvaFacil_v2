// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turmas_disciplinas_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TurmasDisciplinasUiState {

 List<TurmaEntity> get turmas; List<DisciplinaEntity> get disciplinas; bool get carregando; String? get mensagem;
/// Create a copy of TurmasDisciplinasUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TurmasDisciplinasUiStateCopyWith<TurmasDisciplinasUiState> get copyWith => _$TurmasDisciplinasUiStateCopyWithImpl<TurmasDisciplinasUiState>(this as TurmasDisciplinasUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TurmasDisciplinasUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TurmasDisciplinasUiState&&const DeepCollectionEquality().equals(other.turmas, _this.turmas)&&const DeepCollectionEquality().equals(other.disciplinas, _this.disciplinas)&&(identical(other.carregando, _this.carregando) || other.carregando == _this.carregando)&&(identical(other.mensagem, _this.mensagem) || other.mensagem == _this.mensagem));
}


@override
int get hashCode {
  final _this = this as TurmasDisciplinasUiState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.turmas),const DeepCollectionEquality().hash(_this.disciplinas),_this.carregando,_this.mensagem);
}

@override
String toString() {
  final _this = this as TurmasDisciplinasUiState;
  return 'TurmasDisciplinasUiState(turmas: ${_this.turmas}, disciplinas: ${_this.disciplinas}, carregando: ${_this.carregando}, mensagem: ${_this.mensagem})';
}


}

/// @nodoc
abstract mixin class $TurmasDisciplinasUiStateCopyWith<$Res>  {
  factory $TurmasDisciplinasUiStateCopyWith(TurmasDisciplinasUiState value, $Res Function(TurmasDisciplinasUiState) _then) = _$TurmasDisciplinasUiStateCopyWithImpl;
@useResult
$Res call({
 List<TurmaEntity> turmas, List<DisciplinaEntity> disciplinas, bool carregando, String? mensagem
});




}
/// @nodoc
class _$TurmasDisciplinasUiStateCopyWithImpl<$Res>
    implements $TurmasDisciplinasUiStateCopyWith<$Res> {
  _$TurmasDisciplinasUiStateCopyWithImpl(this._self, this._then);

  final TurmasDisciplinasUiState _self;
  final $Res Function(TurmasDisciplinasUiState) _then;

/// Create a copy of TurmasDisciplinasUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? turmas = null,Object? disciplinas = null,Object? carregando = null,Object? mensagem = freezed,}) {
  return _then(TurmasDisciplinasUiState(
turmas: null == turmas ? _self.turmas : turmas // ignore: cast_nullable_to_non_nullable
as List<TurmaEntity>,disciplinas: null == disciplinas ? _self.disciplinas : disciplinas // ignore: cast_nullable_to_non_nullable
as List<DisciplinaEntity>,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,mensagem: freezed == mensagem ? _self.mensagem : mensagem // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TurmasDisciplinasUiState].
extension TurmasDisciplinasUiStatePatterns on TurmasDisciplinasUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TurmasDisciplinasUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TurmasDisciplinasUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TurmasDisciplinasUiState value)  $default,){
final _that = this;
switch (_that) {
case _TurmasDisciplinasUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TurmasDisciplinasUiState value)?  $default,){
final _that = this;
switch (_that) {
case _TurmasDisciplinasUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TurmaEntity> turmas,  List<DisciplinaEntity> disciplinas,  bool carregando,  String? mensagem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TurmasDisciplinasUiState() when $default != null:
return $default(_that.turmas,_that.disciplinas,_that.carregando,_that.mensagem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TurmaEntity> turmas,  List<DisciplinaEntity> disciplinas,  bool carregando,  String? mensagem)  $default,) {final _that = this;
switch (_that) {
case _TurmasDisciplinasUiState():
return $default(_that.turmas,_that.disciplinas,_that.carregando,_that.mensagem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TurmaEntity> turmas,  List<DisciplinaEntity> disciplinas,  bool carregando,  String? mensagem)?  $default,) {final _that = this;
switch (_that) {
case _TurmasDisciplinasUiState() when $default != null:
return $default(_that.turmas,_that.disciplinas,_that.carregando,_that.mensagem);case _:
  return null;

}
}

}

/// @nodoc


class _TurmasDisciplinasUiState implements TurmasDisciplinasUiState {
  const _TurmasDisciplinasUiState({ List<TurmaEntity> turmas = const [],  List<DisciplinaEntity> disciplinas = const [], this.carregando = true, this.mensagem}): _turmas = turmas,_disciplinas = disciplinas;
  

 final  List<TurmaEntity> _turmas;
@override@JsonKey() List<TurmaEntity> get turmas {
  if (_turmas is EqualUnmodifiableListView) return _turmas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_turmas);
}

 final  List<DisciplinaEntity> _disciplinas;
@override@JsonKey() List<DisciplinaEntity> get disciplinas {
  if (_disciplinas is EqualUnmodifiableListView) return _disciplinas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_disciplinas);
}

@override@JsonKey() final  bool carregando;
@override final  String? mensagem;

/// Create a copy of TurmasDisciplinasUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TurmasDisciplinasUiStateCopyWith<_TurmasDisciplinasUiState> get copyWith => __$TurmasDisciplinasUiStateCopyWithImpl<_TurmasDisciplinasUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TurmasDisciplinasUiState&&const DeepCollectionEquality().equals(other.turmas, _turmas)&&const DeepCollectionEquality().equals(other.disciplinas, _disciplinas)&&(identical(other.carregando, carregando) || other.carregando == carregando)&&(identical(other.mensagem, mensagem) || other.mensagem == mensagem));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_turmas),const DeepCollectionEquality().hash(_disciplinas),carregando,mensagem);
}

@override
String toString() {
    return 'TurmasDisciplinasUiState(turmas: $turmas, disciplinas: $disciplinas, carregando: $carregando, mensagem: $mensagem)';
}


}

/// @nodoc
abstract mixin class _$TurmasDisciplinasUiStateCopyWith<$Res> implements $TurmasDisciplinasUiStateCopyWith<$Res> {
  factory _$TurmasDisciplinasUiStateCopyWith(_TurmasDisciplinasUiState value, $Res Function(_TurmasDisciplinasUiState) _then) = __$TurmasDisciplinasUiStateCopyWithImpl;
@override @useResult
$Res call({
 List<TurmaEntity> turmas, List<DisciplinaEntity> disciplinas, bool carregando, String? mensagem
});




}
/// @nodoc
class __$TurmasDisciplinasUiStateCopyWithImpl<$Res>
    implements _$TurmasDisciplinasUiStateCopyWith<$Res> {
  __$TurmasDisciplinasUiStateCopyWithImpl(this._self, this._then);

  final _TurmasDisciplinasUiState _self;
  final $Res Function(_TurmasDisciplinasUiState) _then;

/// Create a copy of TurmasDisciplinasUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? turmas = null,Object? disciplinas = null,Object? carregando = null,Object? mensagem = freezed,}) {
  return _then(_TurmasDisciplinasUiState(
turmas: null == turmas ? _self._turmas : turmas // ignore: cast_nullable_to_non_nullable
as List<TurmaEntity>,disciplinas: null == disciplinas ? _self._disciplinas : disciplinas // ignore: cast_nullable_to_non_nullable
as List<DisciplinaEntity>,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,mensagem: freezed == mensagem ? _self.mensagem : mensagem // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
