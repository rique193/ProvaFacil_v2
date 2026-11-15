// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planilha_relatorio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResultadoExportacao {

 String get nome; String? get matricula; String get turma; int get acertos; int get erros; int get emBranco; double get nota;
/// Create a copy of ResultadoExportacao
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultadoExportacaoCopyWith<ResultadoExportacao> get copyWith => _$ResultadoExportacaoCopyWithImpl<ResultadoExportacao>(this as ResultadoExportacao, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ResultadoExportacao;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultadoExportacao&&(identical(other.nome, _this.nome) || other.nome == _this.nome)&&(identical(other.matricula, _this.matricula) || other.matricula == _this.matricula)&&(identical(other.turma, _this.turma) || other.turma == _this.turma)&&(identical(other.acertos, _this.acertos) || other.acertos == _this.acertos)&&(identical(other.erros, _this.erros) || other.erros == _this.erros)&&(identical(other.emBranco, _this.emBranco) || other.emBranco == _this.emBranco)&&(identical(other.nota, _this.nota) || other.nota == _this.nota));
}


@override
int get hashCode {
  final _this = this as ResultadoExportacao;
  return Object.hash(runtimeType,_this.nome,_this.matricula,_this.turma,_this.acertos,_this.erros,_this.emBranco,_this.nota);
}

@override
String toString() {
  final _this = this as ResultadoExportacao;
  return 'ResultadoExportacao(nome: ${_this.nome}, matricula: ${_this.matricula}, turma: ${_this.turma}, acertos: ${_this.acertos}, erros: ${_this.erros}, emBranco: ${_this.emBranco}, nota: ${_this.nota})';
}


}

/// @nodoc
abstract mixin class $ResultadoExportacaoCopyWith<$Res>  {
  factory $ResultadoExportacaoCopyWith(ResultadoExportacao value, $Res Function(ResultadoExportacao) _then) = _$ResultadoExportacaoCopyWithImpl;
@useResult
$Res call({
 String nome, String? matricula, String turma, int acertos, int erros, int emBranco, double nota
});




}
/// @nodoc
class _$ResultadoExportacaoCopyWithImpl<$Res>
    implements $ResultadoExportacaoCopyWith<$Res> {
  _$ResultadoExportacaoCopyWithImpl(this._self, this._then);

  final ResultadoExportacao _self;
  final $Res Function(ResultadoExportacao) _then;

/// Create a copy of ResultadoExportacao
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nome = null,Object? matricula = freezed,Object? turma = null,Object? acertos = null,Object? erros = null,Object? emBranco = null,Object? nota = null,}) {
  return _then(ResultadoExportacao(
nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,matricula: freezed == matricula ? _self.matricula : matricula // ignore: cast_nullable_to_non_nullable
as String?,turma: null == turma ? _self.turma : turma // ignore: cast_nullable_to_non_nullable
as String,acertos: null == acertos ? _self.acertos : acertos // ignore: cast_nullable_to_non_nullable
as int,erros: null == erros ? _self.erros : erros // ignore: cast_nullable_to_non_nullable
as int,emBranco: null == emBranco ? _self.emBranco : emBranco // ignore: cast_nullable_to_non_nullable
as int,nota: null == nota ? _self.nota : nota // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ResultadoExportacao].
extension ResultadoExportacaoPatterns on ResultadoExportacao {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultadoExportacao value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultadoExportacao() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultadoExportacao value)  $default,){
final _that = this;
switch (_that) {
case _ResultadoExportacao():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultadoExportacao value)?  $default,){
final _that = this;
switch (_that) {
case _ResultadoExportacao() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nome,  String? matricula,  String turma,  int acertos,  int erros,  int emBranco,  double nota)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultadoExportacao() when $default != null:
return $default(_that.nome,_that.matricula,_that.turma,_that.acertos,_that.erros,_that.emBranco,_that.nota);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nome,  String? matricula,  String turma,  int acertos,  int erros,  int emBranco,  double nota)  $default,) {final _that = this;
switch (_that) {
case _ResultadoExportacao():
return $default(_that.nome,_that.matricula,_that.turma,_that.acertos,_that.erros,_that.emBranco,_that.nota);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nome,  String? matricula,  String turma,  int acertos,  int erros,  int emBranco,  double nota)?  $default,) {final _that = this;
switch (_that) {
case _ResultadoExportacao() when $default != null:
return $default(_that.nome,_that.matricula,_that.turma,_that.acertos,_that.erros,_that.emBranco,_that.nota);case _:
  return null;

}
}

}

/// @nodoc


class _ResultadoExportacao implements ResultadoExportacao {
  const _ResultadoExportacao({required this.nome, required this.matricula, required this.turma, required this.acertos, required this.erros, required this.emBranco, required this.nota});
  

@override final  String nome;
@override final  String? matricula;
@override final  String turma;
@override final  int acertos;
@override final  int erros;
@override final  int emBranco;
@override final  double nota;

/// Create a copy of ResultadoExportacao
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultadoExportacaoCopyWith<_ResultadoExportacao> get copyWith => __$ResultadoExportacaoCopyWithImpl<_ResultadoExportacao>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultadoExportacao&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.matricula, matricula) || other.matricula == matricula)&&(identical(other.turma, turma) || other.turma == turma)&&(identical(other.acertos, acertos) || other.acertos == acertos)&&(identical(other.erros, erros) || other.erros == erros)&&(identical(other.emBranco, emBranco) || other.emBranco == emBranco)&&(identical(other.nota, nota) || other.nota == nota));
}


@override
int get hashCode {
    return Object.hash(runtimeType,nome,matricula,turma,acertos,erros,emBranco,nota);
}

@override
String toString() {
    return 'ResultadoExportacao(nome: $nome, matricula: $matricula, turma: $turma, acertos: $acertos, erros: $erros, emBranco: $emBranco, nota: $nota)';
}


}

/// @nodoc
abstract mixin class _$ResultadoExportacaoCopyWith<$Res> implements $ResultadoExportacaoCopyWith<$Res> {
  factory _$ResultadoExportacaoCopyWith(_ResultadoExportacao value, $Res Function(_ResultadoExportacao) _then) = __$ResultadoExportacaoCopyWithImpl;
@override @useResult
$Res call({
 String nome, String? matricula, String turma, int acertos, int erros, int emBranco, double nota
});




}
/// @nodoc
class __$ResultadoExportacaoCopyWithImpl<$Res>
    implements _$ResultadoExportacaoCopyWith<$Res> {
  __$ResultadoExportacaoCopyWithImpl(this._self, this._then);

  final _ResultadoExportacao _self;
  final $Res Function(_ResultadoExportacao) _then;

/// Create a copy of ResultadoExportacao
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nome = null,Object? matricula = freezed,Object? turma = null,Object? acertos = null,Object? erros = null,Object? emBranco = null,Object? nota = null,}) {
  return _then(_ResultadoExportacao(
nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,matricula: freezed == matricula ? _self.matricula : matricula // ignore: cast_nullable_to_non_nullable
as String?,turma: null == turma ? _self.turma : turma // ignore: cast_nullable_to_non_nullable
as String,acertos: null == acertos ? _self.acertos : acertos // ignore: cast_nullable_to_non_nullable
as int,erros: null == erros ? _self.erros : erros // ignore: cast_nullable_to_non_nullable
as int,emBranco: null == emBranco ? _self.emBranco : emBranco // ignore: cast_nullable_to_non_nullable
as int,nota: null == nota ? _self.nota : nota // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
