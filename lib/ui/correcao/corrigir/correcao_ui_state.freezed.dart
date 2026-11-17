// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'correcao_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProvaOpcao {

 int get provaId; String get titulo; String get disciplina; int get totalQuestoes;
/// Create a copy of ProvaOpcao
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProvaOpcaoCopyWith<ProvaOpcao> get copyWith => _$ProvaOpcaoCopyWithImpl<ProvaOpcao>(this as ProvaOpcao, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProvaOpcao;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProvaOpcao&&(identical(other.provaId, _this.provaId) || other.provaId == _this.provaId)&&(identical(other.titulo, _this.titulo) || other.titulo == _this.titulo)&&(identical(other.disciplina, _this.disciplina) || other.disciplina == _this.disciplina)&&(identical(other.totalQuestoes, _this.totalQuestoes) || other.totalQuestoes == _this.totalQuestoes));
}


@override
int get hashCode {
  final _this = this as ProvaOpcao;
  return Object.hash(runtimeType,_this.provaId,_this.titulo,_this.disciplina,_this.totalQuestoes);
}

@override
String toString() {
  final _this = this as ProvaOpcao;
  return 'ProvaOpcao(provaId: ${_this.provaId}, titulo: ${_this.titulo}, disciplina: ${_this.disciplina}, totalQuestoes: ${_this.totalQuestoes})';
}


}

/// @nodoc
abstract mixin class $ProvaOpcaoCopyWith<$Res>  {
  factory $ProvaOpcaoCopyWith(ProvaOpcao value, $Res Function(ProvaOpcao) _then) = _$ProvaOpcaoCopyWithImpl;
@useResult
$Res call({
 int provaId, String titulo, String disciplina, int totalQuestoes
});




}
/// @nodoc
class _$ProvaOpcaoCopyWithImpl<$Res>
    implements $ProvaOpcaoCopyWith<$Res> {
  _$ProvaOpcaoCopyWithImpl(this._self, this._then);

  final ProvaOpcao _self;
  final $Res Function(ProvaOpcao) _then;

/// Create a copy of ProvaOpcao
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provaId = null,Object? titulo = null,Object? disciplina = null,Object? totalQuestoes = null,}) {
  return _then(ProvaOpcao(
provaId: null == provaId ? _self.provaId : provaId // ignore: cast_nullable_to_non_nullable
as int,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,disciplina: null == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String,totalQuestoes: null == totalQuestoes ? _self.totalQuestoes : totalQuestoes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProvaOpcao].
extension ProvaOpcaoPatterns on ProvaOpcao {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProvaOpcao value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProvaOpcao() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProvaOpcao value)  $default,){
final _that = this;
switch (_that) {
case _ProvaOpcao():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProvaOpcao value)?  $default,){
final _that = this;
switch (_that) {
case _ProvaOpcao() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int provaId,  String titulo,  String disciplina,  int totalQuestoes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProvaOpcao() when $default != null:
return $default(_that.provaId,_that.titulo,_that.disciplina,_that.totalQuestoes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int provaId,  String titulo,  String disciplina,  int totalQuestoes)  $default,) {final _that = this;
switch (_that) {
case _ProvaOpcao():
return $default(_that.provaId,_that.titulo,_that.disciplina,_that.totalQuestoes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int provaId,  String titulo,  String disciplina,  int totalQuestoes)?  $default,) {final _that = this;
switch (_that) {
case _ProvaOpcao() when $default != null:
return $default(_that.provaId,_that.titulo,_that.disciplina,_that.totalQuestoes);case _:
  return null;

}
}

}

/// @nodoc


class _ProvaOpcao implements ProvaOpcao {
  const _ProvaOpcao({required this.provaId, required this.titulo, required this.disciplina, required this.totalQuestoes});
  

@override final  int provaId;
@override final  String titulo;
@override final  String disciplina;
@override final  int totalQuestoes;

/// Create a copy of ProvaOpcao
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProvaOpcaoCopyWith<_ProvaOpcao> get copyWith => __$ProvaOpcaoCopyWithImpl<_ProvaOpcao>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProvaOpcao&&(identical(other.provaId, provaId) || other.provaId == provaId)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.disciplina, disciplina) || other.disciplina == disciplina)&&(identical(other.totalQuestoes, totalQuestoes) || other.totalQuestoes == totalQuestoes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,provaId,titulo,disciplina,totalQuestoes);
}

