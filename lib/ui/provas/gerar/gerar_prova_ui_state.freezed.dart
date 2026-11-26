// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gerar_prova_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GerarProvaUiState {

 bool get carregando; bool get gerando; String get titulo; String get descricao; String? get disciplina; String? get turma; List<DisciplinaEntity> get disciplinas; List<TurmaEntity> get turmas; List<BancoQuestaoComAlternativas> get bancoQuestoes; Set<int> get selecionadas; bool get embaralharQuestoes; bool get embaralharAlternativas; int? get provaIdGerada; String? get erro;
/// Create a copy of GerarProvaUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GerarProvaUiStateCopyWith<GerarProvaUiState> get copyWith => _$GerarProvaUiStateCopyWithImpl<GerarProvaUiState>(this as GerarProvaUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GerarProvaUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GerarProvaUiState&&(identical(other.carregando, _this.carregando) || other.carregando == _this.carregando)&&(identical(other.gerando, _this.gerando) || other.gerando == _this.gerando)&&(identical(other.titulo, _this.titulo) || other.titulo == _this.titulo)&&(identical(other.descricao, _this.descricao) || other.descricao == _this.descricao)&&(identical(other.disciplina, _this.disciplina) || other.disciplina == _this.disciplina)&&(identical(other.turma, _this.turma) || other.turma == _this.turma)&&const DeepCollectionEquality().equals(other.disciplinas, _this.disciplinas)&&const DeepCollectionEquality().equals(other.turmas, _this.turmas)&&const DeepCollectionEquality().equals(other.bancoQuestoes, _this.bancoQuestoes)&&const DeepCollectionEquality().equals(other.selecionadas, _this.selecionadas)&&(identical(other.embaralharQuestoes, _this.embaralharQuestoes) || other.embaralharQuestoes == _this.embaralharQuestoes)&&(identical(other.embaralharAlternativas, _this.embaralharAlternativas) || other.embaralharAlternativas == _this.embaralharAlternativas)&&(identical(other.provaIdGerada, _this.provaIdGerada) || other.provaIdGerada == _this.provaIdGerada)&&(identical(other.erro, _this.erro) || other.erro == _this.erro));
}


@override
int get hashCode {
  final _this = this as GerarProvaUiState;
  return Object.hash(runtimeType,_this.carregando,_this.gerando,_this.titulo,_this.descricao,_this.disciplina,_this.turma,const DeepCollectionEquality().hash(_this.disciplinas),const DeepCollectionEquality().hash(_this.turmas),const DeepCollectionEquality().hash(_this.bancoQuestoes),const DeepCollectionEquality().hash(_this.selecionadas),_this.embaralharQuestoes,_this.embaralharAlternativas,_this.provaIdGerada,_this.erro);
}

@override
String toString() {
  final _this = this as GerarProvaUiState;
  return 'GerarProvaUiState(carregando: ${_this.carregando}, gerando: ${_this.gerando}, titulo: ${_this.titulo}, descricao: ${_this.descricao}, disciplina: ${_this.disciplina}, turma: ${_this.turma}, disciplinas: ${_this.disciplinas}, turmas: ${_this.turmas}, bancoQuestoes: ${_this.bancoQuestoes}, selecionadas: ${_this.selecionadas}, embaralharQuestoes: ${_this.embaralharQuestoes}, embaralharAlternativas: ${_this.embaralharAlternativas}, provaIdGerada: ${_this.provaIdGerada}, erro: ${_this.erro})';
}


}

