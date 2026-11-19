// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validador_correcao.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EstruturaQuestao {

 int get numero; List<String> get letras;
/// Create a copy of EstruturaQuestao
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EstruturaQuestaoCopyWith<EstruturaQuestao> get copyWith => _$EstruturaQuestaoCopyWithImpl<EstruturaQuestao>(this as EstruturaQuestao, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EstruturaQuestao;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EstruturaQuestao&&(identical(other.numero, _this.numero) || other.numero == _this.numero)&&const DeepCollectionEquality().equals(other.letras, _this.letras));
}


@override
int get hashCode {
  final _this = this as EstruturaQuestao;
  return Object.hash(runtimeType,_this.numero,const DeepCollectionEquality().hash(_this.letras));
}

@override
String toString() {
  final _this = this as EstruturaQuestao;
  return 'EstruturaQuestao(numero: ${_this.numero}, letras: ${_this.letras})';
}


}

/// @nodoc
abstract mixin class $EstruturaQuestaoCopyWith<$Res>  {
  factory $EstruturaQuestaoCopyWith(EstruturaQuestao value, $Res Function(EstruturaQuestao) _then) = _$EstruturaQuestaoCopyWithImpl;
@useResult
$Res call({
 int numero, List<String> letras
});




}
/// @nodoc
class _$EstruturaQuestaoCopyWithImpl<$Res>
    implements $EstruturaQuestaoCopyWith<$Res> {
  _$EstruturaQuestaoCopyWithImpl(this._self, this._then);

  final EstruturaQuestao _self;
  final $Res Function(EstruturaQuestao) _then;

/// Create a copy of EstruturaQuestao
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? numero = null,Object? letras = null,}) {
  return _then(EstruturaQuestao(
numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,letras: null == letras ? _self.letras : letras // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [EstruturaQuestao].
extension EstruturaQuestaoPatterns on EstruturaQuestao {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EstruturaQuestao value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EstruturaQuestao() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EstruturaQuestao value)  $default,){
final _that = this;
switch (_that) {
case _EstruturaQuestao():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EstruturaQuestao value)?  $default,){
final _that = this;
switch (_that) {
case _EstruturaQuestao() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int numero,  List<String> letras)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EstruturaQuestao() when $default != null:
return $default(_that.numero,_that.letras);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int numero,  List<String> letras)  $default,) {final _that = this;
switch (_that) {
case _EstruturaQuestao():
return $default(_that.numero,_that.letras);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int numero,  List<String> letras)?  $default,) {final _that = this;
switch (_that) {
case _EstruturaQuestao() when $default != null:
return $default(_that.numero,_that.letras);case _:
  return null;

}
}

}

/// @nodoc


class _EstruturaQuestao implements EstruturaQuestao {
  const _EstruturaQuestao({required this.numero, required  List<String> letras}): _letras = letras;
  

@override final  int numero;
 final  List<String> _letras;
@override List<String> get letras {
  if (_letras is EqualUnmodifiableListView) return _letras;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_letras);
}


/// Create a copy of EstruturaQuestao
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EstruturaQuestaoCopyWith<_EstruturaQuestao> get copyWith => __$EstruturaQuestaoCopyWithImpl<_EstruturaQuestao>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EstruturaQuestao&&(identical(other.numero, numero) || other.numero == numero)&&const DeepCollectionEquality().equals(other.letras, _letras));
}


@override
int get hashCode {
    return Object.hash(runtimeType,numero,const DeepCollectionEquality().hash(_letras));
}

@override
String toString() {
    return 'EstruturaQuestao(numero: $numero, letras: $letras)';
}


}

