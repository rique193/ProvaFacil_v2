// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fluxo_correcao.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuestaoParaCorrecao {

 int get questaoId; int get numero; List<String> get letras; String? get letraCorreta;
/// Create a copy of QuestaoParaCorrecao
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestaoParaCorrecaoCopyWith<QuestaoParaCorrecao> get copyWith => _$QuestaoParaCorrecaoCopyWithImpl<QuestaoParaCorrecao>(this as QuestaoParaCorrecao, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as QuestaoParaCorrecao;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestaoParaCorrecao&&(identical(other.questaoId, _this.questaoId) || other.questaoId == _this.questaoId)&&(identical(other.numero, _this.numero) || other.numero == _this.numero)&&const DeepCollectionEquality().equals(other.letras, _this.letras)&&(identical(other.letraCorreta, _this.letraCorreta) || other.letraCorreta == _this.letraCorreta));
}


@override
int get hashCode {
  final _this = this as QuestaoParaCorrecao;
  return Object.hash(runtimeType,_this.questaoId,_this.numero,const DeepCollectionEquality().hash(_this.letras),_this.letraCorreta);
}

@override
String toString() {
  final _this = this as QuestaoParaCorrecao;
  return 'QuestaoParaCorrecao(questaoId: ${_this.questaoId}, numero: ${_this.numero}, letras: ${_this.letras}, letraCorreta: ${_this.letraCorreta})';
}


}

/// @nodoc
abstract mixin class $QuestaoParaCorrecaoCopyWith<$Res>  {
  factory $QuestaoParaCorrecaoCopyWith(QuestaoParaCorrecao value, $Res Function(QuestaoParaCorrecao) _then) = _$QuestaoParaCorrecaoCopyWithImpl;
@useResult
$Res call({
 int questaoId, int numero, List<String> letras, String? letraCorreta
});




}
/// @nodoc
class _$QuestaoParaCorrecaoCopyWithImpl<$Res>
    implements $QuestaoParaCorrecaoCopyWith<$Res> {
  _$QuestaoParaCorrecaoCopyWithImpl(this._self, this._then);

  final QuestaoParaCorrecao _self;
  final $Res Function(QuestaoParaCorrecao) _then;

/// Create a copy of QuestaoParaCorrecao
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questaoId = null,Object? numero = null,Object? letras = null,Object? letraCorreta = freezed,}) {
  return _then(QuestaoParaCorrecao(
questaoId: null == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int,numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,letras: null == letras ? _self.letras : letras // ignore: cast_nullable_to_non_nullable
as List<String>,letraCorreta: freezed == letraCorreta ? _self.letraCorreta : letraCorreta // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestaoParaCorrecao].
extension QuestaoParaCorrecaoPatterns on QuestaoParaCorrecao {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestaoParaCorrecao value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestaoParaCorrecao() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestaoParaCorrecao value)  $default,){
final _that = this;
switch (_that) {
case _QuestaoParaCorrecao():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestaoParaCorrecao value)?  $default,){
final _that = this;
switch (_that) {
case _QuestaoParaCorrecao() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int questaoId,  int numero,  List<String> letras,  String? letraCorreta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestaoParaCorrecao() when $default != null:
return $default(_that.questaoId,_that.numero,_that.letras,_that.letraCorreta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int questaoId,  int numero,  List<String> letras,  String? letraCorreta)  $default,) {final _that = this;
switch (_that) {
case _QuestaoParaCorrecao():
return $default(_that.questaoId,_that.numero,_that.letras,_that.letraCorreta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int questaoId,  int numero,  List<String> letras,  String? letraCorreta)?  $default,) {final _that = this;
switch (_that) {
case _QuestaoParaCorrecao() when $default != null:
return $default(_that.questaoId,_that.numero,_that.letras,_that.letraCorreta);case _:
  return null;

}
}

}

/// @nodoc


class _QuestaoParaCorrecao implements QuestaoParaCorrecao {
  const _QuestaoParaCorrecao({required this.questaoId, required this.numero, required  List<String> letras, required this.letraCorreta}): _letras = letras;
  

@override final  int questaoId;
@override final  int numero;
 final  List<String> _letras;
@override List<String> get letras {
  if (_letras is EqualUnmodifiableListView) return _letras;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_letras);
}

@override final  String? letraCorreta;

/// Create a copy of QuestaoParaCorrecao
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestaoParaCorrecaoCopyWith<_QuestaoParaCorrecao> get copyWith => __$QuestaoParaCorrecaoCopyWithImpl<_QuestaoParaCorrecao>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestaoParaCorrecao&&(identical(other.questaoId, questaoId) || other.questaoId == questaoId)&&(identical(other.numero, numero) || other.numero == numero)&&const DeepCollectionEquality().equals(other.letras, _letras)&&(identical(other.letraCorreta, letraCorreta) || other.letraCorreta == letraCorreta));
}


@override
int get hashCode {
    return Object.hash(runtimeType,questaoId,numero,const DeepCollectionEquality().hash(_letras),letraCorreta);
}

@override
String toString() {
    return 'QuestaoParaCorrecao(questaoId: $questaoId, numero: $numero, letras: $letras, letraCorreta: $letraCorreta)';
}


}