@override
String toString() {
    return 'ProvaOpcao(provaId: $provaId, titulo: $titulo, disciplina: $disciplina, totalQuestoes: $totalQuestoes)';
}


}

/// @nodoc
abstract mixin class _$ProvaOpcaoCopyWith<$Res> implements $ProvaOpcaoCopyWith<$Res> {
  factory _$ProvaOpcaoCopyWith(_ProvaOpcao value, $Res Function(_ProvaOpcao) _then) = __$ProvaOpcaoCopyWithImpl;
@override @useResult
$Res call({
 int provaId, String titulo, String disciplina, int totalQuestoes
});




}
/// @nodoc
class __$ProvaOpcaoCopyWithImpl<$Res>
    implements _$ProvaOpcaoCopyWith<$Res> {
  __$ProvaOpcaoCopyWithImpl(this._self, this._then);

  final _ProvaOpcao _self;
  final $Res Function(_ProvaOpcao) _then;

/// Create a copy of ProvaOpcao
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provaId = null,Object? titulo = null,Object? disciplina = null,Object? totalQuestoes = null,}) {
  return _then(_ProvaOpcao(
provaId: null == provaId ? _self.provaId : provaId // ignore: cast_nullable_to_non_nullable
as int,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,disciplina: null == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String,totalQuestoes: null == totalQuestoes ? _self.totalQuestoes : totalQuestoes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CorrecaoQuestaoState {

 int get questaoId; int get numero; List<String> get letras; Set<String> get letrasMarcadas; bool get temGabarito;
/// Create a copy of CorrecaoQuestaoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CorrecaoQuestaoStateCopyWith<CorrecaoQuestaoState> get copyWith => _$CorrecaoQuestaoStateCopyWithImpl<CorrecaoQuestaoState>(this as CorrecaoQuestaoState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CorrecaoQuestaoState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CorrecaoQuestaoState&&(identical(other.questaoId, _this.questaoId) || other.questaoId == _this.questaoId)&&(identical(other.numero, _this.numero) || other.numero == _this.numero)&&const DeepCollectionEquality().equals(other.letras, _this.letras)&&const DeepCollectionEquality().equals(other.letrasMarcadas, _this.letrasMarcadas)&&(identical(other.temGabarito, _this.temGabarito) || other.temGabarito == _this.temGabarito));
}


@override
int get hashCode {
  final _this = this as CorrecaoQuestaoState;
  return Object.hash(runtimeType,_this.questaoId,_this.numero,const DeepCollectionEquality().hash(_this.letras),const DeepCollectionEquality().hash(_this.letrasMarcadas),_this.temGabarito);
}

@override
String toString() {
  final _this = this as CorrecaoQuestaoState;
  return 'CorrecaoQuestaoState(questaoId: ${_this.questaoId}, numero: ${_this.numero}, letras: ${_this.letras}, letrasMarcadas: ${_this.letrasMarcadas}, temGabarito: ${_this.temGabarito})';
}


}

/// @nodoc
abstract mixin class $CorrecaoQuestaoStateCopyWith<$Res>  {
  factory $CorrecaoQuestaoStateCopyWith(CorrecaoQuestaoState value, $Res Function(CorrecaoQuestaoState) _then) = _$CorrecaoQuestaoStateCopyWithImpl;
@useResult
$Res call({
 int questaoId, int numero, List<String> letras, Set<String> letrasMarcadas, bool temGabarito
});




}
/// @nodoc
class _$CorrecaoQuestaoStateCopyWithImpl<$Res>
    implements $CorrecaoQuestaoStateCopyWith<$Res> {
  _$CorrecaoQuestaoStateCopyWithImpl(this._self, this._then);

  final CorrecaoQuestaoState _self;
  final $Res Function(CorrecaoQuestaoState) _then;

/// Create a copy of CorrecaoQuestaoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questaoId = null,Object? numero = null,Object? letras = null,Object? letrasMarcadas = null,Object? temGabarito = null,}) {
  return _then(CorrecaoQuestaoState(
questaoId: null == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int,numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,letras: null == letras ? _self.letras : letras // ignore: cast_nullable_to_non_nullable
as List<String>,letrasMarcadas: null == letrasMarcadas ? _self.letrasMarcadas : letrasMarcadas // ignore: cast_nullable_to_non_nullable
as Set<String>,temGabarito: null == temGabarito ? _self.temGabarito : temGabarito // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CorrecaoQuestaoState].
extension CorrecaoQuestaoStatePatterns on CorrecaoQuestaoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CorrecaoQuestaoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CorrecaoQuestaoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CorrecaoQuestaoState value)  $default,){
final _that = this;
switch (_that) {
case _CorrecaoQuestaoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CorrecaoQuestaoState value)?  $default,){
final _that = this;
switch (_that) {
case _CorrecaoQuestaoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int questaoId,  int numero,  List<String> letras,  Set<String> letrasMarcadas,  bool temGabarito)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CorrecaoQuestaoState() when $default != null:
return $default(_that.questaoId,_that.numero,_that.letras,_that.letrasMarcadas,_that.temGabarito);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int questaoId,  int numero,  List<String> letras,  Set<String> letrasMarcadas,  bool temGabarito)  $default,) {final _that = this;
switch (_that) {
case _CorrecaoQuestaoState():
return $default(_that.questaoId,_that.numero,_that.letras,_that.letrasMarcadas,_that.temGabarito);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int questaoId,  int numero,  List<String> letras,  Set<String> letrasMarcadas,  bool temGabarito)?  $default,) {final _that = this;
switch (_that) {
case _CorrecaoQuestaoState() when $default != null:
return $default(_that.questaoId,_that.numero,_that.letras,_that.letrasMarcadas,_that.temGabarito);case _:
  return null;

}
}

}

/// @nodoc


class _CorrecaoQuestaoState implements CorrecaoQuestaoState {
  const _CorrecaoQuestaoState({required this.questaoId, required this.numero, required  List<String> letras,  Set<String> letrasMarcadas = const {}, required this.temGabarito}): _letras = letras,_letrasMarcadas = letrasMarcadas;
  

@override final  int questaoId;
@override final  int numero;
 final  List<String> _letras;
@override List<String> get letras {
  if (_letras is EqualUnmodifiableListView) return _letras;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_letras);
}

 final  Set<String> _letrasMarcadas;
@override@JsonKey() Set<String> get letrasMarcadas {
  if (_letrasMarcadas is EqualUnmodifiableSetView) return _letrasMarcadas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_letrasMarcadas);
}

