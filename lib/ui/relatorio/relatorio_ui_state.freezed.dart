// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'relatorio_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LinhaRelatorioUiState {

 int get alunoId; String get nome;/// `null` para alunos criados pela correção, que só têm nome e turma.
 String? get matricula; int get acertos; double get nota;
/// Create a copy of LinhaRelatorioUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LinhaRelatorioUiStateCopyWith<LinhaRelatorioUiState> get copyWith => _$LinhaRelatorioUiStateCopyWithImpl<LinhaRelatorioUiState>(this as LinhaRelatorioUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LinhaRelatorioUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LinhaRelatorioUiState&&(identical(other.alunoId, _this.alunoId) || other.alunoId == _this.alunoId)&&(identical(other.nome, _this.nome) || other.nome == _this.nome)&&(identical(other.matricula, _this.matricula) || other.matricula == _this.matricula)&&(identical(other.acertos, _this.acertos) || other.acertos == _this.acertos)&&(identical(other.nota, _this.nota) || other.nota == _this.nota));
}


@override
int get hashCode {
  final _this = this as LinhaRelatorioUiState;
  return Object.hash(runtimeType,_this.alunoId,_this.nome,_this.matricula,_this.acertos,_this.nota);
}

@override
String toString() {
  final _this = this as LinhaRelatorioUiState;
  return 'LinhaRelatorioUiState(alunoId: ${_this.alunoId}, nome: ${_this.nome}, matricula: ${_this.matricula}, acertos: ${_this.acertos}, nota: ${_this.nota})';
}


}

/// @nodoc
abstract mixin class $LinhaRelatorioUiStateCopyWith<$Res>  {
  factory $LinhaRelatorioUiStateCopyWith(LinhaRelatorioUiState value, $Res Function(LinhaRelatorioUiState) _then) = _$LinhaRelatorioUiStateCopyWithImpl;
@useResult
$Res call({
 int alunoId, String nome, String? matricula, int acertos, double nota
});




}
/// @nodoc
class _$LinhaRelatorioUiStateCopyWithImpl<$Res>
    implements $LinhaRelatorioUiStateCopyWith<$Res> {
  _$LinhaRelatorioUiStateCopyWithImpl(this._self, this._then);

  final LinhaRelatorioUiState _self;
  final $Res Function(LinhaRelatorioUiState) _then;

/// Create a copy of LinhaRelatorioUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? alunoId = null,Object? nome = null,Object? matricula = freezed,Object? acertos = null,Object? nota = null,}) {
  return _then(LinhaRelatorioUiState(
alunoId: null == alunoId ? _self.alunoId : alunoId // ignore: cast_nullable_to_non_nullable
as int,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,matricula: freezed == matricula ? _self.matricula : matricula // ignore: cast_nullable_to_non_nullable
as String?,acertos: null == acertos ? _self.acertos : acertos // ignore: cast_nullable_to_non_nullable
as int,nota: null == nota ? _self.nota : nota // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [LinhaRelatorioUiState].
extension LinhaRelatorioUiStatePatterns on LinhaRelatorioUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LinhaRelatorioUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LinhaRelatorioUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LinhaRelatorioUiState value)  $default,){
final _that = this;
switch (_that) {
case _LinhaRelatorioUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LinhaRelatorioUiState value)?  $default,){
final _that = this;
switch (_that) {
case _LinhaRelatorioUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int alunoId,  String nome,  String? matricula,  int acertos,  double nota)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LinhaRelatorioUiState() when $default != null:
return $default(_that.alunoId,_that.nome,_that.matricula,_that.acertos,_that.nota);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int alunoId,  String nome,  String? matricula,  int acertos,  double nota)  $default,) {final _that = this;
switch (_that) {
case _LinhaRelatorioUiState():
return $default(_that.alunoId,_that.nome,_that.matricula,_that.acertos,_that.nota);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int alunoId,  String nome,  String? matricula,  int acertos,  double nota)?  $default,) {final _that = this;
switch (_that) {
case _LinhaRelatorioUiState() when $default != null:
return $default(_that.alunoId,_that.nome,_that.matricula,_that.acertos,_that.nota);case _:
  return null;

}
}

}

