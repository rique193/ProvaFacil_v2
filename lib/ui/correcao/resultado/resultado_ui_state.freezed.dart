// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resultado_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlternativaResultadoState {

 String get letra; String get texto;
/// Create a copy of AlternativaResultadoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlternativaResultadoStateCopyWith<AlternativaResultadoState> get copyWith => _$AlternativaResultadoStateCopyWithImpl<AlternativaResultadoState>(this as AlternativaResultadoState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AlternativaResultadoState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlternativaResultadoState&&(identical(other.letra, _this.letra) || other.letra == _this.letra)&&(identical(other.texto, _this.texto) || other.texto == _this.texto));
}


@override
int get hashCode {
  final _this = this as AlternativaResultadoState;
  return Object.hash(runtimeType,_this.letra,_this.texto);
}

@override
String toString() {
  final _this = this as AlternativaResultadoState;
  return 'AlternativaResultadoState(letra: ${_this.letra}, texto: ${_this.texto})';
}


}

/// @nodoc
abstract mixin class $AlternativaResultadoStateCopyWith<$Res>  {
  factory $AlternativaResultadoStateCopyWith(AlternativaResultadoState value, $Res Function(AlternativaResultadoState) _then) = _$AlternativaResultadoStateCopyWithImpl;
@useResult
$Res call({
 String letra, String texto
});




}
/// @nodoc
class _$AlternativaResultadoStateCopyWithImpl<$Res>
    implements $AlternativaResultadoStateCopyWith<$Res> {
  _$AlternativaResultadoStateCopyWithImpl(this._self, this._then);

  final AlternativaResultadoState _self;
  final $Res Function(AlternativaResultadoState) _then;

/// Create a copy of AlternativaResultadoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? letra = null,Object? texto = null,}) {
  return _then(AlternativaResultadoState(
letra: null == letra ? _self.letra : letra // ignore: cast_nullable_to_non_nullable
as String,texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AlternativaResultadoState].
extension AlternativaResultadoStatePatterns on AlternativaResultadoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlternativaResultadoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlternativaResultadoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlternativaResultadoState value)  $default,){
final _that = this;
switch (_that) {
case _AlternativaResultadoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlternativaResultadoState value)?  $default,){
final _that = this;
switch (_that) {
case _AlternativaResultadoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String letra,  String texto)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlternativaResultadoState() when $default != null:
return $default(_that.letra,_that.texto);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String letra,  String texto)  $default,) {final _that = this;
switch (_that) {
case _AlternativaResultadoState():
return $default(_that.letra,_that.texto);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String letra,  String texto)?  $default,) {final _that = this;
switch (_that) {
case _AlternativaResultadoState() when $default != null:
return $default(_that.letra,_that.texto);case _:
  return null;

}
}

}

/// @nodoc


class _AlternativaResultadoState implements AlternativaResultadoState {
  const _AlternativaResultadoState({required this.letra, required this.texto});
  

@override final  String letra;
@override final  String texto;

/// Create a copy of AlternativaResultadoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlternativaResultadoStateCopyWith<_AlternativaResultadoState> get copyWith => __$AlternativaResultadoStateCopyWithImpl<_AlternativaResultadoState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlternativaResultadoState&&(identical(other.letra, letra) || other.letra == letra)&&(identical(other.texto, texto) || other.texto == texto));
}


@override
int get hashCode {
    return Object.hash(runtimeType,letra,texto);
}

@override
String toString() {
    return 'AlternativaResultadoState(letra: $letra, texto: $texto)';
}


}