/// @nodoc
abstract mixin class _$QuestaoParaCorrecaoCopyWith<$Res> implements $QuestaoParaCorrecaoCopyWith<$Res> {
  factory _$QuestaoParaCorrecaoCopyWith(_QuestaoParaCorrecao value, $Res Function(_QuestaoParaCorrecao) _then) = __$QuestaoParaCorrecaoCopyWithImpl;
@override @useResult
$Res call({
 int questaoId, int numero, List<String> letras, String? letraCorreta
});




}
/// @nodoc
class __$QuestaoParaCorrecaoCopyWithImpl<$Res>
    implements _$QuestaoParaCorrecaoCopyWith<$Res> {
  __$QuestaoParaCorrecaoCopyWithImpl(this._self, this._then);

  final _QuestaoParaCorrecao _self;
  final $Res Function(_QuestaoParaCorrecao) _then;

/// Create a copy of QuestaoParaCorrecao
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questaoId = null,Object? numero = null,Object? letras = null,Object? letraCorreta = freezed,}) {
  return _then(_QuestaoParaCorrecao(
questaoId: null == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int,numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,letras: null == letras ? _self._letras : letras // ignore: cast_nullable_to_non_nullable
as List<String>,letraCorreta: freezed == letraCorreta ? _self.letraCorreta : letraCorreta // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ProvaParaCorrecao {

 int get provaId; String get titulo; List<QuestaoParaCorrecao> get questoes;
/// Create a copy of ProvaParaCorrecao
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProvaParaCorrecaoCopyWith<ProvaParaCorrecao> get copyWith => _$ProvaParaCorrecaoCopyWithImpl<ProvaParaCorrecao>(this as ProvaParaCorrecao, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProvaParaCorrecao;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProvaParaCorrecao&&(identical(other.provaId, _this.provaId) || other.provaId == _this.provaId)&&(identical(other.titulo, _this.titulo) || other.titulo == _this.titulo)&&const DeepCollectionEquality().equals(other.questoes, _this.questoes));
}


@override
int get hashCode {
  final _this = this as ProvaParaCorrecao;
  return Object.hash(runtimeType,_this.provaId,_this.titulo,const DeepCollectionEquality().hash(_this.questoes));
}

@override
String toString() {
  final _this = this as ProvaParaCorrecao;
  return 'ProvaParaCorrecao(provaId: ${_this.provaId}, titulo: ${_this.titulo}, questoes: ${_this.questoes})';
}


}

/// @nodoc
abstract mixin class $ProvaParaCorrecaoCopyWith<$Res>  {
  factory $ProvaParaCorrecaoCopyWith(ProvaParaCorrecao value, $Res Function(ProvaParaCorrecao) _then) = _$ProvaParaCorrecaoCopyWithImpl;
@useResult
$Res call({
 int provaId, String titulo, List<QuestaoParaCorrecao> questoes
});




}
/// @nodoc
class _$ProvaParaCorrecaoCopyWithImpl<$Res>
    implements $ProvaParaCorrecaoCopyWith<$Res> {
  _$ProvaParaCorrecaoCopyWithImpl(this._self, this._then);

  final ProvaParaCorrecao _self;
  final $Res Function(ProvaParaCorrecao) _then;

/// Create a copy of ProvaParaCorrecao
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provaId = null,Object? titulo = null,Object? questoes = null,}) {
  return _then(ProvaParaCorrecao(
provaId: null == provaId ? _self.provaId : provaId // ignore: cast_nullable_to_non_nullable
as int,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,questoes: null == questoes ? _self.questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<QuestaoParaCorrecao>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProvaParaCorrecao].
extension ProvaParaCorrecaoPatterns on ProvaParaCorrecao {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProvaParaCorrecao value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProvaParaCorrecao() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProvaParaCorrecao value)  $default,){
final _that = this;
switch (_that) {
case _ProvaParaCorrecao():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProvaParaCorrecao value)?  $default,){
final _that = this;
switch (_that) {
case _ProvaParaCorrecao() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int provaId,  String titulo,  List<QuestaoParaCorrecao> questoes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProvaParaCorrecao() when $default != null:
return $default(_that.provaId,_that.titulo,_that.questoes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int provaId,  String titulo,  List<QuestaoParaCorrecao> questoes)  $default,) {final _that = this;
switch (_that) {
case _ProvaParaCorrecao():
return $default(_that.provaId,_that.titulo,_that.questoes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int provaId,  String titulo,  List<QuestaoParaCorrecao> questoes)?  $default,) {final _that = this;
switch (_that) {
case _ProvaParaCorrecao() when $default != null:
return $default(_that.provaId,_that.titulo,_that.questoes);case _:
  return null;

}
}

}

/// @nodoc


class _ProvaParaCorrecao extends ProvaParaCorrecao {
  const _ProvaParaCorrecao({required this.provaId, required this.titulo, required  List<QuestaoParaCorrecao> questoes}): _questoes = questoes,super._();
  

@override final  int provaId;
@override final  String titulo;
 final  List<QuestaoParaCorrecao> _questoes;
@override List<QuestaoParaCorrecao> get questoes {
  if (_questoes is EqualUnmodifiableListView) return _questoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questoes);
}


/// Create a copy of ProvaParaCorrecao
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProvaParaCorrecaoCopyWith<_ProvaParaCorrecao> get copyWith => __$ProvaParaCorrecaoCopyWithImpl<_ProvaParaCorrecao>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProvaParaCorrecao&&(identical(other.provaId, provaId) || other.provaId == provaId)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&const DeepCollectionEquality().equals(other.questoes, _questoes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,provaId,titulo,const DeepCollectionEquality().hash(_questoes));
}

@override
String toString() {
    return 'ProvaParaCorrecao(provaId: $provaId, titulo: $titulo, questoes: $questoes)';
}


}

