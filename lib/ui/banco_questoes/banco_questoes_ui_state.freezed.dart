// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banco_questoes_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BancoQuestoesUiState {

 List<BancoQuestaoComAlternativas> get questoes; List<DisciplinaEntity> get disciplinas; String? get disciplinaSelecionada; bool get carregando; String? get mensagem;
/// Create a copy of BancoQuestoesUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BancoQuestoesUiStateCopyWith<BancoQuestoesUiState> get copyWith => _$BancoQuestoesUiStateCopyWithImpl<BancoQuestoesUiState>(this as BancoQuestoesUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BancoQuestoesUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BancoQuestoesUiState&&const DeepCollectionEquality().equals(other.questoes, _this.questoes)&&const DeepCollectionEquality().equals(other.disciplinas, _this.disciplinas)&&(identical(other.disciplinaSelecionada, _this.disciplinaSelecionada) || other.disciplinaSelecionada == _this.disciplinaSelecionada)&&(identical(other.carregando, _this.carregando) || other.carregando == _this.carregando)&&(identical(other.mensagem, _this.mensagem) || other.mensagem == _this.mensagem));
}


@override
int get hashCode {
  final _this = this as BancoQuestoesUiState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.questoes),const DeepCollectionEquality().hash(_this.disciplinas),_this.disciplinaSelecionada,_this.carregando,_this.mensagem);
}

@override
String toString() {
  final _this = this as BancoQuestoesUiState;
  return 'BancoQuestoesUiState(questoes: ${_this.questoes}, disciplinas: ${_this.disciplinas}, disciplinaSelecionada: ${_this.disciplinaSelecionada}, carregando: ${_this.carregando}, mensagem: ${_this.mensagem})';
}


}

/// @nodoc
abstract mixin class $BancoQuestoesUiStateCopyWith<$Res>  {
  factory $BancoQuestoesUiStateCopyWith(BancoQuestoesUiState value, $Res Function(BancoQuestoesUiState) _then) = _$BancoQuestoesUiStateCopyWithImpl;
@useResult
$Res call({
 List<BancoQuestaoComAlternativas> questoes, List<DisciplinaEntity> disciplinas, String? disciplinaSelecionada, bool carregando, String? mensagem
});




}
/// @nodoc
class _$BancoQuestoesUiStateCopyWithImpl<$Res>
    implements $BancoQuestoesUiStateCopyWith<$Res> {
  _$BancoQuestoesUiStateCopyWithImpl(this._self, this._then);

  final BancoQuestoesUiState _self;
  final $Res Function(BancoQuestoesUiState) _then;

/// Create a copy of BancoQuestoesUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questoes = null,Object? disciplinas = null,Object? disciplinaSelecionada = freezed,Object? carregando = null,Object? mensagem = freezed,}) {
  return _then(BancoQuestoesUiState(
questoes: null == questoes ? _self.questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<BancoQuestaoComAlternativas>,disciplinas: null == disciplinas ? _self.disciplinas : disciplinas // ignore: cast_nullable_to_non_nullable
as List<DisciplinaEntity>,disciplinaSelecionada: freezed == disciplinaSelecionada ? _self.disciplinaSelecionada : disciplinaSelecionada // ignore: cast_nullable_to_non_nullable
as String?,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,mensagem: freezed == mensagem ? _self.mensagem : mensagem // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BancoQuestoesUiState].
extension BancoQuestoesUiStatePatterns on BancoQuestoesUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BancoQuestoesUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BancoQuestoesUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BancoQuestoesUiState value)  $default,){
final _that = this;
switch (_that) {
case _BancoQuestoesUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BancoQuestoesUiState value)?  $default,){
final _that = this;
switch (_that) {
case _BancoQuestoesUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BancoQuestaoComAlternativas> questoes,  List<DisciplinaEntity> disciplinas,  String? disciplinaSelecionada,  bool carregando,  String? mensagem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BancoQuestoesUiState() when $default != null:
return $default(_that.questoes,_that.disciplinas,_that.disciplinaSelecionada,_that.carregando,_that.mensagem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BancoQuestaoComAlternativas> questoes,  List<DisciplinaEntity> disciplinas,  String? disciplinaSelecionada,  bool carregando,  String? mensagem)  $default,) {final _that = this;
switch (_that) {
case _BancoQuestoesUiState():
return $default(_that.questoes,_that.disciplinas,_that.disciplinaSelecionada,_that.carregando,_that.mensagem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BancoQuestaoComAlternativas> questoes,  List<DisciplinaEntity> disciplinas,  String? disciplinaSelecionada,  bool carregando,  String? mensagem)?  $default,) {final _that = this;
switch (_that) {
case _BancoQuestoesUiState() when $default != null:
return $default(_that.questoes,_that.disciplinas,_that.disciplinaSelecionada,_that.carregando,_that.mensagem);case _:
  return null;

}
}

}

/// @nodoc


class _BancoQuestoesUiState implements BancoQuestoesUiState {
  const _BancoQuestoesUiState({ List<BancoQuestaoComAlternativas> questoes = const [],  List<DisciplinaEntity> disciplinas = const [], this.disciplinaSelecionada, this.carregando = true, this.mensagem}): _questoes = questoes,_disciplinas = disciplinas;
  

 final  List<BancoQuestaoComAlternativas> _questoes;
@override@JsonKey() List<BancoQuestaoComAlternativas> get questoes {
  if (_questoes is EqualUnmodifiableListView) return _questoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questoes);
}

 final  List<DisciplinaEntity> _disciplinas;
@override@JsonKey() List<DisciplinaEntity> get disciplinas {
  if (_disciplinas is EqualUnmodifiableListView) return _disciplinas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_disciplinas);
}

@override final  String? disciplinaSelecionada;
@override@JsonKey() final  bool carregando;
@override final  String? mensagem;

/// Create a copy of BancoQuestoesUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BancoQuestoesUiStateCopyWith<_BancoQuestoesUiState> get copyWith => __$BancoQuestoesUiStateCopyWithImpl<_BancoQuestoesUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BancoQuestoesUiState&&const DeepCollectionEquality().equals(other.questoes, _questoes)&&const DeepCollectionEquality().equals(other.disciplinas, _disciplinas)&&(identical(other.disciplinaSelecionada, disciplinaSelecionada) || other.disciplinaSelecionada == disciplinaSelecionada)&&(identical(other.carregando, carregando) || other.carregando == carregando)&&(identical(other.mensagem, mensagem) || other.mensagem == mensagem));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_questoes),const DeepCollectionEquality().hash(_disciplinas),disciplinaSelecionada,carregando,mensagem);
}