/// @nodoc
abstract mixin class _$AlternativaResultadoStateCopyWith<$Res> implements $AlternativaResultadoStateCopyWith<$Res> {
  factory _$AlternativaResultadoStateCopyWith(_AlternativaResultadoState value, $Res Function(_AlternativaResultadoState) _then) = __$AlternativaResultadoStateCopyWithImpl;
@override @useResult
$Res call({
 String letra, String texto
});




}
/// @nodoc
class __$AlternativaResultadoStateCopyWithImpl<$Res>
    implements _$AlternativaResultadoStateCopyWith<$Res> {
  __$AlternativaResultadoStateCopyWithImpl(this._self, this._then);

  final _AlternativaResultadoState _self;
  final $Res Function(_AlternativaResultadoState) _then;

/// Create a copy of AlternativaResultadoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? letra = null,Object? texto = null,}) {
  return _then(_AlternativaResultadoState(
letra: null == letra ? _self.letra : letra // ignore: cast_nullable_to_non_nullable
as String,texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ResultadoQuestaoState {

 int get numero; String get enunciado; List<AlternativaResultadoState> get alternativas; Set<String> get letrasMarcadas; String get letraCorreta; SituacaoQuestao get situacao;
/// Create a copy of ResultadoQuestaoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultadoQuestaoStateCopyWith<ResultadoQuestaoState> get copyWith => _$ResultadoQuestaoStateCopyWithImpl<ResultadoQuestaoState>(this as ResultadoQuestaoState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ResultadoQuestaoState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultadoQuestaoState&&(identical(other.numero, _this.numero) || other.numero == _this.numero)&&(identical(other.enunciado, _this.enunciado) || other.enunciado == _this.enunciado)&&const DeepCollectionEquality().equals(other.alternativas, _this.alternativas)&&const DeepCollectionEquality().equals(other.letrasMarcadas, _this.letrasMarcadas)&&(identical(other.letraCorreta, _this.letraCorreta) || other.letraCorreta == _this.letraCorreta)&&(identical(other.situacao, _this.situacao) || other.situacao == _this.situacao));
}


@override
int get hashCode {
  final _this = this as ResultadoQuestaoState;
  return Object.hash(runtimeType,_this.numero,_this.enunciado,const DeepCollectionEquality().hash(_this.alternativas),const DeepCollectionEquality().hash(_this.letrasMarcadas),_this.letraCorreta,_this.situacao);
}

@override
String toString() {
  final _this = this as ResultadoQuestaoState;
  return 'ResultadoQuestaoState(numero: ${_this.numero}, enunciado: ${_this.enunciado}, alternativas: ${_this.alternativas}, letrasMarcadas: ${_this.letrasMarcadas}, letraCorreta: ${_this.letraCorreta}, situacao: ${_this.situacao})';
}


}

/// @nodoc
abstract mixin class $ResultadoQuestaoStateCopyWith<$Res>  {
  factory $ResultadoQuestaoStateCopyWith(ResultadoQuestaoState value, $Res Function(ResultadoQuestaoState) _then) = _$ResultadoQuestaoStateCopyWithImpl;
@useResult
$Res call({
 int numero, String enunciado, List<AlternativaResultadoState> alternativas, Set<String> letrasMarcadas, String letraCorreta, SituacaoQuestao situacao
});




}
/// @nodoc
class _$ResultadoQuestaoStateCopyWithImpl<$Res>
    implements $ResultadoQuestaoStateCopyWith<$Res> {
  _$ResultadoQuestaoStateCopyWithImpl(this._self, this._then);

  final ResultadoQuestaoState _self;
  final $Res Function(ResultadoQuestaoState) _then;

/// Create a copy of ResultadoQuestaoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? numero = null,Object? enunciado = null,Object? alternativas = null,Object? letrasMarcadas = null,Object? letraCorreta = null,Object? situacao = null,}) {
  return _then(ResultadoQuestaoState(
numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,enunciado: null == enunciado ? _self.enunciado : enunciado // ignore: cast_nullable_to_non_nullable
as String,alternativas: null == alternativas ? _self.alternativas : alternativas // ignore: cast_nullable_to_non_nullable
as List<AlternativaResultadoState>,letrasMarcadas: null == letrasMarcadas ? _self.letrasMarcadas : letrasMarcadas // ignore: cast_nullable_to_non_nullable
as Set<String>,letraCorreta: null == letraCorreta ? _self.letraCorreta : letraCorreta // ignore: cast_nullable_to_non_nullable
as String,situacao: null == situacao ? _self.situacao : situacao // ignore: cast_nullable_to_non_nullable
as SituacaoQuestao,
  ));
}

}


/// Adds pattern-matching-related methods to [ResultadoQuestaoState].
extension ResultadoQuestaoStatePatterns on ResultadoQuestaoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultadoQuestaoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultadoQuestaoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultadoQuestaoState value)  $default,){
final _that = this;
switch (_that) {
case _ResultadoQuestaoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultadoQuestaoState value)?  $default,){
final _that = this;
switch (_that) {
case _ResultadoQuestaoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int numero,  String enunciado,  List<AlternativaResultadoState> alternativas,  Set<String> letrasMarcadas,  String letraCorreta,  SituacaoQuestao situacao)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultadoQuestaoState() when $default != null:
return $default(_that.numero,_that.enunciado,_that.alternativas,_that.letrasMarcadas,_that.letraCorreta,_that.situacao);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int numero,  String enunciado,  List<AlternativaResultadoState> alternativas,  Set<String> letrasMarcadas,  String letraCorreta,  SituacaoQuestao situacao)  $default,) {final _that = this;
switch (_that) {
case _ResultadoQuestaoState():
return $default(_that.numero,_that.enunciado,_that.alternativas,_that.letrasMarcadas,_that.letraCorreta,_that.situacao);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int numero,  String enunciado,  List<AlternativaResultadoState> alternativas,  Set<String> letrasMarcadas,  String letraCorreta,  SituacaoQuestao situacao)?  $default,) {final _that = this;
switch (_that) {
case _ResultadoQuestaoState() when $default != null:
return $default(_that.numero,_that.enunciado,_that.alternativas,_that.letrasMarcadas,_that.letraCorreta,_that.situacao);case _:
  return null;

}
}

}