/// @nodoc
abstract mixin class _$ProvaParaCorrecaoCopyWith<$Res> implements $ProvaParaCorrecaoCopyWith<$Res> {
  factory _$ProvaParaCorrecaoCopyWith(_ProvaParaCorrecao value, $Res Function(_ProvaParaCorrecao) _then) = __$ProvaParaCorrecaoCopyWithImpl;
@override @useResult
$Res call({
 int provaId, String titulo, List<QuestaoParaCorrecao> questoes
});




}
/// @nodoc
class __$ProvaParaCorrecaoCopyWithImpl<$Res>
    implements _$ProvaParaCorrecaoCopyWith<$Res> {
  __$ProvaParaCorrecaoCopyWithImpl(this._self, this._then);

  final _ProvaParaCorrecao _self;
  final $Res Function(_ProvaParaCorrecao) _then;

/// Create a copy of ProvaParaCorrecao
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provaId = null,Object? titulo = null,Object? questoes = null,}) {
  return _then(_ProvaParaCorrecao(
provaId: null == provaId ? _self.provaId : provaId // ignore: cast_nullable_to_non_nullable
as int,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,questoes: null == questoes ? _self._questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<QuestaoParaCorrecao>,
  ));
}


}

/// @nodoc
mixin _$Pronta {

 DadosQrCode get dadosQr; ProvaParaCorrecao get prova; ValidacaoLeitura get validacao;
/// Create a copy of Pronta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProntaCopyWith<Pronta> get copyWith => _$ProntaCopyWithImpl<Pronta>(this as Pronta, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Pronta;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pronta&&(identical(other.dadosQr, _this.dadosQr) || other.dadosQr == _this.dadosQr)&&(identical(other.prova, _this.prova) || other.prova == _this.prova)&&(identical(other.validacao, _this.validacao) || other.validacao == _this.validacao));
}