/// @nodoc
abstract mixin class $GerarProvaUiStateCopyWith<$Res>  {
  factory $GerarProvaUiStateCopyWith(GerarProvaUiState value, $Res Function(GerarProvaUiState) _then) = _$GerarProvaUiStateCopyWithImpl;
@useResult
$Res call({
 bool carregando, bool gerando, String titulo, String descricao, String? disciplina, String? turma, List<DisciplinaEntity> disciplinas, List<TurmaEntity> turmas, List<BancoQuestaoComAlternativas> bancoQuestoes, Set<int> selecionadas, bool embaralharQuestoes, bool embaralharAlternativas, int? provaIdGerada, String? erro
});




}
/// @nodoc
class _$GerarProvaUiStateCopyWithImpl<$Res>
    implements $GerarProvaUiStateCopyWith<$Res> {
  _$GerarProvaUiStateCopyWithImpl(this._self, this._then);

  final GerarProvaUiState _self;
  final $Res Function(GerarProvaUiState) _then;

/// Create a copy of GerarProvaUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? carregando = null,Object? gerando = null,Object? titulo = null,Object? descricao = null,Object? disciplina = freezed,Object? turma = freezed,Object? disciplinas = null,Object? turmas = null,Object? bancoQuestoes = null,Object? selecionadas = null,Object? embaralharQuestoes = null,Object? embaralharAlternativas = null,Object? provaIdGerada = freezed,Object? erro = freezed,}) {
  return _then(GerarProvaUiState(
carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,gerando: null == gerando ? _self.gerando : gerando // ignore: cast_nullable_to_non_nullable
as bool,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,disciplina: freezed == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String?,turma: freezed == turma ? _self.turma : turma // ignore: cast_nullable_to_non_nullable
as String?,disciplinas: null == disciplinas ? _self.disciplinas : disciplinas // ignore: cast_nullable_to_non_nullable
as List<DisciplinaEntity>,turmas: null == turmas ? _self.turmas : turmas // ignore: cast_nullable_to_non_nullable
as List<TurmaEntity>,bancoQuestoes: null == bancoQuestoes ? _self.bancoQuestoes : bancoQuestoes // ignore: cast_nullable_to_non_nullable
as List<BancoQuestaoComAlternativas>,selecionadas: null == selecionadas ? _self.selecionadas : selecionadas // ignore: cast_nullable_to_non_nullable
as Set<int>,embaralharQuestoes: null == embaralharQuestoes ? _self.embaralharQuestoes : embaralharQuestoes // ignore: cast_nullable_to_non_nullable
as bool,embaralharAlternativas: null == embaralharAlternativas ? _self.embaralharAlternativas : embaralharAlternativas // ignore: cast_nullable_to_non_nullable
as bool,provaIdGerada: freezed == provaIdGerada ? _self.provaIdGerada : provaIdGerada // ignore: cast_nullable_to_non_nullable
as int?,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GerarProvaUiState].
extension GerarProvaUiStatePatterns on GerarProvaUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GerarProvaUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GerarProvaUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GerarProvaUiState value)  $default,){
final _that = this;
switch (_that) {
case _GerarProvaUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GerarProvaUiState value)?  $default,){
final _that = this;
switch (_that) {
case _GerarProvaUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool carregando,  bool gerando,  String titulo,  String descricao,  String? disciplina,  String? turma,  List<DisciplinaEntity> disciplinas,  List<TurmaEntity> turmas,  List<BancoQuestaoComAlternativas> bancoQuestoes,  Set<int> selecionadas,  bool embaralharQuestoes,  bool embaralharAlternativas,  int? provaIdGerada,  String? erro)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GerarProvaUiState() when $default != null:
return $default(_that.carregando,_that.gerando,_that.titulo,_that.descricao,_that.disciplina,_that.turma,_that.disciplinas,_that.turmas,_that.bancoQuestoes,_that.selecionadas,_that.embaralharQuestoes,_that.embaralharAlternativas,_that.provaIdGerada,_that.erro);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool carregando,  bool gerando,  String titulo,  String descricao,  String? disciplina,  String? turma,  List<DisciplinaEntity> disciplinas,  List<TurmaEntity> turmas,  List<BancoQuestaoComAlternativas> bancoQuestoes,  Set<int> selecionadas,  bool embaralharQuestoes,  bool embaralharAlternativas,  int? provaIdGerada,  String? erro)  $default,) {final _that = this;
switch (_that) {
case _GerarProvaUiState():
return $default(_that.carregando,_that.gerando,_that.titulo,_that.descricao,_that.disciplina,_that.turma,_that.disciplinas,_that.turmas,_that.bancoQuestoes,_that.selecionadas,_that.embaralharQuestoes,_that.embaralharAlternativas,_that.provaIdGerada,_that.erro);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool carregando,  bool gerando,  String titulo,  String descricao,  String? disciplina,  String? turma,  List<DisciplinaEntity> disciplinas,  List<TurmaEntity> turmas,  List<BancoQuestaoComAlternativas> bancoQuestoes,  Set<int> selecionadas,  bool embaralharQuestoes,  bool embaralharAlternativas,  int? provaIdGerada,  String? erro)?  $default,) {final _that = this;
switch (_that) {
case _GerarProvaUiState() when $default != null:
return $default(_that.carregando,_that.gerando,_that.titulo,_that.descricao,_that.disciplina,_that.turma,_that.disciplinas,_that.turmas,_that.bancoQuestoes,_that.selecionadas,_that.embaralharQuestoes,_that.embaralharAlternativas,_that.provaIdGerada,_that.erro);case _:
  return null;

}
}

}

