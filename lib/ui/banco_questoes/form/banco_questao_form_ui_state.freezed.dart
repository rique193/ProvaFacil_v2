// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banco_questao_form_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BancoQuestaoFormUiState {

 int? get questaoId; List<DisciplinaEntity> get disciplinas; String get disciplina; String get enunciado; List<String> get alternativas; int get indiceCorreta; bool get carregando; bool get salvo; bool get excluida; String? get erro;
/// Create a copy of BancoQuestaoFormUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BancoQuestaoFormUiStateCopyWith<BancoQuestaoFormUiState> get copyWith => _$BancoQuestaoFormUiStateCopyWithImpl<BancoQuestaoFormUiState>(this as BancoQuestaoFormUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BancoQuestaoFormUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BancoQuestaoFormUiState&&(identical(other.questaoId, _this.questaoId) || other.questaoId == _this.questaoId)&&const DeepCollectionEquality().equals(other.disciplinas, _this.disciplinas)&&(identical(other.disciplina, _this.disciplina) || other.disciplina == _this.disciplina)&&(identical(other.enunciado, _this.enunciado) || other.enunciado == _this.enunciado)&&const DeepCollectionEquality().equals(other.alternativas, _this.alternativas)&&(identical(other.indiceCorreta, _this.indiceCorreta) || other.indiceCorreta == _this.indiceCorreta)&&(identical(other.carregando, _this.carregando) || other.carregando == _this.carregando)&&(identical(other.salvo, _this.salvo) || other.salvo == _this.salvo)&&(identical(other.excluida, _this.excluida) || other.excluida == _this.excluida)&&(identical(other.erro, _this.erro) || other.erro == _this.erro));
}


@override
int get hashCode {
  final _this = this as BancoQuestaoFormUiState;
  return Object.hash(runtimeType,_this.questaoId,const DeepCollectionEquality().hash(_this.disciplinas),_this.disciplina,_this.enunciado,const DeepCollectionEquality().hash(_this.alternativas),_this.indiceCorreta,_this.carregando,_this.salvo,_this.excluida,_this.erro);
}

@override
String toString() {
  final _this = this as BancoQuestaoFormUiState;
  return 'BancoQuestaoFormUiState(questaoId: ${_this.questaoId}, disciplinas: ${_this.disciplinas}, disciplina: ${_this.disciplina}, enunciado: ${_this.enunciado}, alternativas: ${_this.alternativas}, indiceCorreta: ${_this.indiceCorreta}, carregando: ${_this.carregando}, salvo: ${_this.salvo}, excluida: ${_this.excluida}, erro: ${_this.erro})';
}


}