@override final  bool temGabarito;

/// Create a copy of CorrecaoQuestaoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CorrecaoQuestaoStateCopyWith<_CorrecaoQuestaoState> get copyWith => __$CorrecaoQuestaoStateCopyWithImpl<_CorrecaoQuestaoState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CorrecaoQuestaoState&&(identical(other.questaoId, questaoId) || other.questaoId == questaoId)&&(identical(other.numero, numero) || other.numero == numero)&&const DeepCollectionEquality().equals(other.letras, _letras)&&const DeepCollectionEquality().equals(other.letrasMarcadas, _letrasMarcadas)&&(identical(other.temGabarito, temGabarito) || other.temGabarito == temGabarito));
}


@override
int get hashCode {
    return Object.hash(runtimeType,questaoId,numero,const DeepCollectionEquality().hash(_letras),const DeepCollectionEquality().hash(_letrasMarcadas),temGabarito);
}

@override
String toString() {
    return 'CorrecaoQuestaoState(questaoId: $questaoId, numero: $numero, letras: $letras, letrasMarcadas: $letrasMarcadas, temGabarito: $temGabarito)';
}


}

/// @nodoc
abstract mixin class _$CorrecaoQuestaoStateCopyWith<$Res> implements $CorrecaoQuestaoStateCopyWith<$Res> {
  factory _$CorrecaoQuestaoStateCopyWith(_CorrecaoQuestaoState value, $Res Function(_CorrecaoQuestaoState) _then) = __$CorrecaoQuestaoStateCopyWithImpl;
@override @useResult
$Res call({
 int questaoId, int numero, List<String> letras, Set<String> letrasMarcadas, bool temGabarito
});




}
/// @nodoc
class __$CorrecaoQuestaoStateCopyWithImpl<$Res>
    implements _$CorrecaoQuestaoStateCopyWith<$Res> {
  __$CorrecaoQuestaoStateCopyWithImpl(this._self, this._then);

  final _CorrecaoQuestaoState _self;
  final $Res Function(_CorrecaoQuestaoState) _then;

/// Create a copy of CorrecaoQuestaoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questaoId = null,Object? numero = null,Object? letras = null,Object? letrasMarcadas = null,Object? temGabarito = null,}) {
  return _then(_CorrecaoQuestaoState(
questaoId: null == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int,numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,letras: null == letras ? _self._letras : letras // ignore: cast_nullable_to_non_nullable
as List<String>,letrasMarcadas: null == letrasMarcadas ? _self._letrasMarcadas : letrasMarcadas // ignore: cast_nullable_to_non_nullable
as Set<String>,temGabarito: null == temGabarito ? _self.temGabarito : temGabarito // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$CorrecaoUiState {

 List<ProvaOpcao> get provas; int? get provaSelecionadaId; String get nomeAluno; String get turma; List<CorrecaoQuestaoState> get questoes; bool get carregando; bool get corrigindo; String? get erro; int? get resultadoId; ConfirmacaoCorrecao? get confirmacao;
/// Create a copy of CorrecaoUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CorrecaoUiStateCopyWith<CorrecaoUiState> get copyWith => _$CorrecaoUiStateCopyWithImpl<CorrecaoUiState>(this as CorrecaoUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CorrecaoUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CorrecaoUiState&&const DeepCollectionEquality().equals(other.provas, _this.provas)&&(identical(other.provaSelecionadaId, _this.provaSelecionadaId) || other.provaSelecionadaId == _this.provaSelecionadaId)&&(identical(other.nomeAluno, _this.nomeAluno) || other.nomeAluno == _this.nomeAluno)&&(identical(other.turma, _this.turma) || other.turma == _this.turma)&&const DeepCollectionEquality().equals(other.questoes, _this.questoes)&&(identical(other.carregando, _this.carregando) || other.carregando == _this.carregando)&&(identical(other.corrigindo, _this.corrigindo) || other.corrigindo == _this.corrigindo)&&(identical(other.erro, _this.erro) || other.erro == _this.erro)&&(identical(other.resultadoId, _this.resultadoId) || other.resultadoId == _this.resultadoId)&&(identical(other.confirmacao, _this.confirmacao) || other.confirmacao == _this.confirmacao));
}


@override
int get hashCode {
  final _this = this as CorrecaoUiState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.provas),_this.provaSelecionadaId,_this.nomeAluno,_this.turma,const DeepCollectionEquality().hash(_this.questoes),_this.carregando,_this.corrigindo,_this.erro,_this.resultadoId,_this.confirmacao);
}