/// @nodoc


class _GerarProvaUiState extends GerarProvaUiState {
  const _GerarProvaUiState({this.carregando = true, this.gerando = false, this.titulo = '', this.descricao = '', this.disciplina, this.turma,  List<DisciplinaEntity> disciplinas = const [],  List<TurmaEntity> turmas = const [],  List<BancoQuestaoComAlternativas> bancoQuestoes = const [],  Set<int> selecionadas = const {}, this.embaralharQuestoes = true, this.embaralharAlternativas = true, this.provaIdGerada, this.erro}): _disciplinas = disciplinas,_turmas = turmas,_bancoQuestoes = bancoQuestoes,_selecionadas = selecionadas,super._();
  

@override@JsonKey() final  bool carregando;
@override@JsonKey() final  bool gerando;
@override@JsonKey() final  String titulo;
@override@JsonKey() final  String descricao;
@override final  String? disciplina;
@override final  String? turma;
 final  List<DisciplinaEntity> _disciplinas;
@override@JsonKey() List<DisciplinaEntity> get disciplinas {
  if (_disciplinas is EqualUnmodifiableListView) return _disciplinas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_disciplinas);
}

 final  List<TurmaEntity> _turmas;
@override@JsonKey() List<TurmaEntity> get turmas {
  if (_turmas is EqualUnmodifiableListView) return _turmas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_turmas);
}

 final  List<BancoQuestaoComAlternativas> _bancoQuestoes;
@override@JsonKey() List<BancoQuestaoComAlternativas> get bancoQuestoes {
  if (_bancoQuestoes is EqualUnmodifiableListView) return _bancoQuestoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bancoQuestoes);
}

 final  Set<int> _selecionadas;
@override@JsonKey() Set<int> get selecionadas {
  if (_selecionadas is EqualUnmodifiableSetView) return _selecionadas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selecionadas);
}

@override@JsonKey() final  bool embaralharQuestoes;
@override@JsonKey() final  bool embaralharAlternativas;
@override final  int? provaIdGerada;
@override final  String? erro;

/// Create a copy of GerarProvaUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GerarProvaUiStateCopyWith<_GerarProvaUiState> get copyWith => __$GerarProvaUiStateCopyWithImpl<_GerarProvaUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GerarProvaUiState&&(identical(other.carregando, carregando) || other.carregando == carregando)&&(identical(other.gerando, gerando) || other.gerando == gerando)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.disciplina, disciplina) || other.disciplina == disciplina)&&(identical(other.turma, turma) || other.turma == turma)&&const DeepCollectionEquality().equals(other.disciplinas, _disciplinas)&&const DeepCollectionEquality().equals(other.turmas, _turmas)&&const DeepCollectionEquality().equals(other.bancoQuestoes, _bancoQuestoes)&&const DeepCollectionEquality().equals(other.selecionadas, _selecionadas)&&(identical(other.embaralharQuestoes, embaralharQuestoes) || other.embaralharQuestoes == embaralharQuestoes)&&(identical(other.embaralharAlternativas, embaralharAlternativas) || other.embaralharAlternativas == embaralharAlternativas)&&(identical(other.provaIdGerada, provaIdGerada) || other.provaIdGerada == provaIdGerada)&&(identical(other.erro, erro) || other.erro == erro));
}