/// @nodoc


class _ResultadoQuestaoState extends ResultadoQuestaoState {
  const _ResultadoQuestaoState({required this.numero, required this.enunciado, required  List<AlternativaResultadoState> alternativas, required  Set<String> letrasMarcadas, required this.letraCorreta, required this.situacao}): _alternativas = alternativas,_letrasMarcadas = letrasMarcadas,super._();
  

@override final  int numero;
@override final  String enunciado;
 final  List<AlternativaResultadoState> _alternativas;
@override List<AlternativaResultadoState> get alternativas {
  if (_alternativas is EqualUnmodifiableListView) return _alternativas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alternativas);
}

 final  Set<String> _letrasMarcadas;
@override Set<String> get letrasMarcadas {
  if (_letrasMarcadas is EqualUnmodifiableSetView) return _letrasMarcadas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_letrasMarcadas);
}

@override final  String letraCorreta;
@override final  SituacaoQuestao situacao;

/// Create a copy of ResultadoQuestaoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultadoQuestaoStateCopyWith<_ResultadoQuestaoState> get copyWith => __$ResultadoQuestaoStateCopyWithImpl<_ResultadoQuestaoState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultadoQuestaoState&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.enunciado, enunciado) || other.enunciado == enunciado)&&const DeepCollectionEquality().equals(other.alternativas, _alternativas)&&const DeepCollectionEquality().equals(other.letrasMarcadas, _letrasMarcadas)&&(identical(other.letraCorreta, letraCorreta) || other.letraCorreta == letraCorreta)&&(identical(other.situacao, situacao) || other.situacao == situacao));
}


@override
int get hashCode {
    return Object.hash(runtimeType,numero,enunciado,const DeepCollectionEquality().hash(_alternativas),const DeepCollectionEquality().hash(_letrasMarcadas),letraCorreta,situacao);
}

@override
String toString() {
    return 'ResultadoQuestaoState(numero: $numero, enunciado: $enunciado, alternativas: $alternativas, letrasMarcadas: $letrasMarcadas, letraCorreta: $letraCorreta, situacao: $situacao)';
}


}

