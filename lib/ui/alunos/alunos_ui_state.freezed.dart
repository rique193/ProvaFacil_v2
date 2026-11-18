// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alunos_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlunoFormState {

/// Aluno em edição; `null` quando é um cadastro novo.
 int? get alunoId; String get nome; String get matricula; String get turma; String get email; String? get erro; bool get salvando;
/// Create a copy of AlunoFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlunoFormStateCopyWith<AlunoFormState> get copyWith => _$AlunoFormStateCopyWithImpl<AlunoFormState>(this as AlunoFormState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AlunoFormState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlunoFormState&&(identical(other.alunoId, _this.alunoId) || other.alunoId == _this.alunoId)&&(identical(other.nome, _this.nome) || other.nome == _this.nome)&&(identical(other.matricula, _this.matricula) || other.matricula == _this.matricula)&&(identical(other.turma, _this.turma) || other.turma == _this.turma)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.erro, _this.erro) || other.erro == _this.erro)&&(identical(other.salvando, _this.salvando) || other.salvando == _this.salvando));
}


@override
int get hashCode {
  final _this = this as AlunoFormState;
  return Object.hash(runtimeType,_this.alunoId,_this.nome,_this.matricula,_this.turma,_this.email,_this.erro,_this.salvando);
}

@override
String toString() {
  final _this = this as AlunoFormState;
  return 'AlunoFormState(alunoId: ${_this.alunoId}, nome: ${_this.nome}, matricula: ${_this.matricula}, turma: ${_this.turma}, email: ${_this.email}, erro: ${_this.erro}, salvando: ${_this.salvando})';
}


}

/// @nodoc
abstract mixin class $AlunoFormStateCopyWith<$Res>  {
  factory $AlunoFormStateCopyWith(AlunoFormState value, $Res Function(AlunoFormState) _then) = _$AlunoFormStateCopyWithImpl;
@useResult
$Res call({
 int? alunoId, String nome, String matricula, String turma, String email, String? erro, bool salvando
});




}
/// @nodoc
class _$AlunoFormStateCopyWithImpl<$Res>
    implements $AlunoFormStateCopyWith<$Res> {
  _$AlunoFormStateCopyWithImpl(this._self, this._then);

  final AlunoFormState _self;
  final $Res Function(AlunoFormState) _then;

/// Create a copy of AlunoFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? alunoId = freezed,Object? nome = null,Object? matricula = null,Object? turma = null,Object? email = null,Object? erro = freezed,Object? salvando = null,}) {
  return _then(AlunoFormState(
alunoId: freezed == alunoId ? _self.alunoId : alunoId // ignore: cast_nullable_to_non_nullable
as int?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,matricula: null == matricula ? _self.matricula : matricula // ignore: cast_nullable_to_non_nullable
as String,turma: null == turma ? _self.turma : turma // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,salvando: null == salvando ? _self.salvando : salvando // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AlunoFormState].
extension AlunoFormStatePatterns on AlunoFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlunoFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlunoFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlunoFormState value)  $default,){
final _that = this;
switch (_that) {
case _AlunoFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlunoFormState value)?  $default,){
final _that = this;
switch (_that) {
case _AlunoFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? alunoId,  String nome,  String matricula,  String turma,  String email,  String? erro,  bool salvando)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlunoFormState() when $default != null:
return $default(_that.alunoId,_that.nome,_that.matricula,_that.turma,_that.email,_that.erro,_that.salvando);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? alunoId,  String nome,  String matricula,  String turma,  String email,  String? erro,  bool salvando)  $default,) {final _that = this;
switch (_that) {
case _AlunoFormState():
return $default(_that.alunoId,_that.nome,_that.matricula,_that.turma,_that.email,_that.erro,_that.salvando);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? alunoId,  String nome,  String matricula,  String turma,  String email,  String? erro,  bool salvando)?  $default,) {final _that = this;
switch (_that) {
case _AlunoFormState() when $default != null:
return $default(_that.alunoId,_that.nome,_that.matricula,_that.turma,_that.email,_that.erro,_that.salvando);case _:
  return null;

}
}

}

/// @nodoc