@override
int get hashCode {
  final _this = this as Pronta;
  return Object.hash(runtimeType,_this.dadosQr,_this.prova,_this.validacao);
}

@override
String toString() {
  final _this = this as Pronta;
  return 'Pronta(dadosQr: ${_this.dadosQr}, prova: ${_this.prova}, validacao: ${_this.validacao})';
}


}

/// @nodoc
abstract mixin class $ProntaCopyWith<$Res>  {
  factory $ProntaCopyWith(Pronta value, $Res Function(Pronta) _then) = _$ProntaCopyWithImpl;
@useResult
$Res call({
 DadosQrCode dadosQr, ProvaParaCorrecao prova, ValidacaoLeitura validacao
});


$DadosQrCodeCopyWith<$Res> get dadosQr;$ProvaParaCorrecaoCopyWith<$Res> get prova;$ValidacaoLeituraCopyWith<$Res> get validacao;

}
/// @nodoc
class _$ProntaCopyWithImpl<$Res>
    implements $ProntaCopyWith<$Res> {
  _$ProntaCopyWithImpl(this._self, this._then);

  final Pronta _self;
  final $Res Function(Pronta) _then;

/// Create a copy of Pronta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dadosQr = null,Object? prova = null,Object? validacao = null,}) {
  return _then(Pronta(
dadosQr: null == dadosQr ? _self.dadosQr : dadosQr // ignore: cast_nullable_to_non_nullable
as DadosQrCode,prova: null == prova ? _self.prova : prova // ignore: cast_nullable_to_non_nullable
as ProvaParaCorrecao,validacao: null == validacao ? _self.validacao : validacao // ignore: cast_nullable_to_non_nullable
as ValidacaoLeitura,
  ));
}
/// Create a copy of Pronta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DadosQrCodeCopyWith<$Res> get dadosQr {
  
  return $DadosQrCodeCopyWith<$Res>(_self.dadosQr, (value) {
    return _then(_self.copyWith(dadosQr: value));
  });
}/// Create a copy of Pronta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvaParaCorrecaoCopyWith<$Res> get prova {
  
  return $ProvaParaCorrecaoCopyWith<$Res>(_self.prova, (value) {
    return _then(_self.copyWith(prova: value));
  });
}/// Create a copy of Pronta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidacaoLeituraCopyWith<$Res> get validacao {
  
  return $ValidacaoLeituraCopyWith<$Res>(_self.validacao, (value) {
    return _then(_self.copyWith(validacao: value));
  });
}
}


/// Adds pattern-matching-related methods to [Pronta].
extension ProntaPatterns on Pronta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pronta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pronta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pronta value)  $default,){
final _that = this;
switch (_that) {
case _Pronta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pronta value)?  $default,){
final _that = this;
switch (_that) {
case _Pronta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DadosQrCode dadosQr,  ProvaParaCorrecao prova,  ValidacaoLeitura validacao)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pronta() when $default != null:
return $default(_that.dadosQr,_that.prova,_that.validacao);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DadosQrCode dadosQr,  ProvaParaCorrecao prova,  ValidacaoLeitura validacao)  $default,) {final _that = this;
switch (_that) {
case _Pronta():
return $default(_that.dadosQr,_that.prova,_that.validacao);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DadosQrCode dadosQr,  ProvaParaCorrecao prova,  ValidacaoLeitura validacao)?  $default,) {final _that = this;
switch (_that) {
case _Pronta() when $default != null:
return $default(_that.dadosQr,_that.prova,_that.validacao);case _:
  return null;

}
}

}

/// @nodoc


class _Pronta extends Pronta {
  const _Pronta({required this.dadosQr, required this.prova, required this.validacao}): super._();
  

@override final  DadosQrCode dadosQr;
@override final  ProvaParaCorrecao prova;
@override final  ValidacaoLeitura validacao;

/// Create a copy of Pronta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProntaCopyWith<_Pronta> get copyWith => __$ProntaCopyWithImpl<_Pronta>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pronta&&(identical(other.dadosQr, dadosQr) || other.dadosQr == dadosQr)&&(identical(other.prova, prova) || other.prova == prova)&&(identical(other.validacao, validacao) || other.validacao == validacao));
}


@override
int get hashCode {
    return Object.hash(runtimeType,dadosQr,prova,validacao);
}

@override
String toString() {
    return 'Pronta(dadosQr: $dadosQr, prova: $prova, validacao: $validacao)';
}


}