/// @nodoc
abstract mixin class _$EstruturaQuestaoCopyWith<$Res> implements $EstruturaQuestaoCopyWith<$Res> {
  factory _$EstruturaQuestaoCopyWith(_EstruturaQuestao value, $Res Function(_EstruturaQuestao) _then) = __$EstruturaQuestaoCopyWithImpl;
@override @useResult
$Res call({
 int numero, List<String> letras
});




}
/// @nodoc
class __$EstruturaQuestaoCopyWithImpl<$Res>
    implements _$EstruturaQuestaoCopyWith<$Res> {
  __$EstruturaQuestaoCopyWithImpl(this._self, this._then);

  final _EstruturaQuestao _self;
  final $Res Function(_EstruturaQuestao) _then;

/// Create a copy of EstruturaQuestao
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? numero = null,Object? letras = null,}) {
  return _then(_EstruturaQuestao(
numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,letras: null == letras ? _self._letras : letras // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
mixin _$ValidacaoLeitura {

 Map<int, Set<String>> get respostas; int get totalQuestoes; List<int> get emBranco; List<int> get marcacaoMultipla; List<int> get foraDaProva; Map<int, Set<String>> get letrasInvalidas;
/// Create a copy of ValidacaoLeitura
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidacaoLeituraCopyWith<ValidacaoLeitura> get copyWith => _$ValidacaoLeituraCopyWithImpl<ValidacaoLeitura>(this as ValidacaoLeitura, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ValidacaoLeitura;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidacaoLeitura&&const DeepCollectionEquality().equals(other.respostas, _this.respostas)&&(identical(other.totalQuestoes, _this.totalQuestoes) || other.totalQuestoes == _this.totalQuestoes)&&const DeepCollectionEquality().equals(other.emBranco, _this.emBranco)&&const DeepCollectionEquality().equals(other.marcacaoMultipla, _this.marcacaoMultipla)&&const DeepCollectionEquality().equals(other.foraDaProva, _this.foraDaProva)&&const DeepCollectionEquality().equals(other.letrasInvalidas, _this.letrasInvalidas));
}


@override
int get hashCode {
  final _this = this as ValidacaoLeitura;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.respostas),_this.totalQuestoes,const DeepCollectionEquality().hash(_this.emBranco),const DeepCollectionEquality().hash(_this.marcacaoMultipla),const DeepCollectionEquality().hash(_this.foraDaProva),const DeepCollectionEquality().hash(_this.letrasInvalidas));
}

@override
String toString() {
  final _this = this as ValidacaoLeitura;
  return 'ValidacaoLeitura(respostas: ${_this.respostas}, totalQuestoes: ${_this.totalQuestoes}, emBranco: ${_this.emBranco}, marcacaoMultipla: ${_this.marcacaoMultipla}, foraDaProva: ${_this.foraDaProva}, letrasInvalidas: ${_this.letrasInvalidas})';
}


}

/// @nodoc
abstract mixin class $ValidacaoLeituraCopyWith<$Res>  {
  factory $ValidacaoLeituraCopyWith(ValidacaoLeitura value, $Res Function(ValidacaoLeitura) _then) = _$ValidacaoLeituraCopyWithImpl;
@useResult
$Res call({
 Map<int, Set<String>> respostas, int totalQuestoes, List<int> emBranco, List<int> marcacaoMultipla, List<int> foraDaProva, Map<int, Set<String>> letrasInvalidas
});




}
/// @nodoc
class _$ValidacaoLeituraCopyWithImpl<$Res>
    implements $ValidacaoLeituraCopyWith<$Res> {
  _$ValidacaoLeituraCopyWithImpl(this._self, this._then);

  final ValidacaoLeitura _self;
  final $Res Function(ValidacaoLeitura) _then;

/// Create a copy of ValidacaoLeitura
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? respostas = null,Object? totalQuestoes = null,Object? emBranco = null,Object? marcacaoMultipla = null,Object? foraDaProva = null,Object? letrasInvalidas = null,}) {
  return _then(ValidacaoLeitura(
respostas: null == respostas ? _self.respostas : respostas // ignore: cast_nullable_to_non_nullable
as Map<int, Set<String>>,totalQuestoes: null == totalQuestoes ? _self.totalQuestoes : totalQuestoes // ignore: cast_nullable_to_non_nullable
as int,emBranco: null == emBranco ? _self.emBranco : emBranco // ignore: cast_nullable_to_non_nullable
as List<int>,marcacaoMultipla: null == marcacaoMultipla ? _self.marcacaoMultipla : marcacaoMultipla // ignore: cast_nullable_to_non_nullable
as List<int>,foraDaProva: null == foraDaProva ? _self.foraDaProva : foraDaProva // ignore: cast_nullable_to_non_nullable
as List<int>,letrasInvalidas: null == letrasInvalidas ? _self.letrasInvalidas : letrasInvalidas // ignore: cast_nullable_to_non_nullable
as Map<int, Set<String>>,
  ));
}

}