/// @nodoc
abstract mixin class _$ResultadoQuestaoStateCopyWith<$Res> implements $ResultadoQuestaoStateCopyWith<$Res> {
  factory _$ResultadoQuestaoStateCopyWith(_ResultadoQuestaoState value, $Res Function(_ResultadoQuestaoState) _then) = __$ResultadoQuestaoStateCopyWithImpl;
@override @useResult
$Res call({
 int numero, String enunciado, List<AlternativaResultadoState> alternativas, Set<String> letrasMarcadas, String letraCorreta, SituacaoQuestao situacao
});




}
/// @nodoc
class __$ResultadoQuestaoStateCopyWithImpl<$Res>
    implements _$ResultadoQuestaoStateCopyWith<$Res> {
  __$ResultadoQuestaoStateCopyWithImpl(this._self, this._then);

  final _ResultadoQuestaoState _self;
  final $Res Function(_ResultadoQuestaoState) _then;

/// Create a copy of ResultadoQuestaoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? numero = null,Object? enunciado = null,Object? alternativas = null,Object? letrasMarcadas = null,Object? letraCorreta = null,Object? situacao = null,}) {
  return _then(_ResultadoQuestaoState(
numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,enunciado: null == enunciado ? _self.enunciado : enunciado // ignore: cast_nullable_to_non_nullable
as String,alternativas: null == alternativas ? _self._alternativas : alternativas // ignore: cast_nullable_to_non_nullable
as List<AlternativaResultadoState>,letrasMarcadas: null == letrasMarcadas ? _self._letrasMarcadas : letrasMarcadas // ignore: cast_nullable_to_non_nullable
as Set<String>,letraCorreta: null == letraCorreta ? _self.letraCorreta : letraCorreta // ignore: cast_nullable_to_non_nullable
as String,situacao: null == situacao ? _self.situacao : situacao // ignore: cast_nullable_to_non_nullable
as SituacaoQuestao,
  ));
}


}

/// @nodoc
mixin _$ResultadoUiState {

 bool get carregando; String? get erro; String get nomeAluno; String get turma; String get tituloProva; String get disciplina; int get corrigidoEm; double get nota; double get notaMaxima; int get totalQuestoes; int get acertos; int get erros; int get emBranco; List<ResultadoQuestaoState> get questoes; FiltroQuestoes get filtro;
/// Create a copy of ResultadoUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultadoUiStateCopyWith<ResultadoUiState> get copyWith => _$ResultadoUiStateCopyWithImpl<ResultadoUiState>(this as ResultadoUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ResultadoUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultadoUiState&&(identical(other.carregando, _this.carregando) || other.carregando == _this.carregando)&&(identical(other.erro, _this.erro) || other.erro == _this.erro)&&(identical(other.nomeAluno, _this.nomeAluno) || other.nomeAluno == _this.nomeAluno)&&(identical(other.turma, _this.turma) || other.turma == _this.turma)&&(identical(other.tituloProva, _this.tituloProva) || other.tituloProva == _this.tituloProva)&&(identical(other.disciplina, _this.disciplina) || other.disciplina == _this.disciplina)&&(identical(other.corrigidoEm, _this.corrigidoEm) || other.corrigidoEm == _this.corrigidoEm)&&(identical(other.nota, _this.nota) || other.nota == _this.nota)&&(identical(other.notaMaxima, _this.notaMaxima) || other.notaMaxima == _this.notaMaxima)&&(identical(other.totalQuestoes, _this.totalQuestoes) || other.totalQuestoes == _this.totalQuestoes)&&(identical(other.acertos, _this.acertos) || other.acertos == _this.acertos)&&(identical(other.erros, _this.erros) || other.erros == _this.erros)&&(identical(other.emBranco, _this.emBranco) || other.emBranco == _this.emBranco)&&const DeepCollectionEquality().equals(other.questoes, _this.questoes)&&(identical(other.filtro, _this.filtro) || other.filtro == _this.filtro));
}


@override
int get hashCode {
  final _this = this as ResultadoUiState;
  return Object.hash(runtimeType,_this.carregando,_this.erro,_this.nomeAluno,_this.turma,_this.tituloProva,_this.disciplina,_this.corrigidoEm,_this.nota,_this.notaMaxima,_this.totalQuestoes,_this.acertos,_this.erros,_this.emBranco,const DeepCollectionEquality().hash(_this.questoes),_this.filtro);
}