/// @nodoc
abstract mixin class _$ProntaCopyWith<$Res> implements $ProntaCopyWith<$Res> {
  factory _$ProntaCopyWith(_Pronta value, $Res Function(_Pronta) _then) = __$ProntaCopyWithImpl;
@override @useResult
$Res call({
 DadosQrCode dadosQr, ProvaParaCorrecao prova, ValidacaoLeitura validacao
});


@override $DadosQrCodeCopyWith<$Res> get dadosQr;@override $ProvaParaCorrecaoCopyWith<$Res> get prova;@override $ValidacaoLeituraCopyWith<$Res> get validacao;

}
/// @nodoc
class __$ProntaCopyWithImpl<$Res>
    implements _$ProntaCopyWith<$Res> {
  __$ProntaCopyWithImpl(this._self, this._then);

  final _Pronta _self;
  final $Res Function(_Pronta) _then;

/// Create a copy of Pronta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dadosQr = null,Object? prova = null,Object? validacao = null,}) {
  return _then(_Pronta(
dadosQr: null == dadosQr ? _self.dadosQr : dadosQr // ignore: cast_nullable_to_non_nullable
as DadosQrCode,prova: null == prova ? _self.prova : prova // ignore: cast_nullable_to_non_nullable
as ProvaParaCorrecao,validacao: null == validacao ? _self.validacao : validacao // ignore: cast_nullable_to_non_nullable
as ValidacaoLeitura,
  ));
}

/// Create a copy of Pronta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DadosQrCodeCopyWith<$Res> get dadosQr {
  
  return $DadosQrCodeCopyWith<$Res>(_self.dadosQr, (value) {
    return _then(_self.copyWith(dadosQr: value));
  });
}/// Create a copy of Pronta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvaParaCorrecaoCopyWith<$Res> get prova {
  
  return $ProvaParaCorrecaoCopyWith<$Res>(_self.prova, (value) {
    return _then(_self.copyWith(prova: value));
  });
}/// Create a copy of Pronta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidacaoLeituraCopyWith<$Res> get validacao {
  
  return $ValidacaoLeituraCopyWith<$Res>(_self.validacao, (value) {
    return _then(_self.copyWith(validacao: value));
  });
}
}

/// @nodoc
mixin _$Bloqueada {

 MotivoBloqueio get motivo; String get mensagem; DadosQrCode? get dadosQr;
/// Create a copy of Bloqueada
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BloqueadaCopyWith<Bloqueada> get copyWith => _$BloqueadaCopyWithImpl<Bloqueada>(this as Bloqueada, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Bloqueada;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bloqueada&&(identical(other.motivo, _this.motivo) || other.motivo == _this.motivo)&&(identical(other.mensagem, _this.mensagem) || other.mensagem == _this.mensagem)&&(identical(other.dadosQr, _this.dadosQr) || other.dadosQr == _this.dadosQr));
}


@override
int get hashCode {
  final _this = this as Bloqueada;
  return Object.hash(runtimeType,_this.motivo,_this.mensagem,_this.dadosQr);
}

@override
String toString() {
  final _this = this as Bloqueada;
  return 'Bloqueada(motivo: ${_this.motivo}, mensagem: ${_this.mensagem}, dadosQr: ${_this.dadosQr})';
}


}

/// @nodoc
abstract mixin class $BloqueadaCopyWith<$Res>  {
  factory $BloqueadaCopyWith(Bloqueada value, $Res Function(Bloqueada) _then) = _$BloqueadaCopyWithImpl;
@useResult
$Res call({
 MotivoBloqueio motivo, String mensagem, DadosQrCode? dadosQr
});


$DadosQrCodeCopyWith<$Res>? get dadosQr;

}
/// @nodoc
class _$BloqueadaCopyWithImpl<$Res>
    implements $BloqueadaCopyWith<$Res> {
  _$BloqueadaCopyWithImpl(this._self, this._then);

  final Bloqueada _self;
  final $Res Function(Bloqueada) _then;

/// Create a copy of Bloqueada
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? motivo = null,Object? mensagem = null,Object? dadosQr = freezed,}) {
  return _then(Bloqueada(
motivo: null == motivo ? _self.motivo : motivo // ignore: cast_nullable_to_non_nullable
as MotivoBloqueio,mensagem: null == mensagem ? _self.mensagem : mensagem // ignore: cast_nullable_to_non_nullable
as String,dadosQr: freezed == dadosQr ? _self.dadosQr : dadosQr // ignore: cast_nullable_to_non_nullable
as DadosQrCode?,
  ));
}
/// Create a copy of Bloqueada
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DadosQrCodeCopyWith<$Res>? get dadosQr {
    if (_self.dadosQr == null) {
    return null;
  }

  return $DadosQrCodeCopyWith<$Res>(_self.dadosQr!, (value) {
    return _then(_self.copyWith(dadosQr: value));
  });
}
}