/// Adds pattern-matching-related methods to [ValidacaoLeitura].
extension ValidacaoLeituraPatterns on ValidacaoLeitura {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValidacaoLeitura value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValidacaoLeitura() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValidacaoLeitura value)  $default,){
final _that = this;
switch (_that) {
case _ValidacaoLeitura():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValidacaoLeitura value)?  $default,){
final _that = this;
switch (_that) {
case _ValidacaoLeitura() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<int, Set<String>> respostas,  int totalQuestoes,  List<int> emBranco,  List<int> marcacaoMultipla,  List<int> foraDaProva,  Map<int, Set<String>> letrasInvalidas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ValidacaoLeitura() when $default != null:
return $default(_that.respostas,_that.totalQuestoes,_that.emBranco,_that.marcacaoMultipla,_that.foraDaProva,_that.letrasInvalidas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<int, Set<String>> respostas,  int totalQuestoes,  List<int> emBranco,  List<int> marcacaoMultipla,  List<int> foraDaProva,  Map<int, Set<String>> letrasInvalidas)  $default,) {final _that = this;
switch (_that) {
case _ValidacaoLeitura():
return $default(_that.respostas,_that.totalQuestoes,_that.emBranco,_that.marcacaoMultipla,_that.foraDaProva,_that.letrasInvalidas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<int, Set<String>> respostas,  int totalQuestoes,  List<int> emBranco,  List<int> marcacaoMultipla,  List<int> foraDaProva,  Map<int, Set<String>> letrasInvalidas)?  $default,) {final _that = this;
switch (_that) {
case _ValidacaoLeitura() when $default != null:
return $default(_that.respostas,_that.totalQuestoes,_that.emBranco,_that.marcacaoMultipla,_that.foraDaProva,_that.letrasInvalidas);case _:
  return null;

}
}

}

/// @nodoc


class _ValidacaoLeitura extends ValidacaoLeitura {
  const _ValidacaoLeitura({required  Map<int, Set<String>> respostas, required this.totalQuestoes, required  List<int> emBranco, required  List<int> marcacaoMultipla, required  List<int> foraDaProva, required  Map<int, Set<String>> letrasInvalidas}): _respostas = respostas,_emBranco = emBranco,_marcacaoMultipla = marcacaoMultipla,_foraDaProva = foraDaProva,_letrasInvalidas = letrasInvalidas,super._();
  

 final  Map<int, Set<String>> _respostas;
@override Map<int, Set<String>> get respostas {
  if (_respostas is EqualUnmodifiableMapView) return _respostas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_respostas);
}

@override final  int totalQuestoes;
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

 final  List<int> _foraDaProva;
@override List<int> get foraDaProva {
  if (_foraDaProva is EqualUnmodifiableListView) return _foraDaProva;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_foraDaProva);
}

 final  Map<int, Set<String>> _letrasInvalidas;
@override Map<int, Set<String>> get letrasInvalidas {
  if (_letrasInvalidas is EqualUnmodifiableMapView) return _letrasInvalidas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_letrasInvalidas);
}


/// Create a copy of ValidacaoLeitura
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidacaoLeituraCopyWith<_ValidacaoLeitura> get copyWith => __$ValidacaoLeituraCopyWithImpl<_ValidacaoLeitura>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidacaoLeitura&&const DeepCollectionEquality().equals(other.respostas, _respostas)&&(identical(other.totalQuestoes, totalQuestoes) || other.totalQuestoes == totalQuestoes)&&const DeepCollectionEquality().equals(other.emBranco, _emBranco)&&const DeepCollectionEquality().equals(other.marcacaoMultipla, _marcacaoMultipla)&&const DeepCollectionEquality().equals(other.foraDaProva, _foraDaProva)&&const DeepCollectionEquality().equals(other.letrasInvalidas, _letrasInvalidas));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_respostas),totalQuestoes,const DeepCollectionEquality().hash(_emBranco),const DeepCollectionEquality().hash(_marcacaoMultipla),const DeepCollectionEquality().hash(_foraDaProva),const DeepCollectionEquality().hash(_letrasInvalidas));
}

@override
String toString() {
    return 'ValidacaoLeitura(respostas: $respostas, totalQuestoes: $totalQuestoes, emBranco: $emBranco, marcacaoMultipla: $marcacaoMultipla, foraDaProva: $foraDaProva, letrasInvalidas: $letrasInvalidas)';
}


}