@override
int get hashCode {
    return Object.hash(runtimeType,carregando,gerando,titulo,descricao,disciplina,turma,const DeepCollectionEquality().hash(_disciplinas),const DeepCollectionEquality().hash(_turmas),const DeepCollectionEquality().hash(_bancoQuestoes),const DeepCollectionEquality().hash(_selecionadas),embaralharQuestoes,embaralharAlternativas,provaIdGerada,erro);
}

@override
String toString() {
    return 'GerarProvaUiState(carregando: $carregando, gerando: $gerando, titulo: $titulo, descricao: $descricao, disciplina: $disciplina, turma: $turma, disciplinas: $disciplinas, turmas: $turmas, bancoQuestoes: $bancoQuestoes, selecionadas: $selecionadas, embaralharQuestoes: $embaralharQuestoes, embaralharAlternativas: $embaralharAlternativas, provaIdGerada: $provaIdGerada, erro: $erro)';
}


}

/// @nodoc
abstract mixin class _$GerarProvaUiStateCopyWith<$Res> implements $GerarProvaUiStateCopyWith<$Res> {
  factory _$GerarProvaUiStateCopyWith(_GerarProvaUiState value, $Res Function(_GerarProvaUiState) _then) = __$GerarProvaUiStateCopyWithImpl;
@override @useResult
$Res call({
 bool carregando, bool gerando, String titulo, String descricao, String? disciplina, String? turma, List<DisciplinaEntity> disciplinas, List<TurmaEntity> turmas, List<BancoQuestaoComAlternativas> bancoQuestoes, Set<int> selecionadas, bool embaralharQuestoes, bool embaralharAlternativas, int? provaIdGerada, String? erro
});




}
/// @nodoc
class __$GerarProvaUiStateCopyWithImpl<$Res>
    implements _$GerarProvaUiStateCopyWith<$Res> {
  __$GerarProvaUiStateCopyWithImpl(this._self, this._then);

  final _GerarProvaUiState _self;
  final $Res Function(_GerarProvaUiState) _then;

/// Create a copy of GerarProvaUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? carregando = null,Object? gerando = null,Object? titulo = null,Object? descricao = null,Object? disciplina = freezed,Object? turma = freezed,Object? disciplinas = null,Object? turmas = null,Object? bancoQuestoes = null,Object? selecionadas = null,Object? embaralharQuestoes = null,Object? embaralharAlternativas = null,Object? provaIdGerada = freezed,Object? erro = freezed,}) {
  return _then(_GerarProvaUiState(
carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,gerando: null == gerando ? _self.gerando : gerando // ignore: cast_nullable_to_non_nullable
as bool,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,disciplina: freezed == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String?,turma: freezed == turma ? _self.turma : turma // ignore: cast_nullable_to_non_nullable
as String?,disciplinas: null == disciplinas ? _self._disciplinas : disciplinas // ignore: cast_nullable_to_non_nullable
as List<DisciplinaEntity>,turmas: null == turmas ? _self._turmas : turmas // ignore: cast_nullable_to_non_nullable
as List<TurmaEntity>,bancoQuestoes: null == bancoQuestoes ? _self._bancoQuestoes : bancoQuestoes // ignore: cast_nullable_to_non_nullable
as List<BancoQuestaoComAlternativas>,selecionadas: null == selecionadas ? _self._selecionadas : selecionadas // ignore: cast_nullable_to_non_nullable
as Set<int>,embaralharQuestoes: null == embaralharQuestoes ? _self.embaralharQuestoes : embaralharQuestoes // ignore: cast_nullable_to_non_nullable
as bool,embaralharAlternativas: null == embaralharAlternativas ? _self.embaralharAlternativas : embaralharAlternativas // ignore: cast_nullable_to_non_nullable
as bool,provaIdGerada: freezed == provaIdGerada ? _self.provaIdGerada : provaIdGerada // ignore: cast_nullable_to_non_nullable
as int?,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