@override
String toString() {
  final _this = this as CorrecaoUiState;
  return 'CorrecaoUiState(provas: ${_this.provas}, provaSelecionadaId: ${_this.provaSelecionadaId}, nomeAluno: ${_this.nomeAluno}, turma: ${_this.turma}, questoes: ${_this.questoes}, carregando: ${_this.carregando}, corrigindo: ${_this.corrigindo}, erro: ${_this.erro}, resultadoId: ${_this.resultadoId}, confirmacao: ${_this.confirmacao})';
}


}

/// @nodoc
abstract mixin class $CorrecaoUiStateCopyWith<$Res>  {
  factory $CorrecaoUiStateCopyWith(CorrecaoUiState value, $Res Function(CorrecaoUiState) _then) = _$CorrecaoUiStateCopyWithImpl;
@useResult
$Res call({
 List<ProvaOpcao> provas, int? provaSelecionadaId, String nomeAluno, String turma, List<CorrecaoQuestaoState> questoes, bool carregando, bool corrigindo, String? erro, int? resultadoId, ConfirmacaoCorrecao? confirmacao
});


$ConfirmacaoCorrecaoCopyWith<$Res>? get confirmacao;

}
/// @nodoc
class _$CorrecaoUiStateCopyWithImpl<$Res>
    implements $CorrecaoUiStateCopyWith<$Res> {
  _$CorrecaoUiStateCopyWithImpl(this._self, this._then);

  final CorrecaoUiState _self;
  final $Res Function(CorrecaoUiState) _then;

/// Create a copy of CorrecaoUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provas = null,Object? provaSelecionadaId = freezed,Object? nomeAluno = null,Object? turma = null,Object? questoes = null,Object? carregando = null,Object? corrigindo = null,Object? erro = freezed,Object? resultadoId = freezed,Object? confirmacao = freezed,}) {
  return _then(CorrecaoUiState(
provas: null == provas ? _self.provas : provas // ignore: cast_nullable_to_non_nullable
as List<ProvaOpcao>,provaSelecionadaId: freezed == provaSelecionadaId ? _self.provaSelecionadaId : provaSelecionadaId // ignore: cast_nullable_to_non_nullable
as int?,nomeAluno: null == nomeAluno ? _self.nomeAluno : nomeAluno // ignore: cast_nullable_to_non_nullable
as String,turma: null == turma ? _self.turma : turma // ignore: cast_nullable_to_non_nullable
as String,questoes: null == questoes ? _self.questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<CorrecaoQuestaoState>,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,corrigindo: null == corrigindo ? _self.corrigindo : corrigindo // ignore: cast_nullable_to_non_nullable
as bool,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,resultadoId: freezed == resultadoId ? _self.resultadoId : resultadoId // ignore: cast_nullable_to_non_nullable
as int?,confirmacao: freezed == confirmacao ? _self.confirmacao : confirmacao // ignore: cast_nullable_to_non_nullable
as ConfirmacaoCorrecao?,
  ));
}
/// Create a copy of CorrecaoUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfirmacaoCorrecaoCopyWith<$Res>? get confirmacao {
    if (_self.confirmacao == null) {
    return null;
  }

  return $ConfirmacaoCorrecaoCopyWith<$Res>(_self.confirmacao!, (value) {
    return _then(_self.copyWith(confirmacao: value));
  });
}
}