class _AlunoFormState extends AlunoFormState {
  const _AlunoFormState({this.alunoId, this.nome = '', this.matricula = '', this.turma = '', this.email = '', this.erro, this.salvando = false}): super._();
  

/// Aluno em edição; `null` quando é um cadastro novo.
@override final  int? alunoId;
@override@JsonKey() final  String nome;
@override@JsonKey() final  String matricula;
@override@JsonKey() final  String turma;
@override@JsonKey() final  String email;
@override final  String? erro;
@override@JsonKey() final  bool salvando;

/// Create a copy of AlunoFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlunoFormStateCopyWith<_AlunoFormState> get copyWith => __$AlunoFormStateCopyWithImpl<_AlunoFormState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlunoFormState&&(identical(other.alunoId, alunoId) || other.alunoId == alunoId)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.matricula, matricula) || other.matricula == matricula)&&(identical(other.turma, turma) || other.turma == turma)&&(identical(other.email, email) || other.email == email)&&(identical(other.erro, erro) || other.erro == erro)&&(identical(other.salvando, salvando) || other.salvando == salvando));
}


@override
int get hashCode {
    return Object.hash(runtimeType,alunoId,nome,matricula,turma,email,erro,salvando);
}

@override
String toString() {
    return 'AlunoFormState(alunoId: $alunoId, nome: $nome, matricula: $matricula, turma: $turma, email: $email, erro: $erro, salvando: $salvando)';
}


}

/// @nodoc
abstract mixin class _$AlunoFormStateCopyWith<$Res> implements $AlunoFormStateCopyWith<$Res> {
  factory _$AlunoFormStateCopyWith(_AlunoFormState value, $Res Function(_AlunoFormState) _then) = __$AlunoFormStateCopyWithImpl;
@override @useResult
$Res call({
 int? alunoId, String nome, String matricula, String turma, String email, String? erro, bool salvando
});




}
/// @nodoc
class __$AlunoFormStateCopyWithImpl<$Res>
    implements _$AlunoFormStateCopyWith<$Res> {
  __$AlunoFormStateCopyWithImpl(this._self, this._then);

  final _AlunoFormState _self;
  final $Res Function(_AlunoFormState) _then;

/// Create a copy of AlunoFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? alunoId = freezed,Object? nome = null,Object? matricula = null,Object? turma = null,Object? email = null,Object? erro = freezed,Object? salvando = null,}) {
  return _then(_AlunoFormState(
alunoId: freezed == alunoId ? _self.alunoId : alunoId // ignore: cast_nullable_to_non_nullable
as int?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,matricula: null == matricula ? _self.matricula : matricula // ignore: cast_nullable_to_non_nullable
as String,turma: null == turma ? _self.turma : turma // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,salvando: null == salvando ? _self.salvando : salvando // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ConfirmacaoExclusaoAluno {

 int get alunoId; String get nome; int get quantidadeResultados;
/// Create a copy of ConfirmacaoExclusaoAluno
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmacaoExclusaoAlunoCopyWith<ConfirmacaoExclusaoAluno> get copyWith => _$ConfirmacaoExclusaoAlunoCopyWithImpl<ConfirmacaoExclusaoAluno>(this as ConfirmacaoExclusaoAluno, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ConfirmacaoExclusaoAluno;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmacaoExclusaoAluno&&(identical(other.alunoId, _this.alunoId) || other.alunoId == _this.alunoId)&&(identical(other.nome, _this.nome) || other.nome == _this.nome)&&(identical(other.quantidadeResultados, _this.quantidadeResultados) || other.quantidadeResultados == _this.quantidadeResultados));
}


@override
int get hashCode {
  final _this = this as ConfirmacaoExclusaoAluno;
  return Object.hash(runtimeType,_this.alunoId,_this.nome,_this.quantidadeResultados);
}

@override
String toString() {
  final _this = this as ConfirmacaoExclusaoAluno;
  return 'ConfirmacaoExclusaoAluno(alunoId: ${_this.alunoId}, nome: ${_this.nome}, quantidadeResultados: ${_this.quantidadeResultados})';
}


}

/// @nodoc
abstract mixin class $ConfirmacaoExclusaoAlunoCopyWith<$Res>  {
  factory $ConfirmacaoExclusaoAlunoCopyWith(ConfirmacaoExclusaoAluno value, $Res Function(ConfirmacaoExclusaoAluno) _then) = _$ConfirmacaoExclusaoAlunoCopyWithImpl;
@useResult
$Res call({
 int alunoId, String nome, int quantidadeResultados
});




}
/// @nodoc
class _$ConfirmacaoExclusaoAlunoCopyWithImpl<$Res>
    implements $ConfirmacaoExclusaoAlunoCopyWith<$Res> {
  _$ConfirmacaoExclusaoAlunoCopyWithImpl(this._self, this._then);

  final ConfirmacaoExclusaoAluno _self;
  final $Res Function(ConfirmacaoExclusaoAluno) _then;

/// Create a copy of ConfirmacaoExclusaoAluno
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? alunoId = null,Object? nome = null,Object? quantidadeResultados = null,}) {
  return _then(ConfirmacaoExclusaoAluno(
alunoId: null == alunoId ? _self.alunoId : alunoId // ignore: cast_nullable_to_non_nullable
as int,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,quantidadeResultados: null == quantidadeResultados ? _self.quantidadeResultados : quantidadeResultados // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfirmacaoExclusaoAluno].
extension ConfirmacaoExclusaoAlunoPatterns on ConfirmacaoExclusaoAluno {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfirmacaoExclusaoAluno value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfirmacaoExclusaoAluno() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfirmacaoExclusaoAluno value)  $default,){
final _that = this;
switch (_that) {
case _ConfirmacaoExclusaoAluno():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfirmacaoExclusaoAluno value)?  $default,){
final _that = this;
switch (_that) {
case _ConfirmacaoExclusaoAluno() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int alunoId,  String nome,  int quantidadeResultados)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfirmacaoExclusaoAluno() when $default != null:
return $default(_that.alunoId,_that.nome,_that.quantidadeResultados);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int alunoId,  String nome,  int quantidadeResultados)  $default,) {final _that = this;
switch (_that) {
case _ConfirmacaoExclusaoAluno():
return $default(_that.alunoId,_that.nome,_that.quantidadeResultados);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int alunoId,  String nome,  int quantidadeResultados)?  $default,) {final _that = this;
switch (_that) {
case _ConfirmacaoExclusaoAluno() when $default != null:
return $default(_that.alunoId,_that.nome,_that.quantidadeResultados);case _:
  return null;

}
}

}

