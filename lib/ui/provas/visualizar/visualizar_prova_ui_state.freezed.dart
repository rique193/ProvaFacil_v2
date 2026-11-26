// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visualizar_prova_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VisualizarProvaUiState {

 bool get carregando; ProvaComQuestoes? get prova; String? get erro;
/// Create a copy of VisualizarProvaUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VisualizarProvaUiStateCopyWith<VisualizarProvaUiState> get copyWith => _$VisualizarProvaUiStateCopyWithImpl<VisualizarProvaUiState>(this as VisualizarProvaUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as VisualizarProvaUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VisualizarProvaUiState&&(identical(other.carregando, _this.carregando) || other.carregando == _this.carregando)&&(identical(other.prova, _this.prova) || other.prova == _this.prova)&&(identical(other.erro, _this.erro) || other.erro == _this.erro));
}


@override
int get hashCode {
  final _this = this as VisualizarProvaUiState;
  return Object.hash(runtimeType,_this.carregando,_this.prova,_this.erro);
}

@override
String toString() {
  final _this = this as VisualizarProvaUiState;
  return 'VisualizarProvaUiState(carregando: ${_this.carregando}, prova: ${_this.prova}, erro: ${_this.erro})';
}


}

/// @nodoc
abstract mixin class $VisualizarProvaUiStateCopyWith<$Res>  {
  factory $VisualizarProvaUiStateCopyWith(VisualizarProvaUiState value, $Res Function(VisualizarProvaUiState) _then) = _$VisualizarProvaUiStateCopyWithImpl;
@useResult
$Res call({
 bool carregando, ProvaComQuestoes? prova, String? erro
});


$ProvaComQuestoesCopyWith<$Res>? get prova;

}
/// @nodoc
class _$VisualizarProvaUiStateCopyWithImpl<$Res>
    implements $VisualizarProvaUiStateCopyWith<$Res> {
  _$VisualizarProvaUiStateCopyWithImpl(this._self, this._then);

  final VisualizarProvaUiState _self;
  final $Res Function(VisualizarProvaUiState) _then;

/// Create a copy of VisualizarProvaUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? carregando = null,Object? prova = freezed,Object? erro = freezed,}) {
  return _then(VisualizarProvaUiState(
carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,prova: freezed == prova ? _self.prova : prova // ignore: cast_nullable_to_non_nullable
as ProvaComQuestoes?,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of VisualizarProvaUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvaComQuestoesCopyWith<$Res>? get prova {
    if (_self.prova == null) {
    return null;
  }

  return $ProvaComQuestoesCopyWith<$Res>(_self.prova!, (value) {
    return _then(_self.copyWith(prova: value));
  });
}
}


/// Adds pattern-matching-related methods to [VisualizarProvaUiState].
extension VisualizarProvaUiStatePatterns on VisualizarProvaUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VisualizarProvaUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VisualizarProvaUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VisualizarProvaUiState value)  $default,){
final _that = this;
switch (_that) {
case _VisualizarProvaUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VisualizarProvaUiState value)?  $default,){
final _that = this;
switch (_that) {
case _VisualizarProvaUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool carregando,  ProvaComQuestoes? prova,  String? erro)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VisualizarProvaUiState() when $default != null:
return $default(_that.carregando,_that.prova,_that.erro);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool carregando,  ProvaComQuestoes? prova,  String? erro)  $default,) {final _that = this;
switch (_that) {
case _VisualizarProvaUiState():
return $default(_that.carregando,_that.prova,_that.erro);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool carregando,  ProvaComQuestoes? prova,  String? erro)?  $default,) {final _that = this;
switch (_that) {
case _VisualizarProvaUiState() when $default != null:
return $default(_that.carregando,_that.prova,_that.erro);case _:
  return null;

}
}

}

/// @nodoc


class _VisualizarProvaUiState implements VisualizarProvaUiState {
  const _VisualizarProvaUiState({this.carregando = true, this.prova, this.erro});
  

@override@JsonKey() final  bool carregando;
@override final  ProvaComQuestoes? prova;
@override final  String? erro;

/// Create a copy of VisualizarProvaUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VisualizarProvaUiStateCopyWith<_VisualizarProvaUiState> get copyWith => __$VisualizarProvaUiStateCopyWithImpl<_VisualizarProvaUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VisualizarProvaUiState&&(identical(other.carregando, carregando) || other.carregando == carregando)&&(identical(other.prova, prova) || other.prova == prova)&&(identical(other.erro, erro) || other.erro == erro));
}


@override
int get hashCode {
    return Object.hash(runtimeType,carregando,prova,erro);
}

@override
String toString() {
    return 'VisualizarProvaUiState(carregando: $carregando, prova: $prova, erro: $erro)';
}


}

/// @nodoc
abstract mixin class _$VisualizarProvaUiStateCopyWith<$Res> implements $VisualizarProvaUiStateCopyWith<$Res> {
  factory _$VisualizarProvaUiStateCopyWith(_VisualizarProvaUiState value, $Res Function(_VisualizarProvaUiState) _then) = __$VisualizarProvaUiStateCopyWithImpl;
@override @useResult
$Res call({
 bool carregando, ProvaComQuestoes? prova, String? erro
});


@override $ProvaComQuestoesCopyWith<$Res>? get prova;

}
/// @nodoc
class __$VisualizarProvaUiStateCopyWithImpl<$Res>
    implements _$VisualizarProvaUiStateCopyWith<$Res> {
  __$VisualizarProvaUiStateCopyWithImpl(this._self, this._then);

  final _VisualizarProvaUiState _self;
  final $Res Function(_VisualizarProvaUiState) _then;

/// Create a copy of VisualizarProvaUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? carregando = null,Object? prova = freezed,Object? erro = freezed,}) {
  return _then(_VisualizarProvaUiState(
carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,prova: freezed == prova ? _self.prova : prova // ignore: cast_nullable_to_non_nullable
as ProvaComQuestoes?,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of VisualizarProvaUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvaComQuestoesCopyWith<$Res>? get prova {
    if (_self.prova == null) {
    return null;
  }

  return $ProvaComQuestoesCopyWith<$Res>(_self.prova!, (value) {
    return _then(_self.copyWith(prova: value));
  });
}
}

// dart format on