/// @nodoc
abstract mixin class _$ValidacaoLeituraCopyWith<$Res> implements $ValidacaoLeituraCopyWith<$Res> {
  factory _$ValidacaoLeituraCopyWith(_ValidacaoLeitura value, $Res Function(_ValidacaoLeitura) _then) = __$ValidacaoLeituraCopyWithImpl;
@override @useResult
$Res call({
 Map<int, Set<String>> respostas, int totalQuestoes, List<int> emBranco, List<int> marcacaoMultipla, List<int> foraDaProva, Map<int, Set<String>> letrasInvalidas
});




}
/// @nodoc
class __$ValidacaoLeituraCopyWithImpl<$Res>
    implements _$ValidacaoLeituraCopyWith<$Res> {
  __$ValidacaoLeituraCopyWithImpl(this._self, this._then);

  final _ValidacaoLeitura _self;
  final $Res Function(_ValidacaoLeitura) _then;

/// Create a copy of ValidacaoLeitura
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? respostas = null,Object? totalQuestoes = null,Object? emBranco = null,Object? marcacaoMultipla = null,Object? foraDaProva = null,Object? letrasInvalidas = null,}) {
  return _then(_ValidacaoLeitura(
respostas: null == respostas ? _self._respostas : respostas // ignore: cast_nullable_to_non_nullable
as Map<int, Set<String>>,totalQuestoes: null == totalQuestoes ? _self.totalQuestoes : totalQuestoes // ignore: cast_nullable_to_non_nullable
as int,emBranco: null == emBranco ? _self._emBranco : emBranco // ignore: cast_nullable_to_non_nullable
as List<int>,marcacaoMultipla: null == marcacaoMultipla ? _self._marcacaoMultipla : marcacaoMultipla // ignore: cast_nullable_to_non_nullable
as List<int>,foraDaProva: null == foraDaProva ? _self._foraDaProva : foraDaProva // ignore: cast_nullable_to_non_nullable
as List<int>,letrasInvalidas: null == letrasInvalidas ? _self._letrasInvalidas : letrasInvalidas // ignore: cast_nullable_to_non_nullable
as Map<int, Set<String>>,
  ));
}


}

/// @nodoc
mixin _$ProvaSemQuestoes {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProvaSemQuestoes);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProvaSemQuestoes()';
}


}

/// @nodoc
class $ProvaSemQuestoesCopyWith<$Res>  {
$ProvaSemQuestoesCopyWith(ProvaSemQuestoes _, $Res Function(ProvaSemQuestoes) __);
}


/// Adds pattern-matching-related methods to [ProvaSemQuestoes].
extension ProvaSemQuestoesPatterns on ProvaSemQuestoes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProvaSemQuestoes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProvaSemQuestoes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProvaSemQuestoes value)  $default,){
final _that = this;
switch (_that) {
case _ProvaSemQuestoes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProvaSemQuestoes value)?  $default,){
final _that = this;
switch (_that) {
case _ProvaSemQuestoes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function()?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProvaSemQuestoes() when $default != null:
return $default();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function()  $default,) {final _that = this;
switch (_that) {
case _ProvaSemQuestoes():
return $default();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function()?  $default,) {final _that = this;
switch (_that) {
case _ProvaSemQuestoes() when $default != null:
return $default();case _:
  return null;

}
}

}

/// @nodoc


class _ProvaSemQuestoes extends ProvaSemQuestoes {
  const _ProvaSemQuestoes(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProvaSemQuestoes);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProvaSemQuestoes()';
}


}




/// @nodoc
mixin _$ProvaSemGabarito {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProvaSemGabarito);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProvaSemGabarito()';
}


}

/// @nodoc
class $ProvaSemGabaritoCopyWith<$Res>  {
$ProvaSemGabaritoCopyWith(ProvaSemGabarito _, $Res Function(ProvaSemGabarito) __);
}


/// Adds pattern-matching-related methods to [ProvaSemGabarito].
extension ProvaSemGabaritoPatterns on ProvaSemGabarito {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProvaSemGabarito value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProvaSemGabarito() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProvaSemGabarito value)  $default,){
final _that = this;
switch (_that) {
case _ProvaSemGabarito():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProvaSemGabarito value)?  $default,){
final _that = this;
switch (_that) {
case _ProvaSemGabarito() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function()?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProvaSemGabarito() when $default != null:
return $default();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function()  $default,) {final _that = this;
switch (_that) {
case _ProvaSemGabarito():
return $default();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function()?  $default,) {final _that = this;
switch (_that) {
case _ProvaSemGabarito() when $default != null:
return $default();case _:
  return null;

}
}

}

/// @nodoc


class _ProvaSemGabarito extends ProvaSemGabarito {
  const _ProvaSemGabarito(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProvaSemGabarito);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProvaSemGabarito()';
}


}