/// @nodoc


class _ConfirmacaoExclusaoAluno extends ConfirmacaoExclusaoAluno {
  const _ConfirmacaoExclusaoAluno({required this.alunoId, required this.nome, required this.quantidadeResultados}): super._();
  

@override final  int alunoId;
@override final  String nome;
@override final  int quantidadeResultados;

/// Create a copy of ConfirmacaoExclusaoAluno
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmacaoExclusaoAlunoCopyWith<_ConfirmacaoExclusaoAluno> get copyWith => __$ConfirmacaoExclusaoAlunoCopyWithImpl<_ConfirmacaoExclusaoAluno>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmacaoExclusaoAluno&&(identical(other.alunoId, alunoId) || other.alunoId == alunoId)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.quantidadeResultados, quantidadeResultados) || other.quantidadeResultados == quantidadeResultados));
}


@override
int get hashCode {
    return Object.hash(runtimeType,alunoId,nome,quantidadeResultados);
}

@override
String toString() {
    return 'ConfirmacaoExclusaoAluno(alunoId: $alunoId, nome: $nome, quantidadeResultados: $quantidadeResultados)';
}


}

/// @nodoc
abstract mixin class _$ConfirmacaoExclusaoAlunoCopyWith<$Res> implements $ConfirmacaoExclusaoAlunoCopyWith<$Res> {
  factory _$ConfirmacaoExclusaoAlunoCopyWith(_ConfirmacaoExclusaoAluno value, $Res Function(_ConfirmacaoExclusaoAluno) _then) = __$ConfirmacaoExclusaoAlunoCopyWithImpl;
@override @useResult
$Res call({
 int alunoId, String nome, int quantidadeResultados
});




}
/// @nodoc
class __$ConfirmacaoExclusaoAlunoCopyWithImpl<$Res>
    implements _$ConfirmacaoExclusaoAlunoCopyWith<$Res> {
  __$ConfirmacaoExclusaoAlunoCopyWithImpl(this._self, this._then);

  final _ConfirmacaoExclusaoAluno _self;
  final $Res Function(_ConfirmacaoExclusaoAluno) _then;

/// Create a copy of ConfirmacaoExclusaoAluno
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? alunoId = null,Object? nome = null,Object? quantidadeResultados = null,}) {
  return _then(_ConfirmacaoExclusaoAluno(
alunoId: null == alunoId ? _self.alunoId : alunoId // ignore: cast_nullable_to_non_nullable
as int,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,quantidadeResultados: null == quantidadeResultados ? _self.quantidadeResultados : quantidadeResultados // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$AlunosUiState {

 List<AlunoEntity> get alunos; bool get carregando; String get busca; bool get mostrarDialogoAluno; AlunoFormState get formAluno; ConfirmacaoExclusaoAluno? get confirmacaoExclusao;/// Aviso exibido num snackbar (ex.: "Aluno excluído").
 String? get mensagem;
/// Create a copy of AlunosUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlunosUiStateCopyWith<AlunosUiState> get copyWith => _$AlunosUiStateCopyWithImpl<AlunosUiState>(this as AlunosUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AlunosUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlunosUiState&&const DeepCollectionEquality().equals(other.alunos, _this.alunos)&&(identical(other.carregando, _this.carregando) || other.carregando == _this.carregando)&&(identical(other.busca, _this.busca) || other.busca == _this.busca)&&(identical(other.mostrarDialogoAluno, _this.mostrarDialogoAluno) || other.mostrarDialogoAluno == _this.mostrarDialogoAluno)&&(identical(other.formAluno, _this.formAluno) || other.formAluno == _this.formAluno)&&(identical(other.confirmacaoExclusao, _this.confirmacaoExclusao) || other.confirmacaoExclusao == _this.confirmacaoExclusao)&&(identical(other.mensagem, _this.mensagem) || other.mensagem == _this.mensagem));
}


@override
int get hashCode {
  final _this = this as AlunosUiState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.alunos),_this.carregando,_this.busca,_this.mostrarDialogoAluno,_this.formAluno,_this.confirmacaoExclusao,_this.mensagem);
}