/// @nodoc


class _LinhaRelatorioUiState implements LinhaRelatorioUiState {
  const _LinhaRelatorioUiState({required this.alunoId, required this.nome, required this.matricula, required this.acertos, required this.nota});
  

@override final  int alunoId;
@override final  String nome;
/// `null` para alunos criados pela correção, que só têm nome e turma.
@override final  String? matricula;
@override final  int acertos;
@override final  double nota;

/// Create a copy of LinhaRelatorioUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LinhaRelatorioUiStateCopyWith<_LinhaRelatorioUiState> get copyWith => __$LinhaRelatorioUiStateCopyWithImpl<_LinhaRelatorioUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LinhaRelatorioUiState&&(identical(other.alunoId, alunoId) || other.alunoId == alunoId)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.matricula, matricula) || other.matricula == matricula)&&(identical(other.acertos, acertos) || other.acertos == acertos)&&(identical(other.nota, nota) || other.nota == nota));
}


@override
int get hashCode {
    return Object.hash(runtimeType,alunoId,nome,matricula,acertos,nota);
}

@override
String toString() {
    return 'LinhaRelatorioUiState(alunoId: $alunoId, nome: $nome, matricula: $matricula, acertos: $acertos, nota: $nota)';
}


}

/// @nodoc
abstract mixin class _$LinhaRelatorioUiStateCopyWith<$Res> implements $LinhaRelatorioUiStateCopyWith<$Res> {
  factory _$LinhaRelatorioUiStateCopyWith(_LinhaRelatorioUiState value, $Res Function(_LinhaRelatorioUiState) _then) = __$LinhaRelatorioUiStateCopyWithImpl;
@override @useResult
$Res call({
 int alunoId, String nome, String? matricula, int acertos, double nota
});




}
/// @nodoc
class __$LinhaRelatorioUiStateCopyWithImpl<$Res>
    implements _$LinhaRelatorioUiStateCopyWith<$Res> {
  __$LinhaRelatorioUiStateCopyWithImpl(this._self, this._then);

  final _LinhaRelatorioUiState _self;
  final $Res Function(_LinhaRelatorioUiState) _then;

/// Create a copy of LinhaRelatorioUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? alunoId = null,Object? nome = null,Object? matricula = freezed,Object? acertos = null,Object? nota = null,}) {
  return _then(_LinhaRelatorioUiState(
alunoId: null == alunoId ? _self.alunoId : alunoId // ignore: cast_nullable_to_non_nullable
as int,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,matricula: freezed == matricula ? _self.matricula : matricula // ignore: cast_nullable_to_non_nullable
as String?,acertos: null == acertos ? _self.acertos : acertos // ignore: cast_nullable_to_non_nullable
as int,nota: null == nota ? _self.nota : nota // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$RelatorioNotasUiState {

 bool get carregando; String get tituloProva; List<LinhaRelatorioUiState> get linhas; ColunaOrdenacao get colunaOrdenacao; DirecaoOrdenacao get direcaoOrdenacao; double get mediaDaTurma; double get maiorNota; double get menorNota; StatusProva get status; int get totalAlunosTurma; int get totalCorrigidos;/// Nomes dos alunos da turma da prova que ainda não foram corrigidos.
 List<String> get alunosPendentes; bool get exportando;/// Resultado da última exportação, para o snackbar; volta a `null` depois de exibido.
 String? get mensagem;
/// Create a copy of RelatorioNotasUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RelatorioNotasUiStateCopyWith<RelatorioNotasUiState> get copyWith => _$RelatorioNotasUiStateCopyWithImpl<RelatorioNotasUiState>(this as RelatorioNotasUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RelatorioNotasUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RelatorioNotasUiState&&(identical(other.carregando, _this.carregando) || other.carregando == _this.carregando)&&(identical(other.tituloProva, _this.tituloProva) || other.tituloProva == _this.tituloProva)&&const DeepCollectionEquality().equals(other.linhas, _this.linhas)&&(identical(other.colunaOrdenacao, _this.colunaOrdenacao) || other.colunaOrdenacao == _this.colunaOrdenacao)&&(identical(other.direcaoOrdenacao, _this.direcaoOrdenacao) || other.direcaoOrdenacao == _this.direcaoOrdenacao)&&(identical(other.mediaDaTurma, _this.mediaDaTurma) || other.mediaDaTurma == _this.mediaDaTurma)&&(identical(other.maiorNota, _this.maiorNota) || other.maiorNota == _this.maiorNota)&&(identical(other.menorNota, _this.menorNota) || other.menorNota == _this.menorNota)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.totalAlunosTurma, _this.totalAlunosTurma) || other.totalAlunosTurma == _this.totalAlunosTurma)&&(identical(other.totalCorrigidos, _this.totalCorrigidos) || other.totalCorrigidos == _this.totalCorrigidos)&&const DeepCollectionEquality().equals(other.alunosPendentes, _this.alunosPendentes)&&(identical(other.exportando, _this.exportando) || other.exportando == _this.exportando)&&(identical(other.mensagem, _this.mensagem) || other.mensagem == _this.mensagem));
}


@override
int get hashCode {
  final _this = this as RelatorioNotasUiState;
  return Object.hash(runtimeType,_this.carregando,_this.tituloProva,const DeepCollectionEquality().hash(_this.linhas),_this.colunaOrdenacao,_this.direcaoOrdenacao,_this.mediaDaTurma,_this.maiorNota,_this.menorNota,_this.status,_this.totalAlunosTurma,_this.totalCorrigidos,const DeepCollectionEquality().hash(_this.alunosPendentes),_this.exportando,_this.mensagem);
}

@override
String toString() {
  final _this = this as RelatorioNotasUiState;
  return 'RelatorioNotasUiState(carregando: ${_this.carregando}, tituloProva: ${_this.tituloProva}, linhas: ${_this.linhas}, colunaOrdenacao: ${_this.colunaOrdenacao}, direcaoOrdenacao: ${_this.direcaoOrdenacao}, mediaDaTurma: ${_this.mediaDaTurma}, maiorNota: ${_this.maiorNota}, menorNota: ${_this.menorNota}, status: ${_this.status}, totalAlunosTurma: ${_this.totalAlunosTurma}, totalCorrigidos: ${_this.totalCorrigidos}, alunosPendentes: ${_this.alunosPendentes}, exportando: ${_this.exportando}, mensagem: ${_this.mensagem})';
}


}

/// @nodoc
abstract mixin class $RelatorioNotasUiStateCopyWith<$Res>  {
  factory $RelatorioNotasUiStateCopyWith(RelatorioNotasUiState value, $Res Function(RelatorioNotasUiState) _then) = _$RelatorioNotasUiStateCopyWithImpl;
@useResult
$Res call({
 bool carregando, String tituloProva, List<LinhaRelatorioUiState> linhas, ColunaOrdenacao colunaOrdenacao, DirecaoOrdenacao direcaoOrdenacao, double mediaDaTurma, double maiorNota, double menorNota, StatusProva status, int totalAlunosTurma, int totalCorrigidos, List<String> alunosPendentes, bool exportando, String? mensagem
});




}
/// @nodoc
class _$RelatorioNotasUiStateCopyWithImpl<$Res>
    implements $RelatorioNotasUiStateCopyWith<$Res> {
  _$RelatorioNotasUiStateCopyWithImpl(this._self, this._then);

  final RelatorioNotasUiState _self;
  final $Res Function(RelatorioNotasUiState) _then;

/// Create a copy of RelatorioNotasUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? carregando = null,Object? tituloProva = null,Object? linhas = null,Object? colunaOrdenacao = null,Object? direcaoOrdenacao = null,Object? mediaDaTurma = null,Object? maiorNota = null,Object? menorNota = null,Object? status = null,Object? totalAlunosTurma = null,Object? totalCorrigidos = null,Object? alunosPendentes = null,Object? exportando = null,Object? mensagem = freezed,}) {
  return _then(RelatorioNotasUiState(
carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,tituloProva: null == tituloProva ? _self.tituloProva : tituloProva // ignore: cast_nullable_to_non_nullable
as String,linhas: null == linhas ? _self.linhas : linhas // ignore: cast_nullable_to_non_nullable
as List<LinhaRelatorioUiState>,colunaOrdenacao: null == colunaOrdenacao ? _self.colunaOrdenacao : colunaOrdenacao // ignore: cast_nullable_to_non_nullable
as ColunaOrdenacao,direcaoOrdenacao: null == direcaoOrdenacao ? _self.direcaoOrdenacao : direcaoOrdenacao // ignore: cast_nullable_to_non_nullable
as DirecaoOrdenacao,mediaDaTurma: null == mediaDaTurma ? _self.mediaDaTurma : mediaDaTurma // ignore: cast_nullable_to_non_nullable
as double,maiorNota: null == maiorNota ? _self.maiorNota : maiorNota // ignore: cast_nullable_to_non_nullable
as double,menorNota: null == menorNota ? _self.menorNota : menorNota // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusProva,totalAlunosTurma: null == totalAlunosTurma ? _self.totalAlunosTurma : totalAlunosTurma // ignore: cast_nullable_to_non_nullable
as int,totalCorrigidos: null == totalCorrigidos ? _self.totalCorrigidos : totalCorrigidos // ignore: cast_nullable_to_non_nullable
as int,alunosPendentes: null == alunosPendentes ? _self.alunosPendentes : alunosPendentes // ignore: cast_nullable_to_non_nullable
as List<String>,exportando: null == exportando ? _self.exportando : exportando // ignore: cast_nullable_to_non_nullable
as bool,mensagem: freezed == mensagem ? _self.mensagem : mensagem // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RelatorioNotasUiState].
extension RelatorioNotasUiStatePatterns on RelatorioNotasUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RelatorioNotasUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RelatorioNotasUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RelatorioNotasUiState value)  $default,){
final _that = this;
switch (_that) {
case _RelatorioNotasUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RelatorioNotasUiState value)?  $default,){
final _that = this;
switch (_that) {
case _RelatorioNotasUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool carregando,  String tituloProva,  List<LinhaRelatorioUiState> linhas,  ColunaOrdenacao colunaOrdenacao,  DirecaoOrdenacao direcaoOrdenacao,  double mediaDaTurma,  double maiorNota,  double menorNota,  StatusProva status,  int totalAlunosTurma,  int totalCorrigidos,  List<String> alunosPendentes,  bool exportando,  String? mensagem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RelatorioNotasUiState() when $default != null:
return $default(_that.carregando,_that.tituloProva,_that.linhas,_that.colunaOrdenacao,_that.direcaoOrdenacao,_that.mediaDaTurma,_that.maiorNota,_that.menorNota,_that.status,_that.totalAlunosTurma,_that.totalCorrigidos,_that.alunosPendentes,_that.exportando,_that.mensagem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool carregando,  String tituloProva,  List<LinhaRelatorioUiState> linhas,  ColunaOrdenacao colunaOrdenacao,  DirecaoOrdenacao direcaoOrdenacao,  double mediaDaTurma,  double maiorNota,  double menorNota,  StatusProva status,  int totalAlunosTurma,  int totalCorrigidos,  List<String> alunosPendentes,  bool exportando,  String? mensagem)  $default,) {final _that = this;
switch (_that) {
case _RelatorioNotasUiState():
return $default(_that.carregando,_that.tituloProva,_that.linhas,_that.colunaOrdenacao,_that.direcaoOrdenacao,_that.mediaDaTurma,_that.maiorNota,_that.menorNota,_that.status,_that.totalAlunosTurma,_that.totalCorrigidos,_that.alunosPendentes,_that.exportando,_that.mensagem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool carregando,  String tituloProva,  List<LinhaRelatorioUiState> linhas,  ColunaOrdenacao colunaOrdenacao,  DirecaoOrdenacao direcaoOrdenacao,  double mediaDaTurma,  double maiorNota,  double menorNota,  StatusProva status,  int totalAlunosTurma,  int totalCorrigidos,  List<String> alunosPendentes,  bool exportando,  String? mensagem)?  $default,) {final _that = this;
switch (_that) {
case _RelatorioNotasUiState() when $default != null:
return $default(_that.carregando,_that.tituloProva,_that.linhas,_that.colunaOrdenacao,_that.direcaoOrdenacao,_that.mediaDaTurma,_that.maiorNota,_that.menorNota,_that.status,_that.totalAlunosTurma,_that.totalCorrigidos,_that.alunosPendentes,_that.exportando,_that.mensagem);case _:
  return null;

}
}

}

/// @nodoc


class _RelatorioNotasUiState implements RelatorioNotasUiState {
  const _RelatorioNotasUiState({this.carregando = true, this.tituloProva = '',  List<LinhaRelatorioUiState> linhas = const <LinhaRelatorioUiState>[], this.colunaOrdenacao = ColunaOrdenacao.aluno, this.direcaoOrdenacao = DirecaoOrdenacao.ascendente, this.mediaDaTurma = 0.0, this.maiorNota = 0.0, this.menorNota = 0.0, this.status = StatusProva.pendente, this.totalAlunosTurma = 0, this.totalCorrigidos = 0,  List<String> alunosPendentes = const <String>[], this.exportando = false, this.mensagem}): _linhas = linhas,_alunosPendentes = alunosPendentes;
  

@override@JsonKey() final  bool carregando;
@override@JsonKey() final  String tituloProva;
 final  List<LinhaRelatorioUiState> _linhas;
@override@JsonKey() List<LinhaRelatorioUiState> get linhas {
  if (_linhas is EqualUnmodifiableListView) return _linhas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_linhas);
}

@override@JsonKey() final  ColunaOrdenacao colunaOrdenacao;
@override@JsonKey() final  DirecaoOrdenacao direcaoOrdenacao;
@override@JsonKey() final  double mediaDaTurma;
@override@JsonKey() final  double maiorNota;
@override@JsonKey() final  double menorNota;
@override@JsonKey() final  StatusProva status;
@override@JsonKey() final  int totalAlunosTurma;
@override@JsonKey() final  int totalCorrigidos;
/// Nomes dos alunos da turma da prova que ainda não foram corrigidos.
 final  List<String> _alunosPendentes;
/// Nomes dos alunos da turma da prova que ainda não foram corrigidos.
@override@JsonKey() List<String> get alunosPendentes {
  if (_alunosPendentes is EqualUnmodifiableListView) return _alunosPendentes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alunosPendentes);
}

@override@JsonKey() final  bool exportando;
/// Resultado da última exportação, para o snackbar; volta a `null` depois de exibido.
@override final  String? mensagem;

/// Create a copy of RelatorioNotasUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RelatorioNotasUiStateCopyWith<_RelatorioNotasUiState> get copyWith => __$RelatorioNotasUiStateCopyWithImpl<_RelatorioNotasUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RelatorioNotasUiState&&(identical(other.carregando, carregando) || other.carregando == carregando)&&(identical(other.tituloProva, tituloProva) || other.tituloProva == tituloProva)&&const DeepCollectionEquality().equals(other.linhas, _linhas)&&(identical(other.colunaOrdenacao, colunaOrdenacao) || other.colunaOrdenacao == colunaOrdenacao)&&(identical(other.direcaoOrdenacao, direcaoOrdenacao) || other.direcaoOrdenacao == direcaoOrdenacao)&&(identical(other.mediaDaTurma, mediaDaTurma) || other.mediaDaTurma == mediaDaTurma)&&(identical(other.maiorNota, maiorNota) || other.maiorNota == maiorNota)&&(identical(other.menorNota, menorNota) || other.menorNota == menorNota)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalAlunosTurma, totalAlunosTurma) || other.totalAlunosTurma == totalAlunosTurma)&&(identical(other.totalCorrigidos, totalCorrigidos) || other.totalCorrigidos == totalCorrigidos)&&const DeepCollectionEquality().equals(other.alunosPendentes, _alunosPendentes)&&(identical(other.exportando, exportando) || other.exportando == exportando)&&(identical(other.mensagem, mensagem) || other.mensagem == mensagem));
}


@override
int get hashCode {
    return Object.hash(runtimeType,carregando,tituloProva,const DeepCollectionEquality().hash(_linhas),colunaOrdenacao,direcaoOrdenacao,mediaDaTurma,maiorNota,menorNota,status,totalAlunosTurma,totalCorrigidos,const DeepCollectionEquality().hash(_alunosPendentes),exportando,mensagem);
}

@override
String toString() {
    return 'RelatorioNotasUiState(carregando: $carregando, tituloProva: $tituloProva, linhas: $linhas, colunaOrdenacao: $colunaOrdenacao, direcaoOrdenacao: $direcaoOrdenacao, mediaDaTurma: $mediaDaTurma, maiorNota: $maiorNota, menorNota: $menorNota, status: $status, totalAlunosTurma: $totalAlunosTurma, totalCorrigidos: $totalCorrigidos, alunosPendentes: $alunosPendentes, exportando: $exportando, mensagem: $mensagem)';
}


}