/// @nodoc
abstract mixin class $BancoQuestaoFormUiStateCopyWith<$Res>  {
  factory $BancoQuestaoFormUiStateCopyWith(BancoQuestaoFormUiState value, $Res Function(BancoQuestaoFormUiState) _then) = _$BancoQuestaoFormUiStateCopyWithImpl;
@useResult
$Res call({
 int? questaoId, List<DisciplinaEntity> disciplinas, String disciplina, String enunciado, List<String> alternativas, int indiceCorreta, bool carregando, bool salvo, bool excluida, String? erro
});




}
/// @nodoc
class _$BancoQuestaoFormUiStateCopyWithImpl<$Res>
    implements $BancoQuestaoFormUiStateCopyWith<$Res> {
  _$BancoQuestaoFormUiStateCopyWithImpl(this._self, this._then);

  final BancoQuestaoFormUiState _self;
  final $Res Function(BancoQuestaoFormUiState) _then;

/// Create a copy of BancoQuestaoFormUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questaoId = freezed,Object? disciplinas = null,Object? disciplina = null,Object? enunciado = null,Object? alternativas = null,Object? indiceCorreta = null,Object? carregando = null,Object? salvo = null,Object? excluida = null,Object? erro = freezed,}) {
  return _then(BancoQuestaoFormUiState(
questaoId: freezed == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int?,disciplinas: null == disciplinas ? _self.disciplinas : disciplinas // ignore: cast_nullable_to_non_nullable
as List<DisciplinaEntity>,disciplina: null == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String,enunciado: null == enunciado ? _self.enunciado : enunciado // ignore: cast_nullable_to_non_nullable
as String,alternativas: null == alternativas ? _self.alternativas : alternativas // ignore: cast_nullable_to_non_nullable
as List<String>,indiceCorreta: null == indiceCorreta ? _self.indiceCorreta : indiceCorreta // ignore: cast_nullable_to_non_nullable
as int,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,salvo: null == salvo ? _self.salvo : salvo // ignore: cast_nullable_to_non_nullable
as bool,excluida: null == excluida ? _self.excluida : excluida // ignore: cast_nullable_to_non_nullable
as bool,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BancoQuestaoFormUiState].
extension BancoQuestaoFormUiStatePatterns on BancoQuestaoFormUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BancoQuestaoFormUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BancoQuestaoFormUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BancoQuestaoFormUiState value)  $default,){
final _that = this;
switch (_that) {
case _BancoQuestaoFormUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BancoQuestaoFormUiState value)?  $default,){
final _that = this;
switch (_that) {
case _BancoQuestaoFormUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? questaoId,  List<DisciplinaEntity> disciplinas,  String disciplina,  String enunciado,  List<String> alternativas,  int indiceCorreta,  bool carregando,  bool salvo,  bool excluida,  String? erro)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BancoQuestaoFormUiState() when $default != null:
return $default(_that.questaoId,_that.disciplinas,_that.disciplina,_that.enunciado,_that.alternativas,_that.indiceCorreta,_that.carregando,_that.salvo,_that.excluida,_that.erro);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? questaoId,  List<DisciplinaEntity> disciplinas,  String disciplina,  String enunciado,  List<String> alternativas,  int indiceCorreta,  bool carregando,  bool salvo,  bool excluida,  String? erro)  $default,) {final _that = this;
switch (_that) {
case _BancoQuestaoFormUiState():
return $default(_that.questaoId,_that.disciplinas,_that.disciplina,_that.enunciado,_that.alternativas,_that.indiceCorreta,_that.carregando,_that.salvo,_that.excluida,_that.erro);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? questaoId,  List<DisciplinaEntity> disciplinas,  String disciplina,  String enunciado,  List<String> alternativas,  int indiceCorreta,  bool carregando,  bool salvo,  bool excluida,  String? erro)?  $default,) {final _that = this;
switch (_that) {
case _BancoQuestaoFormUiState() when $default != null:
return $default(_that.questaoId,_that.disciplinas,_that.disciplina,_that.enunciado,_that.alternativas,_that.indiceCorreta,_that.carregando,_that.salvo,_that.excluida,_that.erro);case _:
  return null;

}
}

}

/// @nodoc


class _BancoQuestaoFormUiState extends BancoQuestaoFormUiState {
  const _BancoQuestaoFormUiState({this.questaoId,  List<DisciplinaEntity> disciplinas = const [], this.disciplina = '', this.enunciado = '',  List<String> alternativas = const ['', '', '', '', ''], this.indiceCorreta = -1, this.carregando = false, this.salvo = false, this.excluida = false, this.erro}): _disciplinas = disciplinas,_alternativas = alternativas,super._();
  

@override final  int? questaoId;
 final  List<DisciplinaEntity> _disciplinas;
@override@JsonKey() List<DisciplinaEntity> get disciplinas {
  if (_disciplinas is EqualUnmodifiableListView) return _disciplinas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_disciplinas);
}

@override@JsonKey() final  String disciplina;
@override@JsonKey() final  String enunciado;
 final  List<String> _alternativas;
@override@JsonKey() List<String> get alternativas {
  if (_alternativas is EqualUnmodifiableListView) return _alternativas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alternativas);
}

@override@JsonKey() final  int indiceCorreta;
@override@JsonKey() final  bool carregando;
@override@JsonKey() final  bool salvo;
@override@JsonKey() final  bool excluida;
@override final  String? erro;