@override
String toString() {
  final _this = this as AlunosUiState;
  return 'AlunosUiState(alunos: ${_this.alunos}, carregando: ${_this.carregando}, busca: ${_this.busca}, mostrarDialogoAluno: ${_this.mostrarDialogoAluno}, formAluno: ${_this.formAluno}, confirmacaoExclusao: ${_this.confirmacaoExclusao}, mensagem: ${_this.mensagem})';
}


}

/// @nodoc
abstract mixin class $AlunosUiStateCopyWith<$Res>  {
  factory $AlunosUiStateCopyWith(AlunosUiState value, $Res Function(AlunosUiState) _then) = _$AlunosUiStateCopyWithImpl;
@useResult
$Res call({
 List<AlunoEntity> alunos, bool carregando, String busca, bool mostrarDialogoAluno, AlunoFormState formAluno, ConfirmacaoExclusaoAluno? confirmacaoExclusao, String? mensagem
});


$AlunoFormStateCopyWith<$Res> get formAluno;$ConfirmacaoExclusaoAlunoCopyWith<$Res>? get confirmacaoExclusao;

}
/// @nodoc
class _$AlunosUiStateCopyWithImpl<$Res>
    implements $AlunosUiStateCopyWith<$Res> {
  _$AlunosUiStateCopyWithImpl(this._self, this._then);

  final AlunosUiState _self;
  final $Res Function(AlunosUiState) _then;

/// Create a copy of AlunosUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? alunos = null,Object? carregando = null,Object? busca = null,Object? mostrarDialogoAluno = null,Object? formAluno = null,Object? confirmacaoExclusao = freezed,Object? mensagem = freezed,}) {
  return _then(AlunosUiState(
alunos: null == alunos ? _self.alunos : alunos // ignore: cast_nullable_to_non_nullable
as List<AlunoEntity>,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,busca: null == busca ? _self.busca : busca // ignore: cast_nullable_to_non_nullable
as String,mostrarDialogoAluno: null == mostrarDialogoAluno ? _self.mostrarDialogoAluno : mostrarDialogoAluno // ignore: cast_nullable_to_non_nullable
as bool,formAluno: null == formAluno ? _self.formAluno : formAluno // ignore: cast_nullable_to_non_nullable
as AlunoFormState,confirmacaoExclusao: freezed == confirmacaoExclusao ? _self.confirmacaoExclusao : confirmacaoExclusao // ignore: cast_nullable_to_non_nullable
as ConfirmacaoExclusaoAluno?,mensagem: freezed == mensagem ? _self.mensagem : mensagem // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AlunosUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlunoFormStateCopyWith<$Res> get formAluno {
  
  return $AlunoFormStateCopyWith<$Res>(_self.formAluno, (value) {
    return _then(_self.copyWith(formAluno: value));
  });
}/// Create a copy of AlunosUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfirmacaoExclusaoAlunoCopyWith<$Res>? get confirmacaoExclusao {
    if (_self.confirmacaoExclusao == null) {
    return null;
  }

  return $ConfirmacaoExclusaoAlunoCopyWith<$Res>(_self.confirmacaoExclusao!, (value) {
    return _then(_self.copyWith(confirmacaoExclusao: value));
  });
}
}


