// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cadastro_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CadastroUiState {

 String get nome; String get email; String get senha; String get confirmacaoSenha; bool get senhaVisivel; bool get carregando; String? get erro;
/// Create a copy of CadastroUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CadastroUiStateCopyWith<CadastroUiState> get copyWith => _$CadastroUiStateCopyWithImpl<CadastroUiState>(this as CadastroUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CadastroUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CadastroUiState&&(identical(other.nome, _this.nome) || other.nome == _this.nome)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.senha, _this.senha) || other.senha == _this.senha)&&(identical(other.confirmacaoSenha, _this.confirmacaoSenha) || other.confirmacaoSenha == _this.confirmacaoSenha)&&(identical(other.senhaVisivel, _this.senhaVisivel) || other.senhaVisivel == _this.senhaVisivel)&&(identical(other.carregando, _this.carregando) || other.carregando == _this.carregando)&&(identical(other.erro, _this.erro) || other.erro == _this.erro));
}


@override
int get hashCode {
  final _this = this as CadastroUiState;
  return Object.hash(runtimeType,_this.nome,_this.email,_this.senha,_this.confirmacaoSenha,_this.senhaVisivel,_this.carregando,_this.erro);
}

@override
String toString() {
  final _this = this as CadastroUiState;
  return 'CadastroUiState(nome: ${_this.nome}, email: ${_this.email}, senha: ${_this.senha}, confirmacaoSenha: ${_this.confirmacaoSenha}, senhaVisivel: ${_this.senhaVisivel}, carregando: ${_this.carregando}, erro: ${_this.erro})';
}


}

/// @nodoc
abstract mixin class $CadastroUiStateCopyWith<$Res>  {
  factory $CadastroUiStateCopyWith(CadastroUiState value, $Res Function(CadastroUiState) _then) = _$CadastroUiStateCopyWithImpl;
@useResult
$Res call({
 String nome, String email, String senha, String confirmacaoSenha, bool senhaVisivel, bool carregando, String? erro
});




}
/// @nodoc
class _$CadastroUiStateCopyWithImpl<$Res>
    implements $CadastroUiStateCopyWith<$Res> {
  _$CadastroUiStateCopyWithImpl(this._self, this._then);

  final CadastroUiState _self;
  final $Res Function(CadastroUiState) _then;

/// Create a copy of CadastroUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nome = null,Object? email = null,Object? senha = null,Object? confirmacaoSenha = null,Object? senhaVisivel = null,Object? carregando = null,Object? erro = freezed,}) {
  return _then(CadastroUiState(
nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,senha: null == senha ? _self.senha : senha // ignore: cast_nullable_to_non_nullable
as String,confirmacaoSenha: null == confirmacaoSenha ? _self.confirmacaoSenha : confirmacaoSenha // ignore: cast_nullable_to_non_nullable
as String,senhaVisivel: null == senhaVisivel ? _self.senhaVisivel : senhaVisivel // ignore: cast_nullable_to_non_nullable
as bool,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CadastroUiState].
extension CadastroUiStatePatterns on CadastroUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CadastroUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CadastroUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CadastroUiState value)  $default,){
final _that = this;
switch (_that) {
case _CadastroUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CadastroUiState value)?  $default,){
final _that = this;
switch (_that) {
case _CadastroUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nome,  String email,  String senha,  String confirmacaoSenha,  bool senhaVisivel,  bool carregando,  String? erro)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CadastroUiState() when $default != null:
return $default(_that.nome,_that.email,_that.senha,_that.confirmacaoSenha,_that.senhaVisivel,_that.carregando,_that.erro);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nome,  String email,  String senha,  String confirmacaoSenha,  bool senhaVisivel,  bool carregando,  String? erro)  $default,) {final _that = this;
switch (_that) {
case _CadastroUiState():
return $default(_that.nome,_that.email,_that.senha,_that.confirmacaoSenha,_that.senhaVisivel,_that.carregando,_that.erro);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nome,  String email,  String senha,  String confirmacaoSenha,  bool senhaVisivel,  bool carregando,  String? erro)?  $default,) {final _that = this;
switch (_that) {
case _CadastroUiState() when $default != null:
return $default(_that.nome,_that.email,_that.senha,_that.confirmacaoSenha,_that.senhaVisivel,_that.carregando,_that.erro);case _:
  return null;

}
}

}

/// @nodoc


class _CadastroUiState implements CadastroUiState {
  const _CadastroUiState({this.nome = '', this.email = '', this.senha = '', this.confirmacaoSenha = '', this.senhaVisivel = false, this.carregando = false, this.erro});
  

@override@JsonKey() final  String nome;
@override@JsonKey() final  String email;
@override@JsonKey() final  String senha;
@override@JsonKey() final  String confirmacaoSenha;
@override@JsonKey() final  bool senhaVisivel;
@override@JsonKey() final  bool carregando;
@override final  String? erro;

/// Create a copy of CadastroUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CadastroUiStateCopyWith<_CadastroUiState> get copyWith => __$CadastroUiStateCopyWithImpl<_CadastroUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CadastroUiState&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.email, email) || other.email == email)&&(identical(other.senha, senha) || other.senha == senha)&&(identical(other.confirmacaoSenha, confirmacaoSenha) || other.confirmacaoSenha == confirmacaoSenha)&&(identical(other.senhaVisivel, senhaVisivel) || other.senhaVisivel == senhaVisivel)&&(identical(other.carregando, carregando) || other.carregando == carregando)&&(identical(other.erro, erro) || other.erro == erro));
}


@override
int get hashCode {
    return Object.hash(runtimeType,nome,email,senha,confirmacaoSenha,senhaVisivel,carregando,erro);
}

@override
String toString() {
    return 'CadastroUiState(nome: $nome, email: $email, senha: $senha, confirmacaoSenha: $confirmacaoSenha, senhaVisivel: $senhaVisivel, carregando: $carregando, erro: $erro)';
}


}

/// @nodoc
abstract mixin class _$CadastroUiStateCopyWith<$Res> implements $CadastroUiStateCopyWith<$Res> {
  factory _$CadastroUiStateCopyWith(_CadastroUiState value, $Res Function(_CadastroUiState) _then) = __$CadastroUiStateCopyWithImpl;
@override @useResult
$Res call({
 String nome, String email, String senha, String confirmacaoSenha, bool senhaVisivel, bool carregando, String? erro
});




}
/// @nodoc
class __$CadastroUiStateCopyWithImpl<$Res>
    implements _$CadastroUiStateCopyWith<$Res> {
  __$CadastroUiStateCopyWithImpl(this._self, this._then);

  final _CadastroUiState _self;
  final $Res Function(_CadastroUiState) _then;

/// Create a copy of CadastroUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nome = null,Object? email = null,Object? senha = null,Object? confirmacaoSenha = null,Object? senhaVisivel = null,Object? carregando = null,Object? erro = freezed,}) {
  return _then(_CadastroUiState(
nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,senha: null == senha ? _self.senha : senha // ignore: cast_nullable_to_non_nullable
as String,confirmacaoSenha: null == confirmacaoSenha ? _self.confirmacaoSenha : confirmacaoSenha // ignore: cast_nullable_to_non_nullable
as String,senhaVisivel: null == senhaVisivel ? _self.senhaVisivel : senhaVisivel // ignore: cast_nullable_to_non_nullable
as bool,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
