// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estatisticas_prova.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuestaoDaProva {

 int get questaoId; int get ordem;/// Quantidade de alternativas cadastradas; define as letras exibidas (A, B, C...).
 int get totalAlternativas;
/// Create a copy of QuestaoDaProva
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestaoDaProvaCopyWith<QuestaoDaProva> get copyWith => _$QuestaoDaProvaCopyWithImpl<QuestaoDaProva>(this as QuestaoDaProva, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as QuestaoDaProva;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestaoDaProva&&(identical(other.questaoId, _this.questaoId) || other.questaoId == _this.questaoId)&&(identical(other.ordem, _this.ordem) || other.ordem == _this.ordem)&&(identical(other.totalAlternativas, _this.totalAlternativas) || other.totalAlternativas == _this.totalAlternativas));
}


@override
int get hashCode {
  final _this = this as QuestaoDaProva;
  return Object.hash(runtimeType,_this.questaoId,_this.ordem,_this.totalAlternativas);
}

@override
String toString() {
  final _this = this as QuestaoDaProva;
  return 'QuestaoDaProva(questaoId: ${_this.questaoId}, ordem: ${_this.ordem}, totalAlternativas: ${_this.totalAlternativas})';
}


}

/// @nodoc
abstract mixin class $QuestaoDaProvaCopyWith<$Res>  {
  factory $QuestaoDaProvaCopyWith(QuestaoDaProva value, $Res Function(QuestaoDaProva) _then) = _$QuestaoDaProvaCopyWithImpl;
@useResult
$Res call({
 int questaoId, int ordem, int totalAlternativas
});




}
/// @nodoc
class _$QuestaoDaProvaCopyWithImpl<$Res>
    implements $QuestaoDaProvaCopyWith<$Res> {
  _$QuestaoDaProvaCopyWithImpl(this._self, this._then);

  final QuestaoDaProva _self;
  final $Res Function(QuestaoDaProva) _then;

/// Create a copy of QuestaoDaProva
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questaoId = null,Object? ordem = null,Object? totalAlternativas = null,}) {
  return _then(QuestaoDaProva(
questaoId: null == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int,ordem: null == ordem ? _self.ordem : ordem // ignore: cast_nullable_to_non_nullable
as int,totalAlternativas: null == totalAlternativas ? _self.totalAlternativas : totalAlternativas // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestaoDaProva].
extension QuestaoDaProvaPatterns on QuestaoDaProva {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestaoDaProva value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestaoDaProva() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestaoDaProva value)  $default,){
final _that = this;
switch (_that) {
case _QuestaoDaProva():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestaoDaProva value)?  $default,){
final _that = this;
switch (_that) {
case _QuestaoDaProva() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int questaoId,  int ordem,  int totalAlternativas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestaoDaProva() when $default != null:
return $default(_that.questaoId,_that.ordem,_that.totalAlternativas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int questaoId,  int ordem,  int totalAlternativas)  $default,) {final _that = this;
switch (_that) {
case _QuestaoDaProva():
return $default(_that.questaoId,_that.ordem,_that.totalAlternativas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int questaoId,  int ordem,  int totalAlternativas)?  $default,) {final _that = this;
switch (_that) {
case _QuestaoDaProva() when $default != null:
return $default(_that.questaoId,_that.ordem,_that.totalAlternativas);case _:
  return null;

}
}

}

/// @nodoc


class _QuestaoDaProva implements QuestaoDaProva {
  const _QuestaoDaProva({required this.questaoId, required this.ordem, required this.totalAlternativas});
  

@override final  int questaoId;
@override final  int ordem;
/// Quantidade de alternativas cadastradas; define as letras exibidas (A, B, C...).
@override final  int totalAlternativas;

/// Create a copy of QuestaoDaProva
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestaoDaProvaCopyWith<_QuestaoDaProva> get copyWith => __$QuestaoDaProvaCopyWithImpl<_QuestaoDaProva>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestaoDaProva&&(identical(other.questaoId, questaoId) || other.questaoId == questaoId)&&(identical(other.ordem, ordem) || other.ordem == ordem)&&(identical(other.totalAlternativas, totalAlternativas) || other.totalAlternativas == totalAlternativas));
}


@override
int get hashCode {
    return Object.hash(runtimeType,questaoId,ordem,totalAlternativas);
}

@override
String toString() {
    return 'QuestaoDaProva(questaoId: $questaoId, ordem: $ordem, totalAlternativas: $totalAlternativas)';
}


}

/// @nodoc
abstract mixin class _$QuestaoDaProvaCopyWith<$Res> implements $QuestaoDaProvaCopyWith<$Res> {
  factory _$QuestaoDaProvaCopyWith(_QuestaoDaProva value, $Res Function(_QuestaoDaProva) _then) = __$QuestaoDaProvaCopyWithImpl;
@override @useResult
$Res call({
 int questaoId, int ordem, int totalAlternativas
});




}
/// @nodoc
class __$QuestaoDaProvaCopyWithImpl<$Res>
    implements _$QuestaoDaProvaCopyWith<$Res> {
  __$QuestaoDaProvaCopyWithImpl(this._self, this._then);

  final _QuestaoDaProva _self;
  final $Res Function(_QuestaoDaProva) _then;

/// Create a copy of QuestaoDaProva
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questaoId = null,Object? ordem = null,Object? totalAlternativas = null,}) {
  return _then(_QuestaoDaProva(
questaoId: null == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int,ordem: null == ordem ? _self.ordem : ordem // ignore: cast_nullable_to_non_nullable
as int,totalAlternativas: null == totalAlternativas ? _self.totalAlternativas : totalAlternativas // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$RespostaRegistrada {

 int get questaoId;/// Letras marcadas, ex.: "B". Vazio = em branco; "BD" = marcação múltipla.
 String get letrasMarcadas;/// Letra correta no gabarito no momento da correção.
 String get letraCorreta; SituacaoQuestao get situacao; int get corrigidoEm;
/// Create a copy of RespostaRegistrada
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RespostaRegistradaCopyWith<RespostaRegistrada> get copyWith => _$RespostaRegistradaCopyWithImpl<RespostaRegistrada>(this as RespostaRegistrada, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RespostaRegistrada;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RespostaRegistrada&&(identical(other.questaoId, _this.questaoId) || other.questaoId == _this.questaoId)&&(identical(other.letrasMarcadas, _this.letrasMarcadas) || other.letrasMarcadas == _this.letrasMarcadas)&&(identical(other.letraCorreta, _this.letraCorreta) || other.letraCorreta == _this.letraCorreta)&&(identical(other.situacao, _this.situacao) || other.situacao == _this.situacao)&&(identical(other.corrigidoEm, _this.corrigidoEm) || other.corrigidoEm == _this.corrigidoEm));
}


@override
int get hashCode {
  final _this = this as RespostaRegistrada;
  return Object.hash(runtimeType,_this.questaoId,_this.letrasMarcadas,_this.letraCorreta,_this.situacao,_this.corrigidoEm);
}

@override
String toString() {
  final _this = this as RespostaRegistrada;
  return 'RespostaRegistrada(questaoId: ${_this.questaoId}, letrasMarcadas: ${_this.letrasMarcadas}, letraCorreta: ${_this.letraCorreta}, situacao: ${_this.situacao}, corrigidoEm: ${_this.corrigidoEm})';
}


}

/// @nodoc
abstract mixin class $RespostaRegistradaCopyWith<$Res>  {
  factory $RespostaRegistradaCopyWith(RespostaRegistrada value, $Res Function(RespostaRegistrada) _then) = _$RespostaRegistradaCopyWithImpl;
@useResult
$Res call({
 int questaoId, String letrasMarcadas, String letraCorreta, SituacaoQuestao situacao, int corrigidoEm
});




}
/// @nodoc
class _$RespostaRegistradaCopyWithImpl<$Res>
    implements $RespostaRegistradaCopyWith<$Res> {
  _$RespostaRegistradaCopyWithImpl(this._self, this._then);

  final RespostaRegistrada _self;
  final $Res Function(RespostaRegistrada) _then;

/// Create a copy of RespostaRegistrada
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questaoId = null,Object? letrasMarcadas = null,Object? letraCorreta = null,Object? situacao = null,Object? corrigidoEm = null,}) {
  return _then(RespostaRegistrada(
questaoId: null == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int,letrasMarcadas: null == letrasMarcadas ? _self.letrasMarcadas : letrasMarcadas // ignore: cast_nullable_to_non_nullable
as String,letraCorreta: null == letraCorreta ? _self.letraCorreta : letraCorreta // ignore: cast_nullable_to_non_nullable
as String,situacao: null == situacao ? _self.situacao : situacao // ignore: cast_nullable_to_non_nullable
as SituacaoQuestao,corrigidoEm: null == corrigidoEm ? _self.corrigidoEm : corrigidoEm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RespostaRegistrada].
extension RespostaRegistradaPatterns on RespostaRegistrada {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RespostaRegistrada value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RespostaRegistrada() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RespostaRegistrada value)  $default,){
final _that = this;
switch (_that) {
case _RespostaRegistrada():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RespostaRegistrada value)?  $default,){
final _that = this;
switch (_that) {
case _RespostaRegistrada() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int questaoId,  String letrasMarcadas,  String letraCorreta,  SituacaoQuestao situacao,  int corrigidoEm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RespostaRegistrada() when $default != null:
return $default(_that.questaoId,_that.letrasMarcadas,_that.letraCorreta,_that.situacao,_that.corrigidoEm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int questaoId,  String letrasMarcadas,  String letraCorreta,  SituacaoQuestao situacao,  int corrigidoEm)  $default,) {final _that = this;
switch (_that) {
case _RespostaRegistrada():
return $default(_that.questaoId,_that.letrasMarcadas,_that.letraCorreta,_that.situacao,_that.corrigidoEm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int questaoId,  String letrasMarcadas,  String letraCorreta,  SituacaoQuestao situacao,  int corrigidoEm)?  $default,) {final _that = this;
switch (_that) {
case _RespostaRegistrada() when $default != null:
return $default(_that.questaoId,_that.letrasMarcadas,_that.letraCorreta,_that.situacao,_that.corrigidoEm);case _:
  return null;

}
}

}

/// @nodoc


class _RespostaRegistrada implements RespostaRegistrada {
  const _RespostaRegistrada({required this.questaoId, required this.letrasMarcadas, required this.letraCorreta, required this.situacao, required this.corrigidoEm});
  

@override final  int questaoId;
/// Letras marcadas, ex.: "B". Vazio = em branco; "BD" = marcação múltipla.
@override final  String letrasMarcadas;
/// Letra correta no gabarito no momento da correção.
@override final  String letraCorreta;
@override final  SituacaoQuestao situacao;
@override final  int corrigidoEm;

/// Create a copy of RespostaRegistrada
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RespostaRegistradaCopyWith<_RespostaRegistrada> get copyWith => __$RespostaRegistradaCopyWithImpl<_RespostaRegistrada>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RespostaRegistrada&&(identical(other.questaoId, questaoId) || other.questaoId == questaoId)&&(identical(other.letrasMarcadas, letrasMarcadas) || other.letrasMarcadas == letrasMarcadas)&&(identical(other.letraCorreta, letraCorreta) || other.letraCorreta == letraCorreta)&&(identical(other.situacao, situacao) || other.situacao == situacao)&&(identical(other.corrigidoEm, corrigidoEm) || other.corrigidoEm == corrigidoEm));
}


@override
int get hashCode {
    return Object.hash(runtimeType,questaoId,letrasMarcadas,letraCorreta,situacao,corrigidoEm);
}

@override
String toString() {
    return 'RespostaRegistrada(questaoId: $questaoId, letrasMarcadas: $letrasMarcadas, letraCorreta: $letraCorreta, situacao: $situacao, corrigidoEm: $corrigidoEm)';
}


}

