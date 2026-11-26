// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginUiState {

 String get email; String get senha; bool get senhaVisivel; bool get carregando; String? get erro;
/// Create a copy of LoginUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginUiStateCopyWith<LoginUiState> get copyWith => _$LoginUiStateCopyWithImpl<LoginUiState>(this as LoginUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LoginUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginUiState&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.senha, _this.senha) || other.senha == _this.senha)&&(identical(other.senhaVisivel, _this.senhaVisivel) || other.senhaVisivel == _this.senhaVisivel)&&(identical(other.carregando, _this.carregando) || other.carregando == _this.carregando)&&(identical(other.erro, _this.erro) || other.erro == _this.erro));
}


@override
int get hashCode {
  final _this = this as LoginUiState;
  return Object.hash(runtimeType,_this.email,_this.senha,_this.senhaVisivel,_this.carregando,_this.erro);
}

@override
String toString() {
  final _this = this as LoginUiState;
  return 'LoginUiState(email: ${_this.email}, senha: ${_this.senha}, senhaVisivel: ${_this.senhaVisivel}, carregando: ${_this.carregando}, erro: ${_this.erro})';
}


}

/// @nodoc
abstract mixin class $LoginUiStateCopyWith<$Res>  {
  factory $LoginUiStateCopyWith(LoginUiState value, $Res Function(LoginUiState) _then) = _$LoginUiStateCopyWithImpl;
@useResult
$Res call({
 String email, String senha, bool senhaVisivel, bool carregando, String? erro
});




}
/// @nodoc
class _$LoginUiStateCopyWithImpl<$Res>
    implements $LoginUiStateCopyWith<$Res> {
  _$LoginUiStateCopyWithImpl(this._self, this._then);

  final LoginUiState _self;
  final $Res Function(LoginUiState) _then;

/// Create a copy of LoginUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? senha = null,Object? senhaVisivel = null,Object? carregando = null,Object? erro = freezed,}) {
  return _then(LoginUiState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,senha: null == senha ? _self.senha : senha // ignore: cast_nullable_to_non_nullable
as String,senhaVisivel: null == senhaVisivel ? _self.senhaVisivel : senhaVisivel // ignore: cast_nullable_to_non_nullable
as bool,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginUiState].
extension LoginUiStatePatterns on LoginUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginUiState value)  $default,){
final _that = this;
switch (_that) {
case _LoginUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginUiState value)?  $default,){
final _that = this;
switch (_that) {
case _LoginUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String senha,  bool senhaVisivel,  bool carregando,  String? erro)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginUiState() when $default != null:
return $default(_that.email,_that.senha,_that.senhaVisivel,_that.carregando,_that.erro);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String senha,  bool senhaVisivel,  bool carregando,  String? erro)  $default,) {final _that = this;
switch (_that) {
case _LoginUiState():
return $default(_that.email,_that.senha,_that.senhaVisivel,_that.carregando,_that.erro);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String senha,  bool senhaVisivel,  bool carregando,  String? erro)?  $default,) {final _that = this;
switch (_that) {
case _LoginUiState() when $default != null:
return $default(_that.email,_that.senha,_that.senhaVisivel,_that.carregando,_that.erro);case _:
  return null;

}
}

}

/// @nodoc


class _LoginUiState implements LoginUiState {
  const _LoginUiState({this.email = '', this.senha = '', this.senhaVisivel = false, this.carregando = false, this.erro});
  

@override@JsonKey() final  String email;
@override@JsonKey() final  String senha;
@override@JsonKey() final  bool senhaVisivel;
@override@JsonKey() final  bool carregando;
@override final  String? erro;

/// Create a copy of LoginUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginUiStateCopyWith<_LoginUiState> get copyWith => __$LoginUiStateCopyWithImpl<_LoginUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginUiState&&(identical(other.email, email) || other.email == email)&&(identical(other.senha, senha) || other.senha == senha)&&(identical(other.senhaVisivel, senhaVisivel) || other.senhaVisivel == senhaVisivel)&&(identical(other.carregando, carregando) || other.carregando == carregando)&&(identical(other.erro, erro) || other.erro == erro));
}


@override
int get hashCode {
    return Object.hash(runtimeType,email,senha,senhaVisivel,carregando,erro);
}

@override
String toString() {
    return 'LoginUiState(email: $email, senha: $senha, senhaVisivel: $senhaVisivel, carregando: $carregando, erro: $erro)';
}


}

/// @nodoc
abstract mixin class _$LoginUiStateCopyWith<$Res> implements $LoginUiStateCopyWith<$Res> {
  factory _$LoginUiStateCopyWith(_LoginUiState value, $Res Function(_LoginUiState) _then) = __$LoginUiStateCopyWithImpl;
@override @useResult
$Res call({
 String email, String senha, bool senhaVisivel, bool carregando, String? erro
});




}
/// @nodoc
class __$LoginUiStateCopyWithImpl<$Res>
    implements _$LoginUiStateCopyWith<$Res> {
  __$LoginUiStateCopyWithImpl(this._self, this._then);

  final _LoginUiState _self;
  final $Res Function(_LoginUiState) _then;

/// Create a copy of LoginUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? senha = null,Object? senhaVisivel = null,Object? carregando = null,Object? erro = freezed,}) {
  return _then(_LoginUiState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,senha: null == senha ? _self.senha : senha // ignore: cast_nullable_to_non_nullable
as String,senhaVisivel: null == senhaVisivel ? _self.senhaVisivel : senhaVisivel // ignore: cast_nullable_to_non_nullable
as bool,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