/// Adds pattern-matching-related methods to [Bloqueada].
extension BloqueadaPatterns on Bloqueada {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Bloqueada value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Bloqueada() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Bloqueada value)  $default,){
final _that = this;
switch (_that) {
case _Bloqueada():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Bloqueada value)?  $default,){
final _that = this;
switch (_that) {
case _Bloqueada() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MotivoBloqueio motivo,  String mensagem,  DadosQrCode? dadosQr)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bloqueada() when $default != null:
return $default(_that.motivo,_that.mensagem,_that.dadosQr);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MotivoBloqueio motivo,  String mensagem,  DadosQrCode? dadosQr)  $default,) {final _that = this;
switch (_that) {
case _Bloqueada():
return $default(_that.motivo,_that.mensagem,_that.dadosQr);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MotivoBloqueio motivo,  String mensagem,  DadosQrCode? dadosQr)?  $default,) {final _that = this;
switch (_that) {
case _Bloqueada() when $default != null:
return $default(_that.motivo,_that.mensagem,_that.dadosQr);case _:
  return null;

}
}

}

/// @nodoc


class _Bloqueada extends Bloqueada {
  const _Bloqueada({required this.motivo, required this.mensagem, this.dadosQr}): super._();
  

@override final  MotivoBloqueio motivo;
@override final  String mensagem;
@override final  DadosQrCode? dadosQr;

/// Create a copy of Bloqueada
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BloqueadaCopyWith<_Bloqueada> get copyWith => __$BloqueadaCopyWithImpl<_Bloqueada>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bloqueada&&(identical(other.motivo, motivo) || other.motivo == motivo)&&(identical(other.mensagem, mensagem) || other.mensagem == mensagem)&&(identical(other.dadosQr, dadosQr) || other.dadosQr == dadosQr));
}


@override
int get hashCode {
    return Object.hash(runtimeType,motivo,mensagem,dadosQr);
}

@override
String toString() {
    return 'Bloqueada(motivo: $motivo, mensagem: $mensagem, dadosQr: $dadosQr)';
}


}

/// @nodoc
abstract mixin class _$BloqueadaCopyWith<$Res> implements $BloqueadaCopyWith<$Res> {
  factory _$BloqueadaCopyWith(_Bloqueada value, $Res Function(_Bloqueada) _then) = __$BloqueadaCopyWithImpl;
@override @useResult
$Res call({
 MotivoBloqueio motivo, String mensagem, DadosQrCode? dadosQr
});


@override $DadosQrCodeCopyWith<$Res>? get dadosQr;

}
/// @nodoc
class __$BloqueadaCopyWithImpl<$Res>
    implements _$BloqueadaCopyWith<$Res> {
  __$BloqueadaCopyWithImpl(this._self, this._then);

  final _Bloqueada _self;
  final $Res Function(_Bloqueada) _then;

/// Create a copy of Bloqueada
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? motivo = null,Object? mensagem = null,Object? dadosQr = freezed,}) {
  return _then(_Bloqueada(
motivo: null == motivo ? _self.motivo : motivo // ignore: cast_nullable_to_non_nullable
as MotivoBloqueio,mensagem: null == mensagem ? _self.mensagem : mensagem // ignore: cast_nullable_to_non_nullable
as String,dadosQr: freezed == dadosQr ? _self.dadosQr : dadosQr // ignore: cast_nullable_to_non_nullable
as DadosQrCode?,
  ));
}

/// Create a copy of Bloqueada
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DadosQrCodeCopyWith<$Res>? get dadosQr {
    if (_self.dadosQr == null) {
    return null;
  }

  return $DadosQrCodeCopyWith<$Res>(_self.dadosQr!, (value) {
    return _then(_self.copyWith(dadosQr: value));
  });
}
}

// dart format on