/// Adds pattern-matching-related methods to [CorrecaoUiState].
extension CorrecaoUiStatePatterns on CorrecaoUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CorrecaoUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CorrecaoUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CorrecaoUiState value)  $default,){
final _that = this;
switch (_that) {
case _CorrecaoUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CorrecaoUiState value)?  $default,){
final _that = this;
switch (_that) {
case _CorrecaoUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProvaOpcao> provas,  int? provaSelecionadaId,  String nomeAluno,  String turma,  List<CorrecaoQuestaoState> questoes,  bool carregando,  bool corrigindo,  String? erro,  int? resultadoId,  ConfirmacaoCorrecao? confirmacao)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CorrecaoUiState() when $default != null:
return $default(_that.provas,_that.provaSelecionadaId,_that.nomeAluno,_that.turma,_that.questoes,_that.carregando,_that.corrigindo,_that.erro,_that.resultadoId,_that.confirmacao);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProvaOpcao> provas,  int? provaSelecionadaId,  String nomeAluno,  String turma,  List<CorrecaoQuestaoState> questoes,  bool carregando,  bool corrigindo,  String? erro,  int? resultadoId,  ConfirmacaoCorrecao? confirmacao)  $default,) {final _that = this;
switch (_that) {
case _CorrecaoUiState():
return $default(_that.provas,_that.provaSelecionadaId,_that.nomeAluno,_that.turma,_that.questoes,_that.carregando,_that.corrigindo,_that.erro,_that.resultadoId,_that.confirmacao);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProvaOpcao> provas,  int? provaSelecionadaId,  String nomeAluno,  String turma,  List<CorrecaoQuestaoState> questoes,  bool carregando,  bool corrigindo,  String? erro,  int? resultadoId,  ConfirmacaoCorrecao? confirmacao)?  $default,) {final _that = this;
switch (_that) {
case _CorrecaoUiState() when $default != null:
return $default(_that.provas,_that.provaSelecionadaId,_that.nomeAluno,_that.turma,_that.questoes,_that.carregando,_that.corrigindo,_that.erro,_that.resultadoId,_that.confirmacao);case _:
  return null;

}
}

}