@override
String toString() {
  final _this = this as ResultadoUiState;
  return 'ResultadoUiState(carregando: ${_this.carregando}, erro: ${_this.erro}, nomeAluno: ${_this.nomeAluno}, turma: ${_this.turma}, tituloProva: ${_this.tituloProva}, disciplina: ${_this.disciplina}, corrigidoEm: ${_this.corrigidoEm}, nota: ${_this.nota}, notaMaxima: ${_this.notaMaxima}, totalQuestoes: ${_this.totalQuestoes}, acertos: ${_this.acertos}, erros: ${_this.erros}, emBranco: ${_this.emBranco}, questoes: ${_this.questoes}, filtro: ${_this.filtro})';
}


}

/// @nodoc
abstract mixin class $ResultadoUiStateCopyWith<$Res>  {
  factory $ResultadoUiStateCopyWith(ResultadoUiState value, $Res Function(ResultadoUiState) _then) = _$ResultadoUiStateCopyWithImpl;
@useResult
$Res call({
 bool carregando, String? erro, String nomeAluno, String turma, String tituloProva, String disciplina, int corrigidoEm, double nota, double notaMaxima, int totalQuestoes, int acertos, int erros, int emBranco, List<ResultadoQuestaoState> questoes, FiltroQuestoes filtro
});




}
/// @nodoc
class _$ResultadoUiStateCopyWithImpl<$Res>
    implements $ResultadoUiStateCopyWith<$Res> {
  _$ResultadoUiStateCopyWithImpl(this._self, this._then);

  final ResultadoUiState _self;
  final $Res Function(ResultadoUiState) _then;

/// Create a copy of ResultadoUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? carregando = null,Object? erro = freezed,Object? nomeAluno = null,Object? turma = null,Object? tituloProva = null,Object? disciplina = null,Object? corrigidoEm = null,Object? nota = null,Object? notaMaxima = null,Object? totalQuestoes = null,Object? acertos = null,Object? erros = null,Object? emBranco = null,Object? questoes = null,Object? filtro = null,}) {
  return _then(ResultadoUiState(
carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,nomeAluno: null == nomeAluno ? _self.nomeAluno : nomeAluno // ignore: cast_nullable_to_non_nullable
as String,turma: null == turma ? _self.turma : turma // ignore: cast_nullable_to_non_nullable
as String,tituloProva: null == tituloProva ? _self.tituloProva : tituloProva // ignore: cast_nullable_to_non_nullable
as String,disciplina: null == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String,corrigidoEm: null == corrigidoEm ? _self.corrigidoEm : corrigidoEm // ignore: cast_nullable_to_non_nullable
as int,nota: null == nota ? _self.nota : nota // ignore: cast_nullable_to_non_nullable
as double,notaMaxima: null == notaMaxima ? _self.notaMaxima : notaMaxima // ignore: cast_nullable_to_non_nullable
as double,totalQuestoes: null == totalQuestoes ? _self.totalQuestoes : totalQuestoes // ignore: cast_nullable_to_non_nullable
as int,acertos: null == acertos ? _self.acertos : acertos // ignore: cast_nullable_to_non_nullable
as int,erros: null == erros ? _self.erros : erros // ignore: cast_nullable_to_non_nullable
as int,emBranco: null == emBranco ? _self.emBranco : emBranco // ignore: cast_nullable_to_non_nullable
as int,questoes: null == questoes ? _self.questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<ResultadoQuestaoState>,filtro: null == filtro ? _self.filtro : filtro // ignore: cast_nullable_to_non_nullable
as FiltroQuestoes,
  ));
}

}