/// Create a copy of BancoQuestaoFormUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BancoQuestaoFormUiStateCopyWith<_BancoQuestaoFormUiState> get copyWith => __$BancoQuestaoFormUiStateCopyWithImpl<_BancoQuestaoFormUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BancoQuestaoFormUiState&&(identical(other.questaoId, questaoId) || other.questaoId == questaoId)&&const DeepCollectionEquality().equals(other.disciplinas, _disciplinas)&&(identical(other.disciplina, disciplina) || other.disciplina == disciplina)&&(identical(other.enunciado, enunciado) || other.enunciado == enunciado)&&const DeepCollectionEquality().equals(other.alternativas, _alternativas)&&(identical(other.indiceCorreta, indiceCorreta) || other.indiceCorreta == indiceCorreta)&&(identical(other.carregando, carregando) || other.carregando == carregando)&&(identical(other.salvo, salvo) || other.salvo == salvo)&&(identical(other.excluida, excluida) || other.excluida == excluida)&&(identical(other.erro, erro) || other.erro == erro));
}


@override
int get hashCode {
    return Object.hash(runtimeType,questaoId,const DeepCollectionEquality().hash(_disciplinas),disciplina,enunciado,const DeepCollectionEquality().hash(_alternativas),indiceCorreta,carregando,salvo,excluida,erro);
}

@override
String toString() {
    return 'BancoQuestaoFormUiState(questaoId: $questaoId, disciplinas: $disciplinas, disciplina: $disciplina, enunciado: $enunciado, alternativas: $alternativas, indiceCorreta: $indiceCorreta, carregando: $carregando, salvo: $salvo, excluida: $excluida, erro: $erro)';
}


}

/// @nodoc
abstract mixin class _$BancoQuestaoFormUiStateCopyWith<$Res> implements $BancoQuestaoFormUiStateCopyWith<$Res> {
  factory _$BancoQuestaoFormUiStateCopyWith(_BancoQuestaoFormUiState value, $Res Function(_BancoQuestaoFormUiState) _then) = __$BancoQuestaoFormUiStateCopyWithImpl;
@override @useResult
$Res call({
 int? questaoId, List<DisciplinaEntity> disciplinas, String disciplina, String enunciado, List<String> alternativas, int indiceCorreta, bool carregando, bool salvo, bool excluida, String? erro
});




}
/// @nodoc
class __$BancoQuestaoFormUiStateCopyWithImpl<$Res>
    implements _$BancoQuestaoFormUiStateCopyWith<$Res> {
  __$BancoQuestaoFormUiStateCopyWithImpl(this._self, this._then);

  final _BancoQuestaoFormUiState _self;
  final $Res Function(_BancoQuestaoFormUiState) _then;

/// Create a copy of BancoQuestaoFormUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questaoId = freezed,Object? disciplinas = null,Object? disciplina = null,Object? enunciado = null,Object? alternativas = null,Object? indiceCorreta = null,Object? carregando = null,Object? salvo = null,Object? excluida = null,Object? erro = freezed,}) {
  return _then(_BancoQuestaoFormUiState(
questaoId: freezed == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int?,disciplinas: null == disciplinas ? _self._disciplinas : disciplinas // ignore: cast_nullable_to_non_nullable
as List<DisciplinaEntity>,disciplina: null == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String,enunciado: null == enunciado ? _self.enunciado : enunciado // ignore: cast_nullable_to_non_nullable
as String,alternativas: null == alternativas ? _self._alternativas : alternativas // ignore: cast_nullable_to_non_nullable
as List<String>,indiceCorreta: null == indiceCorreta ? _self.indiceCorreta : indiceCorreta // ignore: cast_nullable_to_non_nullable
as int,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,salvo: null == salvo ? _self.salvo : salvo // ignore: cast_nullable_to_non_nullable
as bool,excluida: null == excluida ? _self.excluida : excluida // ignore: cast_nullable_to_non_nullable
as bool,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