/// @nodoc


class _CorrecaoUiState extends CorrecaoUiState {
  const _CorrecaoUiState({ List<ProvaOpcao> provas = const [], this.provaSelecionadaId, this.nomeAluno = '', this.turma = '',  List<CorrecaoQuestaoState> questoes = const [], this.carregando = true, this.corrigindo = false, this.erro, this.resultadoId, this.confirmacao}): _provas = provas,_questoes = questoes,super._();
  

 final  List<ProvaOpcao> _provas;
@override@JsonKey() List<ProvaOpcao> get provas {
  if (_provas is EqualUnmodifiableListView) return _provas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_provas);
}

@override final  int? provaSelecionadaId;
@override@JsonKey() final  String nomeAluno;
@override@JsonKey() final  String turma;
 final  List<CorrecaoQuestaoState> _questoes;
@override@JsonKey() List<CorrecaoQuestaoState> get questoes {
  if (_questoes is EqualUnmodifiableListView) return _questoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questoes);
}

@override@JsonKey() final  bool carregando;
@override@JsonKey() final  bool corrigindo;
@override final  String? erro;
@override final  int? resultadoId;
@override final  ConfirmacaoCorrecao? confirmacao;

/// Create a copy of CorrecaoUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CorrecaoUiStateCopyWith<_CorrecaoUiState> get copyWith => __$CorrecaoUiStateCopyWithImpl<_CorrecaoUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CorrecaoUiState&&const DeepCollectionEquality().equals(other.provas, _provas)&&(identical(other.provaSelecionadaId, provaSelecionadaId) || other.provaSelecionadaId == provaSelecionadaId)&&(identical(other.nomeAluno, nomeAluno) || other.nomeAluno == nomeAluno)&&(identical(other.turma, turma) || other.turma == turma)&&const DeepCollectionEquality().equals(other.questoes, _questoes)&&(identical(other.carregando, carregando) || other.carregando == carregando)&&(identical(other.corrigindo, corrigindo) || other.corrigindo == corrigindo)&&(identical(other.erro, erro) || other.erro == erro)&&(identical(other.resultadoId, resultadoId) || other.resultadoId == resultadoId)&&(identical(other.confirmacao, confirmacao) || other.confirmacao == confirmacao));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_provas),provaSelecionadaId,nomeAluno,turma,const DeepCollectionEquality().hash(_questoes),carregando,corrigindo,erro,resultadoId,confirmacao);
}

@override
String toString() {
    return 'CorrecaoUiState(provas: $provas, provaSelecionadaId: $provaSelecionadaId, nomeAluno: $nomeAluno, turma: $turma, questoes: $questoes, carregando: $carregando, corrigindo: $corrigindo, erro: $erro, resultadoId: $resultadoId, confirmacao: $confirmacao)';
}


}