/// @nodoc
abstract mixin class _$RelatorioNotasUiStateCopyWith<$Res> implements $RelatorioNotasUiStateCopyWith<$Res> {
  factory _$RelatorioNotasUiStateCopyWith(_RelatorioNotasUiState value, $Res Function(_RelatorioNotasUiState) _then) = __$RelatorioNotasUiStateCopyWithImpl;
@override @useResult
$Res call({
 bool carregando, String tituloProva, List<LinhaRelatorioUiState> linhas, ColunaOrdenacao colunaOrdenacao, DirecaoOrdenacao direcaoOrdenacao, double mediaDaTurma, double maiorNota, double menorNota, StatusProva status, int totalAlunosTurma, int totalCorrigidos, List<String> alunosPendentes, bool exportando, String? mensagem
});




}
/// @nodoc
class __$RelatorioNotasUiStateCopyWithImpl<$Res>
    implements _$RelatorioNotasUiStateCopyWith<$Res> {
  __$RelatorioNotasUiStateCopyWithImpl(this._self, this._then);

  final _RelatorioNotasUiState _self;
  final $Res Function(_RelatorioNotasUiState) _then;

/// Create a copy of RelatorioNotasUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? carregando = null,Object? tituloProva = null,Object? linhas = null,Object? colunaOrdenacao = null,Object? direcaoOrdenacao = null,Object? mediaDaTurma = null,Object? maiorNota = null,Object? menorNota = null,Object? status = null,Object? totalAlunosTurma = null,Object? totalCorrigidos = null,Object? alunosPendentes = null,Object? exportando = null,Object? mensagem = freezed,}) {
  return _then(_RelatorioNotasUiState(
carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,tituloProva: null == tituloProva ? _self.tituloProva : tituloProva // ignore: cast_nullable_to_non_nullable
as String,linhas: null == linhas ? _self._linhas : linhas // ignore: cast_nullable_to_non_nullable
as List<LinhaRelatorioUiState>,colunaOrdenacao: null == colunaOrdenacao ? _self.colunaOrdenacao : colunaOrdenacao // ignore: cast_nullable_to_non_nullable
as ColunaOrdenacao,direcaoOrdenacao: null == direcaoOrdenacao ? _self.direcaoOrdenacao : direcaoOrdenacao // ignore: cast_nullable_to_non_nullable
as DirecaoOrdenacao,mediaDaTurma: null == mediaDaTurma ? _self.mediaDaTurma : mediaDaTurma // ignore: cast_nullable_to_non_nullable
as double,maiorNota: null == maiorNota ? _self.maiorNota : maiorNota // ignore: cast_nullable_to_non_nullable
as double,menorNota: null == menorNota ? _self.menorNota : menorNota // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusProva,totalAlunosTurma: null == totalAlunosTurma ? _self.totalAlunosTurma : totalAlunosTurma // ignore: cast_nullable_to_non_nullable
as int,totalCorrigidos: null == totalCorrigidos ? _self.totalCorrigidos : totalCorrigidos // ignore: cast_nullable_to_non_nullable
as int,alunosPendentes: null == alunosPendentes ? _self._alunosPendentes : alunosPendentes // ignore: cast_nullable_to_non_nullable
as List<String>,exportando: null == exportando ? _self.exportando : exportando // ignore: cast_nullable_to_non_nullable
as bool,mensagem: freezed == mensagem ? _self.mensagem : mensagem // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