/// Adds pattern-matching-related methods to [ResultadoUiState].
extension ResultadoUiStatePatterns on ResultadoUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultadoUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultadoUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultadoUiState value)  $default,){
final _that = this;
switch (_that) {
case _ResultadoUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultadoUiState value)?  $default,){
final _that = this;
switch (_that) {
case _ResultadoUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool carregando,  String? erro,  String nomeAluno,  String turma,  String tituloProva,  String disciplina,  int corrigidoEm,  double nota,  double notaMaxima,  int totalQuestoes,  int acertos,  int erros,  int emBranco,  List<ResultadoQuestaoState> questoes,  FiltroQuestoes filtro)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultadoUiState() when $default != null:
return $default(_that.carregando,_that.erro,_that.nomeAluno,_that.turma,_that.tituloProva,_that.disciplina,_that.corrigidoEm,_that.nota,_that.notaMaxima,_that.totalQuestoes,_that.acertos,_that.erros,_that.emBranco,_that.questoes,_that.filtro);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool carregando,  String? erro,  String nomeAluno,  String turma,  String tituloProva,  String disciplina,  int corrigidoEm,  double nota,  double notaMaxima,  int totalQuestoes,  int acertos,  int erros,  int emBranco,  List<ResultadoQuestaoState> questoes,  FiltroQuestoes filtro)  $default,) {final _that = this;
switch (_that) {
case _ResultadoUiState():
return $default(_that.carregando,_that.erro,_that.nomeAluno,_that.turma,_that.tituloProva,_that.disciplina,_that.corrigidoEm,_that.nota,_that.notaMaxima,_that.totalQuestoes,_that.acertos,_that.erros,_that.emBranco,_that.questoes,_that.filtro);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool carregando,  String? erro,  String nomeAluno,  String turma,  String tituloProva,  String disciplina,  int corrigidoEm,  double nota,  double notaMaxima,  int totalQuestoes,  int acertos,  int erros,  int emBranco,  List<ResultadoQuestaoState> questoes,  FiltroQuestoes filtro)?  $default,) {final _that = this;
switch (_that) {
case _ResultadoUiState() when $default != null:
return $default(_that.carregando,_that.erro,_that.nomeAluno,_that.turma,_that.tituloProva,_that.disciplina,_that.corrigidoEm,_that.nota,_that.notaMaxima,_that.totalQuestoes,_that.acertos,_that.erros,_that.emBranco,_that.questoes,_that.filtro);case _:
  return null;

}
}

}

/// @nodoc


class _ResultadoUiState extends ResultadoUiState {
  const _ResultadoUiState({this.carregando = true, this.erro, this.nomeAluno = '', this.turma = '', this.tituloProva = '', this.disciplina = '', this.corrigidoEm = 0, this.nota = 0.0, this.notaMaxima = 10.0, this.totalQuestoes = 0, this.acertos = 0, this.erros = 0, this.emBranco = 0,  List<ResultadoQuestaoState> questoes = const [], this.filtro = FiltroQuestoes.todas}): _questoes = questoes,super._();
  

@override@JsonKey() final  bool carregando;
@override final  String? erro;
@override@JsonKey() final  String nomeAluno;
@override@JsonKey() final  String turma;
@override@JsonKey() final  String tituloProva;
@override@JsonKey() final  String disciplina;
@override@JsonKey() final  int corrigidoEm;
@override@JsonKey() final  double nota;
@override@JsonKey() final  double notaMaxima;
@override@JsonKey() final  int totalQuestoes;
@override@JsonKey() final  int acertos;
@override@JsonKey() final  int erros;
@override@JsonKey() final  int emBranco;
 final  List<ResultadoQuestaoState> _questoes;
@override@JsonKey() List<ResultadoQuestaoState> get questoes {
  if (_questoes is EqualUnmodifiableListView) return _questoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questoes);
}

@override@JsonKey() final  FiltroQuestoes filtro;

/// Create a copy of ResultadoUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultadoUiStateCopyWith<_ResultadoUiState> get copyWith => __$ResultadoUiStateCopyWithImpl<_ResultadoUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultadoUiState&&(identical(other.carregando, carregando) || other.carregando == carregando)&&(identical(other.erro, erro) || other.erro == erro)&&(identical(other.nomeAluno, nomeAluno) || other.nomeAluno == nomeAluno)&&(identical(other.turma, turma) || other.turma == turma)&&(identical(other.tituloProva, tituloProva) || other.tituloProva == tituloProva)&&(identical(other.disciplina, disciplina) || other.disciplina == disciplina)&&(identical(other.corrigidoEm, corrigidoEm) || other.corrigidoEm == corrigidoEm)&&(identical(other.nota, nota) || other.nota == nota)&&(identical(other.notaMaxima, notaMaxima) || other.notaMaxima == notaMaxima)&&(identical(other.totalQuestoes, totalQuestoes) || other.totalQuestoes == totalQuestoes)&&(identical(other.acertos, acertos) || other.acertos == acertos)&&(identical(other.erros, erros) || other.erros == erros)&&(identical(other.emBranco, emBranco) || other.emBranco == emBranco)&&const DeepCollectionEquality().equals(other.questoes, _questoes)&&(identical(other.filtro, filtro) || other.filtro == filtro));
}