/// @nodoc
abstract mixin class _$CorrecaoUiStateCopyWith<$Res> implements $CorrecaoUiStateCopyWith<$Res> {
  factory _$CorrecaoUiStateCopyWith(_CorrecaoUiState value, $Res Function(_CorrecaoUiState) _then) = __$CorrecaoUiStateCopyWithImpl;
@override @useResult
$Res call({
 List<ProvaOpcao> provas, int? provaSelecionadaId, String nomeAluno, String turma, List<CorrecaoQuestaoState> questoes, bool carregando, bool corrigindo, String? erro, int? resultadoId, ConfirmacaoCorrecao? confirmacao
});


@override $ConfirmacaoCorrecaoCopyWith<$Res>? get confirmacao;

}
/// @nodoc
class __$CorrecaoUiStateCopyWithImpl<$Res>
    implements _$CorrecaoUiStateCopyWith<$Res> {
  __$CorrecaoUiStateCopyWithImpl(this._self, this._then);

  final _CorrecaoUiState _self;
  final $Res Function(_CorrecaoUiState) _then;

/// Create a copy of CorrecaoUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provas = null,Object? provaSelecionadaId = freezed,Object? nomeAluno = null,Object? turma = null,Object? questoes = null,Object? carregando = null,Object? corrigindo = null,Object? erro = freezed,Object? resultadoId = freezed,Object? confirmacao = freezed,}) {
  return _then(_CorrecaoUiState(
provas: null == provas ? _self._provas : provas // ignore: cast_nullable_to_non_nullable
as List<ProvaOpcao>,provaSelecionadaId: freezed == provaSelecionadaId ? _self.provaSelecionadaId : provaSelecionadaId // ignore: cast_nullable_to_non_nullable
as int?,nomeAluno: null == nomeAluno ? _self.nomeAluno : nomeAluno // ignore: cast_nullable_to_non_nullable
as String,turma: null == turma ? _self.turma : turma // ignore: cast_nullable_to_non_nullable
as String,questoes: null == questoes ? _self._questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<CorrecaoQuestaoState>,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,corrigindo: null == corrigindo ? _self.corrigindo : corrigindo // ignore: cast_nullable_to_non_nullable
as bool,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,resultadoId: freezed == resultadoId ? _self.resultadoId : resultadoId // ignore: cast_nullable_to_non_nullable
as int?,confirmacao: freezed == confirmacao ? _self.confirmacao : confirmacao // ignore: cast_nullable_to_non_nullable
as ConfirmacaoCorrecao?,
  ));
}

/// Create a copy of CorrecaoUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfirmacaoCorrecaoCopyWith<$Res>? get confirmacao {
    if (_self.confirmacao == null) {
    return null;
  }

  return $ConfirmacaoCorrecaoCopyWith<$Res>(_self.confirmacao!, (value) {
    return _then(_self.copyWith(confirmacao: value));
  });
}
}

/// @nodoc
mixin _$ConfirmacaoCorrecao {

 List<int> get emBranco; List<int> get marcacaoMultipla;
/// Create a copy of ConfirmacaoCorrecao
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmacaoCorrecaoCopyWith<ConfirmacaoCorrecao> get copyWith => _$ConfirmacaoCorrecaoCopyWithImpl<ConfirmacaoCorrecao>(this as ConfirmacaoCorrecao, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ConfirmacaoCorrecao;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmacaoCorrecao&&const DeepCollectionEquality().equals(other.emBranco, _this.emBranco)&&const DeepCollectionEquality().equals(other.marcacaoMultipla, _this.marcacaoMultipla));
}


@override
int get hashCode {
  final _this = this as ConfirmacaoCorrecao;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.emBranco),const DeepCollectionEquality().hash(_this.marcacaoMultipla));
}

@override
String toString() {
  final _this = this as ConfirmacaoCorrecao;
  return 'ConfirmacaoCorrecao(emBranco: ${_this.emBranco}, marcacaoMultipla: ${_this.marcacaoMultipla})';
}


}