@override
String toString() {
    return 'BancoQuestoesUiState(questoes: $questoes, disciplinas: $disciplinas, disciplinaSelecionada: $disciplinaSelecionada, carregando: $carregando, mensagem: $mensagem)';
}


}

/// @nodoc
abstract mixin class _$BancoQuestoesUiStateCopyWith<$Res> implements $BancoQuestoesUiStateCopyWith<$Res> {
  factory _$BancoQuestoesUiStateCopyWith(_BancoQuestoesUiState value, $Res Function(_BancoQuestoesUiState) _then) = __$BancoQuestoesUiStateCopyWithImpl;
@override @useResult
$Res call({
 List<BancoQuestaoComAlternativas> questoes, List<DisciplinaEntity> disciplinas, String? disciplinaSelecionada, bool carregando, String? mensagem
});




}
/// @nodoc
class __$BancoQuestoesUiStateCopyWithImpl<$Res>
    implements _$BancoQuestoesUiStateCopyWith<$Res> {
  __$BancoQuestoesUiStateCopyWithImpl(this._self, this._then);

  final _BancoQuestoesUiState _self;
  final $Res Function(_BancoQuestoesUiState) _then;

/// Create a copy of BancoQuestoesUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questoes = null,Object? disciplinas = null,Object? disciplinaSelecionada = freezed,Object? carregando = null,Object? mensagem = freezed,}) {
  return _then(_BancoQuestoesUiState(
questoes: null == questoes ? _self._questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<BancoQuestaoComAlternativas>,disciplinas: null == disciplinas ? _self._disciplinas : disciplinas // ignore: cast_nullable_to_non_nullable
as List<DisciplinaEntity>,disciplinaSelecionada: freezed == disciplinaSelecionada ? _self.disciplinaSelecionada : disciplinaSelecionada // ignore: cast_nullable_to_non_nullable
as String?,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,mensagem: freezed == mensagem ? _self.mensagem : mensagem // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