/// Adds pattern-matching-related methods to [AlunosUiState].
extension AlunosUiStatePatterns on AlunosUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlunosUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlunosUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlunosUiState value)  $default,){
final _that = this;
switch (_that) {
case _AlunosUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlunosUiState value)?  $default,){
final _that = this;
switch (_that) {
case _AlunosUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AlunoEntity> alunos,  bool carregando,  String busca,  bool mostrarDialogoAluno,  AlunoFormState formAluno,  ConfirmacaoExclusaoAluno? confirmacaoExclusao,  String? mensagem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlunosUiState() when $default != null:
return $default(_that.alunos,_that.carregando,_that.busca,_that.mostrarDialogoAluno,_that.formAluno,_that.confirmacaoExclusao,_that.mensagem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AlunoEntity> alunos,  bool carregando,  String busca,  bool mostrarDialogoAluno,  AlunoFormState formAluno,  ConfirmacaoExclusaoAluno? confirmacaoExclusao,  String? mensagem)  $default,) {final _that = this;
switch (_that) {
case _AlunosUiState():
return $default(_that.alunos,_that.carregando,_that.busca,_that.mostrarDialogoAluno,_that.formAluno,_that.confirmacaoExclusao,_that.mensagem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AlunoEntity> alunos,  bool carregando,  String busca,  bool mostrarDialogoAluno,  AlunoFormState formAluno,  ConfirmacaoExclusaoAluno? confirmacaoExclusao,  String? mensagem)?  $default,) {final _that = this;
switch (_that) {
case _AlunosUiState() when $default != null:
return $default(_that.alunos,_that.carregando,_that.busca,_that.mostrarDialogoAluno,_that.formAluno,_that.confirmacaoExclusao,_that.mensagem);case _:
  return null;

}
}

}

/// @nodoc


class _AlunosUiState extends AlunosUiState {
  const _AlunosUiState({ List<AlunoEntity> alunos = const [], this.carregando = true, this.busca = '', this.mostrarDialogoAluno = false, this.formAluno = const AlunoFormState(), this.confirmacaoExclusao, this.mensagem}): _alunos = alunos,super._();
  

 final  List<AlunoEntity> _alunos;
@override@JsonKey() List<AlunoEntity> get alunos {
  if (_alunos is EqualUnmodifiableListView) return _alunos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alunos);
}

@override@JsonKey() final  bool carregando;
@override@JsonKey() final  String busca;
@override@JsonKey() final  bool mostrarDialogoAluno;
@override@JsonKey() final  AlunoFormState formAluno;
@override final  ConfirmacaoExclusaoAluno? confirmacaoExclusao;
/// Aviso exibido num snackbar (ex.: "Aluno excluído").
@override final  String? mensagem;

/// Create a copy of AlunosUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlunosUiStateCopyWith<_AlunosUiState> get copyWith => __$AlunosUiStateCopyWithImpl<_AlunosUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlunosUiState&&const DeepCollectionEquality().equals(other.alunos, _alunos)&&(identical(other.carregando, carregando) || other.carregando == carregando)&&(identical(other.busca, busca) || other.busca == busca)&&(identical(other.mostrarDialogoAluno, mostrarDialogoAluno) || other.mostrarDialogoAluno == mostrarDialogoAluno)&&(identical(other.formAluno, formAluno) || other.formAluno == formAluno)&&(identical(other.confirmacaoExclusao, confirmacaoExclusao) || other.confirmacaoExclusao == confirmacaoExclusao)&&(identical(other.mensagem, mensagem) || other.mensagem == mensagem));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_alunos),carregando,busca,mostrarDialogoAluno,formAluno,confirmacaoExclusao,mensagem);
}