/// @nodoc
abstract mixin class $ConfirmacaoCorrecaoCopyWith<$Res>  {
  factory $ConfirmacaoCorrecaoCopyWith(ConfirmacaoCorrecao value, $Res Function(ConfirmacaoCorrecao) _then) = _$ConfirmacaoCorrecaoCopyWithImpl;
@useResult
$Res call({
 List<int> emBranco, List<int> marcacaoMultipla
});




}
/// @nodoc
class _$ConfirmacaoCorrecaoCopyWithImpl<$Res>
    implements $ConfirmacaoCorrecaoCopyWith<$Res> {
  _$ConfirmacaoCorrecaoCopyWithImpl(this._self, this._then);

  final ConfirmacaoCorrecao _self;
  final $Res Function(ConfirmacaoCorrecao) _then;

/// Create a copy of ConfirmacaoCorrecao
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? emBranco = null,Object? marcacaoMultipla = null,}) {
  return _then(ConfirmacaoCorrecao(
emBranco: null == emBranco ? _self.emBranco : emBranco // ignore: cast_nullable_to_non_nullable
as List<int>,marcacaoMultipla: null == marcacaoMultipla ? _self.marcacaoMultipla : marcacaoMultipla // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfirmacaoCorrecao].
extension ConfirmacaoCorrecaoPatterns on ConfirmacaoCorrecao {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfirmacaoCorrecao value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfirmacaoCorrecao() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfirmacaoCorrecao value)  $default,){
final _that = this;
switch (_that) {
case _ConfirmacaoCorrecao():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfirmacaoCorrecao value)?  $default,){
final _that = this;
switch (_that) {
case _ConfirmacaoCorrecao() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> emBranco,  List<int> marcacaoMultipla)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfirmacaoCorrecao() when $default != null:
return $default(_that.emBranco,_that.marcacaoMultipla);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> emBranco,  List<int> marcacaoMultipla)  $default,) {final _that = this;
switch (_that) {
case _ConfirmacaoCorrecao():
return $default(_that.emBranco,_that.marcacaoMultipla);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> emBranco,  List<int> marcacaoMultipla)?  $default,) {final _that = this;
switch (_that) {
case _ConfirmacaoCorrecao() when $default != null:
return $default(_that.emBranco,_that.marcacaoMultipla);case _:
  return null;

}
}

}

/// @nodoc


class _ConfirmacaoCorrecao implements ConfirmacaoCorrecao {
  const _ConfirmacaoCorrecao({required  List<int> emBranco, required  List<int> marcacaoMultipla}): _emBranco = emBranco,_marcacaoMultipla = marcacaoMultipla;
  

 final  List<int> _emBranco;
@override List<int> get emBranco {
  if (_emBranco is EqualUnmodifiableListView) return _emBranco;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_emBranco);
}

 final  List<int> _marcacaoMultipla;
@override List<int> get marcacaoMultipla {
  if (_marcacaoMultipla is EqualUnmodifiableListView) return _marcacaoMultipla;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_marcacaoMultipla);
}


/// Create a copy of ConfirmacaoCorrecao
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmacaoCorrecaoCopyWith<_ConfirmacaoCorrecao> get copyWith => __$ConfirmacaoCorrecaoCopyWithImpl<_ConfirmacaoCorrecao>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmacaoCorrecao&&const DeepCollectionEquality().equals(other.emBranco, _emBranco)&&const DeepCollectionEquality().equals(other.marcacaoMultipla, _marcacaoMultipla));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_emBranco),const DeepCollectionEquality().hash(_marcacaoMultipla));
}

@override
String toString() {
    return 'ConfirmacaoCorrecao(emBranco: $emBranco, marcacaoMultipla: $marcacaoMultipla)';
}


}

/// @nodoc
abstract mixin class _$ConfirmacaoCorrecaoCopyWith<$Res> implements $ConfirmacaoCorrecaoCopyWith<$Res> {
  factory _$ConfirmacaoCorrecaoCopyWith(_ConfirmacaoCorrecao value, $Res Function(_ConfirmacaoCorrecao) _then) = __$ConfirmacaoCorrecaoCopyWithImpl;
@override @useResult
$Res call({
 List<int> emBranco, List<int> marcacaoMultipla
});




}
/// @nodoc
class __$ConfirmacaoCorrecaoCopyWithImpl<$Res>
    implements _$ConfirmacaoCorrecaoCopyWith<$Res> {
  __$ConfirmacaoCorrecaoCopyWithImpl(this._self, this._then);

  final _ConfirmacaoCorrecao _self;
  final $Res Function(_ConfirmacaoCorrecao) _then;

/// Create a copy of ConfirmacaoCorrecao
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emBranco = null,Object? marcacaoMultipla = null,}) {
  return _then(_ConfirmacaoCorrecao(
emBranco: null == emBranco ? _self._emBranco : emBranco // ignore: cast_nullable_to_non_nullable
as List<int>,marcacaoMultipla: null == marcacaoMultipla ? _self._marcacaoMultipla : marcacaoMultipla // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