/// @nodoc
abstract mixin class _$RespostaRegistradaCopyWith<$Res> implements $RespostaRegistradaCopyWith<$Res> {
  factory _$RespostaRegistradaCopyWith(_RespostaRegistrada value, $Res Function(_RespostaRegistrada) _then) = __$RespostaRegistradaCopyWithImpl;
@override @useResult
$Res call({
 int questaoId, String letrasMarcadas, String letraCorreta, SituacaoQuestao situacao, int corrigidoEm
});




}
/// @nodoc
class __$RespostaRegistradaCopyWithImpl<$Res>
    implements _$RespostaRegistradaCopyWith<$Res> {
  __$RespostaRegistradaCopyWithImpl(this._self, this._then);

  final _RespostaRegistrada _self;
  final $Res Function(_RespostaRegistrada) _then;

/// Create a copy of RespostaRegistrada
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questaoId = null,Object? letrasMarcadas = null,Object? letraCorreta = null,Object? situacao = null,Object? corrigidoEm = null,}) {
  return _then(_RespostaRegistrada(
questaoId: null == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int,letrasMarcadas: null == letrasMarcadas ? _self.letrasMarcadas : letrasMarcadas // ignore: cast_nullable_to_non_nullable
as String,letraCorreta: null == letraCorreta ? _self.letraCorreta : letraCorreta // ignore: cast_nullable_to_non_nullable
as String,situacao: null == situacao ? _self.situacao : situacao // ignore: cast_nullable_to_non_nullable
as SituacaoQuestao,corrigidoEm: null == corrigidoEm ? _self.corrigidoEm : corrigidoEm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