@override
String toString() {
    return 'AlunosUiState(alunos: $alunos, carregando: $carregando, busca: $busca, mostrarDialogoAluno: $mostrarDialogoAluno, formAluno: $formAluno, confirmacaoExclusao: $confirmacaoExclusao, mensagem: $mensagem)';
}


}

/// @nodoc
abstract mixin class _$AlunosUiStateCopyWith<$Res> implements $AlunosUiStateCopyWith<$Res> {
  factory _$AlunosUiStateCopyWith(_AlunosUiState value, $Res Function(_AlunosUiState) _then) = __$AlunosUiStateCopyWithImpl;
@override @useResult
$Res call({
 List<AlunoEntity> alunos, bool carregando, String busca, bool mostrarDialogoAluno, AlunoFormState formAluno, ConfirmacaoExclusaoAluno? confirmacaoExclusao, String? mensagem
});


@override $AlunoFormStateCopyWith<$Res> get formAluno;@override $ConfirmacaoExclusaoAlunoCopyWith<$Res>? get confirmacaoExclusao;

}
/// @nodoc
class __$AlunosUiStateCopyWithImpl<$Res>
    implements _$AlunosUiStateCopyWith<$Res> {
  __$AlunosUiStateCopyWithImpl(this._self, this._then);

  final _AlunosUiState _self;
  final $Res Function(_AlunosUiState) _then;

/// Create a copy of AlunosUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? alunos = null,Object? carregando = null,Object? busca = null,Object? mostrarDialogoAluno = null,Object? formAluno = null,Object? confirmacaoExclusao = freezed,Object? mensagem = freezed,}) {
  return _then(_AlunosUiState(
alunos: null == alunos ? _self._alunos : alunos // ignore: cast_nullable_to_non_nullable
as List<AlunoEntity>,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,busca: null == busca ? _self.busca : busca // ignore: cast_nullable_to_non_nullable
as String,mostrarDialogoAluno: null == mostrarDialogoAluno ? _self.mostrarDialogoAluno : mostrarDialogoAluno // ignore: cast_nullable_to_non_nullable
as bool,formAluno: null == formAluno ? _self.formAluno : formAluno // ignore: cast_nullable_to_non_nullable
as AlunoFormState,confirmacaoExclusao: freezed == confirmacaoExclusao ? _self.confirmacaoExclusao : confirmacaoExclusao // ignore: cast_nullable_to_non_nullable
as ConfirmacaoExclusaoAluno?,mensagem: freezed == mensagem ? _self.mensagem : mensagem // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AlunosUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlunoFormStateCopyWith<$Res> get formAluno {
  
  return $AlunoFormStateCopyWith<$Res>(_self.formAluno, (value) {
    return _then(_self.copyWith(formAluno: value));
  });
}/// Create a copy of AlunosUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfirmacaoExclusaoAlunoCopyWith<$Res>? get confirmacaoExclusao {
    if (_self.confirmacaoExclusao == null) {
    return null;
  }

  return $ConfirmacaoExclusaoAlunoCopyWith<$Res>(_self.confirmacaoExclusao!, (value) {
    return _then(_self.copyWith(confirmacaoExclusao: value));
  });
}
}

// dart format on