/// @nodoc
mixin _$GabaritoIncompleto {

 List<int> get questoes;
/// Create a copy of GabaritoIncompleto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GabaritoIncompletoCopyWith<GabaritoIncompleto> get copyWith => _$GabaritoIncompletoCopyWithImpl<GabaritoIncompleto>(this as GabaritoIncompleto, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GabaritoIncompleto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GabaritoIncompleto&&const DeepCollectionEquality().equals(other.questoes, _this.questoes));
}


@override
int get hashCode {
  final _this = this as GabaritoIncompleto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.questoes));
}

@override
String toString() {
  final _this = this as GabaritoIncompleto;
  return 'GabaritoIncompleto(questoes: ${_this.questoes})';
}


}

/// @nodoc
abstract mixin class $GabaritoIncompletoCopyWith<$Res>  {
  factory $GabaritoIncompletoCopyWith(GabaritoIncompleto value, $Res Function(GabaritoIncompleto) _then) = _$GabaritoIncompletoCopyWithImpl;
@useResult
$Res call({
 List<int> questoes
});




}
/// @nodoc
class _$GabaritoIncompletoCopyWithImpl<$Res>
    implements $GabaritoIncompletoCopyWith<$Res> {
  _$GabaritoIncompletoCopyWithImpl(this._self, this._then);

  final GabaritoIncompleto _self;
  final $Res Function(GabaritoIncompleto) _then;

/// Create a copy of GabaritoIncompleto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questoes = null,}) {
  return _then(GabaritoIncompleto(
null == questoes ? _self.questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [GabaritoIncompleto].
extension GabaritoIncompletoPatterns on GabaritoIncompleto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GabaritoIncompleto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GabaritoIncompleto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GabaritoIncompleto value)  $default,){
final _that = this;
switch (_that) {
case _GabaritoIncompleto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GabaritoIncompleto value)?  $default,){
final _that = this;
switch (_that) {
case _GabaritoIncompleto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> questoes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GabaritoIncompleto() when $default != null:
return $default(_that.questoes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> questoes)  $default,) {final _that = this;
switch (_that) {
case _GabaritoIncompleto():
return $default(_that.questoes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> questoes)?  $default,) {final _that = this;
switch (_that) {
case _GabaritoIncompleto() when $default != null:
return $default(_that.questoes);case _:
  return null;

}
}

}

/// @nodoc


class _GabaritoIncompleto extends GabaritoIncompleto {
  const _GabaritoIncompleto( List<int> questoes): _questoes = questoes,super._();
  

 final  List<int> _questoes;
@override List<int> get questoes {
  if (_questoes is EqualUnmodifiableListView) return _questoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questoes);
}


/// Create a copy of GabaritoIncompleto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GabaritoIncompletoCopyWith<_GabaritoIncompleto> get copyWith => __$GabaritoIncompletoCopyWithImpl<_GabaritoIncompleto>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GabaritoIncompleto&&const DeepCollectionEquality().equals(other.questoes, _questoes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_questoes));
}

@override
String toString() {
    return 'GabaritoIncompleto(questoes: $questoes)';
}


}

/// @nodoc
abstract mixin class _$GabaritoIncompletoCopyWith<$Res> implements $GabaritoIncompletoCopyWith<$Res> {
  factory _$GabaritoIncompletoCopyWith(_GabaritoIncompleto value, $Res Function(_GabaritoIncompleto) _then) = __$GabaritoIncompletoCopyWithImpl;
@override @useResult
$Res call({
 List<int> questoes
});




}
/// @nodoc
class __$GabaritoIncompletoCopyWithImpl<$Res>
    implements _$GabaritoIncompletoCopyWith<$Res> {
  __$GabaritoIncompletoCopyWithImpl(this._self, this._then);

  final _GabaritoIncompleto _self;
  final $Res Function(_GabaritoIncompleto) _then;

/// Create a copy of GabaritoIncompleto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questoes = null,}) {
  return _then(_GabaritoIncompleto(
null == questoes ? _self._questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