@override
int get hashCode {
    return Object.hash(runtimeType,carregando,erro,nomeAluno,turma,tituloProva,disciplina,corrigidoEm,nota,notaMaxima,totalQuestoes,acertos,erros,emBranco,const DeepCollectionEquality().hash(_questoes),filtro);
}

@override
String toString() {
    return 'ResultadoUiState(carregando: $carregando, erro: $erro, nomeAluno: $nomeAluno, turma: $turma, tituloProva: $tituloProva, disciplina: $disciplina, corrigidoEm: $corrigidoEm, nota: $nota, notaMaxima: $notaMaxima, totalQuestoes: $totalQuestoes, acertos: $acertos, erros: $erros, emBranco: $emBranco, questoes: $questoes, filtro: $filtro)';
}


}

/// @nodoc
abstract mixin class _$ResultadoUiStateCopyWith<$Res> implements $ResultadoUiStateCopyWith<$Res> {
  factory _$ResultadoUiStateCopyWith(_ResultadoUiState value, $Res Function(_ResultadoUiState) _then) = __$ResultadoUiStateCopyWithImpl;
@override @useResult
$Res call({
 bool carregando, String? erro, String nomeAluno, String turma, String tituloProva, String disciplina, int corrigidoEm, double nota, double notaMaxima, int totalQuestoes, int acertos, int erros, int emBranco, List<ResultadoQuestaoState> questoes, FiltroQuestoes filtro
});




}
/// @nodoc
class __$ResultadoUiStateCopyWithImpl<$Res>
    implements _$ResultadoUiStateCopyWith<$Res> {
  __$ResultadoUiStateCopyWithImpl(this._self, this._then);

  final _ResultadoUiState _self;
  final $Res Function(_ResultadoUiState) _then;

/// Create a copy of ResultadoUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? carregando = null,Object? erro = freezed,Object? nomeAluno = null,Object? turma = null,Object? tituloProva = null,Object? disciplina = null,Object? corrigidoEm = null,Object? nota = null,Object? notaMaxima = null,Object? totalQuestoes = null,Object? acertos = null,Object? erros = null,Object? emBranco = null,Object? questoes = null,Object? filtro = null,}) {
  return _then(_ResultadoUiState(
carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,nomeAluno: null == nomeAluno ? _self.nomeAluno : nomeAluno // ignore: cast_nullable_to_non_nullable
as String,turma: null == turma ? _self.turma : turma // ignore: cast_nullable_to_non_nullable
as String,tituloProva: null == tituloProva ? _self.tituloProva : tituloProva // ignore: cast_nullable_to_non_nullable
as String,disciplina: null == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String,corrigidoEm: null == corrigidoEm ? _self.corrigidoEm : corrigidoEm // ignore: cast_nullable_to_non_nullable
as int,nota: null == nota ? _self.nota : nota // ignore: cast_nullable_to_non_nullable
as double,notaMaxima: null == notaMaxima ? _self.notaMaxima : notaMaxima // ignore: cast_nullable_to_non_nullable
as double,totalQuestoes: null == totalQuestoes ? _self.totalQuestoes : totalQuestoes // ignore: cast_nullable_to_non_nullable
as int,acertos: null == acertos ? _self.acertos : acertos // ignore: cast_nullable_to_non_nullable
as int,erros: null == erros ? _self.erros : erros // ignore: cast_nullable_to_non_nullable
as int,emBranco: null == emBranco ? _self.emBranco : emBranco // ignore: cast_nullable_to_non_nullable
as int,questoes: null == questoes ? _self._questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<ResultadoQuestaoState>,filtro: null == filtro ? _self.filtro : filtro // ignore: cast_nullable_to_non_nullable
as FiltroQuestoes,
  ));
}


}

// dart format on
