// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estatisticas_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlternativaDistribuicaoUiState {

 String get letra; int get quantidade; bool get ehGabarito; bool get ehMaisMarcada;
/// Create a copy of AlternativaDistribuicaoUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlternativaDistribuicaoUiStateCopyWith<AlternativaDistribuicaoUiState> get copyWith => _$AlternativaDistribuicaoUiStateCopyWithImpl<AlternativaDistribuicaoUiState>(this as AlternativaDistribuicaoUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AlternativaDistribuicaoUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlternativaDistribuicaoUiState&&(identical(other.letra, _this.letra) || other.letra == _this.letra)&&(identical(other.quantidade, _this.quantidade) || other.quantidade == _this.quantidade)&&(identical(other.ehGabarito, _this.ehGabarito) || other.ehGabarito == _this.ehGabarito)&&(identical(other.ehMaisMarcada, _this.ehMaisMarcada) || other.ehMaisMarcada == _this.ehMaisMarcada));
}


@override
int get hashCode {
  final _this = this as AlternativaDistribuicaoUiState;
  return Object.hash(runtimeType,_this.letra,_this.quantidade,_this.ehGabarito,_this.ehMaisMarcada);
}

@override
String toString() {
  final _this = this as AlternativaDistribuicaoUiState;
  return 'AlternativaDistribuicaoUiState(letra: ${_this.letra}, quantidade: ${_this.quantidade}, ehGabarito: ${_this.ehGabarito}, ehMaisMarcada: ${_this.ehMaisMarcada})';
}


}

/// @nodoc
abstract mixin class $AlternativaDistribuicaoUiStateCopyWith<$Res>  {
  factory $AlternativaDistribuicaoUiStateCopyWith(AlternativaDistribuicaoUiState value, $Res Function(AlternativaDistribuicaoUiState) _then) = _$AlternativaDistribuicaoUiStateCopyWithImpl;
@useResult
$Res call({
 String letra, int quantidade, bool ehGabarito, bool ehMaisMarcada
});




}
/// @nodoc
class _$AlternativaDistribuicaoUiStateCopyWithImpl<$Res>
    implements $AlternativaDistribuicaoUiStateCopyWith<$Res> {
  _$AlternativaDistribuicaoUiStateCopyWithImpl(this._self, this._then);

  final AlternativaDistribuicaoUiState _self;
  final $Res Function(AlternativaDistribuicaoUiState) _then;

/// Create a copy of AlternativaDistribuicaoUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? letra = null,Object? quantidade = null,Object? ehGabarito = null,Object? ehMaisMarcada = null,}) {
  return _then(AlternativaDistribuicaoUiState(
letra: null == letra ? _self.letra : letra // ignore: cast_nullable_to_non_nullable
as String,quantidade: null == quantidade ? _self.quantidade : quantidade // ignore: cast_nullable_to_non_nullable
as int,ehGabarito: null == ehGabarito ? _self.ehGabarito : ehGabarito // ignore: cast_nullable_to_non_nullable
as bool,ehMaisMarcada: null == ehMaisMarcada ? _self.ehMaisMarcada : ehMaisMarcada // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AlternativaDistribuicaoUiState].
extension AlternativaDistribuicaoUiStatePatterns on AlternativaDistribuicaoUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlternativaDistribuicaoUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlternativaDistribuicaoUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlternativaDistribuicaoUiState value)  $default,){
final _that = this;
switch (_that) {
case _AlternativaDistribuicaoUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlternativaDistribuicaoUiState value)?  $default,){
final _that = this;
switch (_that) {
case _AlternativaDistribuicaoUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String letra,  int quantidade,  bool ehGabarito,  bool ehMaisMarcada)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlternativaDistribuicaoUiState() when $default != null:
return $default(_that.letra,_that.quantidade,_that.ehGabarito,_that.ehMaisMarcada);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String letra,  int quantidade,  bool ehGabarito,  bool ehMaisMarcada)  $default,) {final _that = this;
switch (_that) {
case _AlternativaDistribuicaoUiState():
return $default(_that.letra,_that.quantidade,_that.ehGabarito,_that.ehMaisMarcada);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String letra,  int quantidade,  bool ehGabarito,  bool ehMaisMarcada)?  $default,) {final _that = this;
switch (_that) {
case _AlternativaDistribuicaoUiState() when $default != null:
return $default(_that.letra,_that.quantidade,_that.ehGabarito,_that.ehMaisMarcada);case _:
  return null;

}
}

}

/// @nodoc


class _AlternativaDistribuicaoUiState implements AlternativaDistribuicaoUiState {
  const _AlternativaDistribuicaoUiState({required this.letra, required this.quantidade, required this.ehGabarito, required this.ehMaisMarcada});
  

@override final  String letra;
@override final  int quantidade;
@override final  bool ehGabarito;
@override final  bool ehMaisMarcada;

/// Create a copy of AlternativaDistribuicaoUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlternativaDistribuicaoUiStateCopyWith<_AlternativaDistribuicaoUiState> get copyWith => __$AlternativaDistribuicaoUiStateCopyWithImpl<_AlternativaDistribuicaoUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlternativaDistribuicaoUiState&&(identical(other.letra, letra) || other.letra == letra)&&(identical(other.quantidade, quantidade) || other.quantidade == quantidade)&&(identical(other.ehGabarito, ehGabarito) || other.ehGabarito == ehGabarito)&&(identical(other.ehMaisMarcada, ehMaisMarcada) || other.ehMaisMarcada == ehMaisMarcada));
}


@override
int get hashCode {
    return Object.hash(runtimeType,letra,quantidade,ehGabarito,ehMaisMarcada);
}

@override
String toString() {
    return 'AlternativaDistribuicaoUiState(letra: $letra, quantidade: $quantidade, ehGabarito: $ehGabarito, ehMaisMarcada: $ehMaisMarcada)';
}


}

/// @nodoc
abstract mixin class _$AlternativaDistribuicaoUiStateCopyWith<$Res> implements $AlternativaDistribuicaoUiStateCopyWith<$Res> {
  factory _$AlternativaDistribuicaoUiStateCopyWith(_AlternativaDistribuicaoUiState value, $Res Function(_AlternativaDistribuicaoUiState) _then) = __$AlternativaDistribuicaoUiStateCopyWithImpl;
@override @useResult
$Res call({
 String letra, int quantidade, bool ehGabarito, bool ehMaisMarcada
});




}
/// @nodoc
class __$AlternativaDistribuicaoUiStateCopyWithImpl<$Res>
    implements _$AlternativaDistribuicaoUiStateCopyWith<$Res> {
  __$AlternativaDistribuicaoUiStateCopyWithImpl(this._self, this._then);

  final _AlternativaDistribuicaoUiState _self;
  final $Res Function(_AlternativaDistribuicaoUiState) _then;

/// Create a copy of AlternativaDistribuicaoUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? letra = null,Object? quantidade = null,Object? ehGabarito = null,Object? ehMaisMarcada = null,}) {
  return _then(_AlternativaDistribuicaoUiState(
letra: null == letra ? _self.letra : letra // ignore: cast_nullable_to_non_nullable
as String,quantidade: null == quantidade ? _self.quantidade : quantidade // ignore: cast_nullable_to_non_nullable
as int,ehGabarito: null == ehGabarito ? _self.ehGabarito : ehGabarito // ignore: cast_nullable_to_non_nullable
as bool,ehMaisMarcada: null == ehMaisMarcada ? _self.ehMaisMarcada : ehMaisMarcada // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$QuestaoEstatisticaUiState {

 int get numero;/// `null` quando a questão não tem respostas registradas.
 double? get percentualAcerto; String? get letraDoGabarito; List<AlternativaDistribuicaoUiState> get distribuicao; int get totalRespostas; int get quantidadeEmBranco; int get quantidadeMultipla; String? get alternativaMaisMarcada; bool get divergeDoGabarito; bool get gabaritoAlterado;
/// Create a copy of QuestaoEstatisticaUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestaoEstatisticaUiStateCopyWith<QuestaoEstatisticaUiState> get copyWith => _$QuestaoEstatisticaUiStateCopyWithImpl<QuestaoEstatisticaUiState>(this as QuestaoEstatisticaUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as QuestaoEstatisticaUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestaoEstatisticaUiState&&(identical(other.numero, _this.numero) || other.numero == _this.numero)&&(identical(other.percentualAcerto, _this.percentualAcerto) || other.percentualAcerto == _this.percentualAcerto)&&(identical(other.letraDoGabarito, _this.letraDoGabarito) || other.letraDoGabarito == _this.letraDoGabarito)&&const DeepCollectionEquality().equals(other.distribuicao, _this.distribuicao)&&(identical(other.totalRespostas, _this.totalRespostas) || other.totalRespostas == _this.totalRespostas)&&(identical(other.quantidadeEmBranco, _this.quantidadeEmBranco) || other.quantidadeEmBranco == _this.quantidadeEmBranco)&&(identical(other.quantidadeMultipla, _this.quantidadeMultipla) || other.quantidadeMultipla == _this.quantidadeMultipla)&&(identical(other.alternativaMaisMarcada, _this.alternativaMaisMarcada) || other.alternativaMaisMarcada == _this.alternativaMaisMarcada)&&(identical(other.divergeDoGabarito, _this.divergeDoGabarito) || other.divergeDoGabarito == _this.divergeDoGabarito)&&(identical(other.gabaritoAlterado, _this.gabaritoAlterado) || other.gabaritoAlterado == _this.gabaritoAlterado));
}


@override
int get hashCode {
  final _this = this as QuestaoEstatisticaUiState;
  return Object.hash(runtimeType,_this.numero,_this.percentualAcerto,_this.letraDoGabarito,const DeepCollectionEquality().hash(_this.distribuicao),_this.totalRespostas,_this.quantidadeEmBranco,_this.quantidadeMultipla,_this.alternativaMaisMarcada,_this.divergeDoGabarito,_this.gabaritoAlterado);
}

@override
String toString() {
  final _this = this as QuestaoEstatisticaUiState;
  return 'QuestaoEstatisticaUiState(numero: ${_this.numero}, percentualAcerto: ${_this.percentualAcerto}, letraDoGabarito: ${_this.letraDoGabarito}, distribuicao: ${_this.distribuicao}, totalRespostas: ${_this.totalRespostas}, quantidadeEmBranco: ${_this.quantidadeEmBranco}, quantidadeMultipla: ${_this.quantidadeMultipla}, alternativaMaisMarcada: ${_this.alternativaMaisMarcada}, divergeDoGabarito: ${_this.divergeDoGabarito}, gabaritoAlterado: ${_this.gabaritoAlterado})';
}


}

/// @nodoc
abstract mixin class $QuestaoEstatisticaUiStateCopyWith<$Res>  {
  factory $QuestaoEstatisticaUiStateCopyWith(QuestaoEstatisticaUiState value, $Res Function(QuestaoEstatisticaUiState) _then) = _$QuestaoEstatisticaUiStateCopyWithImpl;
@useResult
$Res call({
 int numero, double? percentualAcerto, String? letraDoGabarito, List<AlternativaDistribuicaoUiState> distribuicao, int totalRespostas, int quantidadeEmBranco, int quantidadeMultipla, String? alternativaMaisMarcada, bool divergeDoGabarito, bool gabaritoAlterado
});




}
/// @nodoc
class _$QuestaoEstatisticaUiStateCopyWithImpl<$Res>
    implements $QuestaoEstatisticaUiStateCopyWith<$Res> {
  _$QuestaoEstatisticaUiStateCopyWithImpl(this._self, this._then);

  final QuestaoEstatisticaUiState _self;
  final $Res Function(QuestaoEstatisticaUiState) _then;

/// Create a copy of QuestaoEstatisticaUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? numero = null,Object? percentualAcerto = freezed,Object? letraDoGabarito = freezed,Object? distribuicao = null,Object? totalRespostas = null,Object? quantidadeEmBranco = null,Object? quantidadeMultipla = null,Object? alternativaMaisMarcada = freezed,Object? divergeDoGabarito = null,Object? gabaritoAlterado = null,}) {
  return _then(QuestaoEstatisticaUiState(
numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,percentualAcerto: freezed == percentualAcerto ? _self.percentualAcerto : percentualAcerto // ignore: cast_nullable_to_non_nullable
as double?,letraDoGabarito: freezed == letraDoGabarito ? _self.letraDoGabarito : letraDoGabarito // ignore: cast_nullable_to_non_nullable
as String?,distribuicao: null == distribuicao ? _self.distribuicao : distribuicao // ignore: cast_nullable_to_non_nullable
as List<AlternativaDistribuicaoUiState>,totalRespostas: null == totalRespostas ? _self.totalRespostas : totalRespostas // ignore: cast_nullable_to_non_nullable
as int,quantidadeEmBranco: null == quantidadeEmBranco ? _self.quantidadeEmBranco : quantidadeEmBranco // ignore: cast_nullable_to_non_nullable
as int,quantidadeMultipla: null == quantidadeMultipla ? _self.quantidadeMultipla : quantidadeMultipla // ignore: cast_nullable_to_non_nullable
as int,alternativaMaisMarcada: freezed == alternativaMaisMarcada ? _self.alternativaMaisMarcada : alternativaMaisMarcada // ignore: cast_nullable_to_non_nullable
as String?,divergeDoGabarito: null == divergeDoGabarito ? _self.divergeDoGabarito : divergeDoGabarito // ignore: cast_nullable_to_non_nullable
as bool,gabaritoAlterado: null == gabaritoAlterado ? _self.gabaritoAlterado : gabaritoAlterado // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestaoEstatisticaUiState].
extension QuestaoEstatisticaUiStatePatterns on QuestaoEstatisticaUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestaoEstatisticaUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestaoEstatisticaUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestaoEstatisticaUiState value)  $default,){
final _that = this;
switch (_that) {
case _QuestaoEstatisticaUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestaoEstatisticaUiState value)?  $default,){
final _that = this;
switch (_that) {
case _QuestaoEstatisticaUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int numero,  double? percentualAcerto,  String? letraDoGabarito,  List<AlternativaDistribuicaoUiState> distribuicao,  int totalRespostas,  int quantidadeEmBranco,  int quantidadeMultipla,  String? alternativaMaisMarcada,  bool divergeDoGabarito,  bool gabaritoAlterado)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestaoEstatisticaUiState() when $default != null:
return $default(_that.numero,_that.percentualAcerto,_that.letraDoGabarito,_that.distribuicao,_that.totalRespostas,_that.quantidadeEmBranco,_that.quantidadeMultipla,_that.alternativaMaisMarcada,_that.divergeDoGabarito,_that.gabaritoAlterado);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int numero,  double? percentualAcerto,  String? letraDoGabarito,  List<AlternativaDistribuicaoUiState> distribuicao,  int totalRespostas,  int quantidadeEmBranco,  int quantidadeMultipla,  String? alternativaMaisMarcada,  bool divergeDoGabarito,  bool gabaritoAlterado)  $default,) {final _that = this;
switch (_that) {
case _QuestaoEstatisticaUiState():
return $default(_that.numero,_that.percentualAcerto,_that.letraDoGabarito,_that.distribuicao,_that.totalRespostas,_that.quantidadeEmBranco,_that.quantidadeMultipla,_that.alternativaMaisMarcada,_that.divergeDoGabarito,_that.gabaritoAlterado);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int numero,  double? percentualAcerto,  String? letraDoGabarito,  List<AlternativaDistribuicaoUiState> distribuicao,  int totalRespostas,  int quantidadeEmBranco,  int quantidadeMultipla,  String? alternativaMaisMarcada,  bool divergeDoGabarito,  bool gabaritoAlterado)?  $default,) {final _that = this;
switch (_that) {
case _QuestaoEstatisticaUiState() when $default != null:
return $default(_that.numero,_that.percentualAcerto,_that.letraDoGabarito,_that.distribuicao,_that.totalRespostas,_that.quantidadeEmBranco,_that.quantidadeMultipla,_that.alternativaMaisMarcada,_that.divergeDoGabarito,_that.gabaritoAlterado);case _:
  return null;

}
}

}

/// @nodoc


class _QuestaoEstatisticaUiState implements QuestaoEstatisticaUiState {
  const _QuestaoEstatisticaUiState({required this.numero, required this.percentualAcerto, required this.letraDoGabarito, required  List<AlternativaDistribuicaoUiState> distribuicao, required this.totalRespostas, required this.quantidadeEmBranco, required this.quantidadeMultipla, required this.alternativaMaisMarcada, required this.divergeDoGabarito, required this.gabaritoAlterado}): _distribuicao = distribuicao;
  

@override final  int numero;
/// `null` quando a questão não tem respostas registradas.
@override final  double? percentualAcerto;
@override final  String? letraDoGabarito;
 final  List<AlternativaDistribuicaoUiState> _distribuicao;
@override List<AlternativaDistribuicaoUiState> get distribuicao {
  if (_distribuicao is EqualUnmodifiableListView) return _distribuicao;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_distribuicao);
}

@override final  int totalRespostas;
@override final  int quantidadeEmBranco;
@override final  int quantidadeMultipla;
@override final  String? alternativaMaisMarcada;
@override final  bool divergeDoGabarito;
@override final  bool gabaritoAlterado;

/// Create a copy of QuestaoEstatisticaUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestaoEstatisticaUiStateCopyWith<_QuestaoEstatisticaUiState> get copyWith => __$QuestaoEstatisticaUiStateCopyWithImpl<_QuestaoEstatisticaUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestaoEstatisticaUiState&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.percentualAcerto, percentualAcerto) || other.percentualAcerto == percentualAcerto)&&(identical(other.letraDoGabarito, letraDoGabarito) || other.letraDoGabarito == letraDoGabarito)&&const DeepCollectionEquality().equals(other.distribuicao, _distribuicao)&&(identical(other.totalRespostas, totalRespostas) || other.totalRespostas == totalRespostas)&&(identical(other.quantidadeEmBranco, quantidadeEmBranco) || other.quantidadeEmBranco == quantidadeEmBranco)&&(identical(other.quantidadeMultipla, quantidadeMultipla) || other.quantidadeMultipla == quantidadeMultipla)&&(identical(other.alternativaMaisMarcada, alternativaMaisMarcada) || other.alternativaMaisMarcada == alternativaMaisMarcada)&&(identical(other.divergeDoGabarito, divergeDoGabarito) || other.divergeDoGabarito == divergeDoGabarito)&&(identical(other.gabaritoAlterado, gabaritoAlterado) || other.gabaritoAlterado == gabaritoAlterado));
}


@override
int get hashCode {
    return Object.hash(runtimeType,numero,percentualAcerto,letraDoGabarito,const DeepCollectionEquality().hash(_distribuicao),totalRespostas,quantidadeEmBranco,quantidadeMultipla,alternativaMaisMarcada,divergeDoGabarito,gabaritoAlterado);
}

@override
String toString() {
    return 'QuestaoEstatisticaUiState(numero: $numero, percentualAcerto: $percentualAcerto, letraDoGabarito: $letraDoGabarito, distribuicao: $distribuicao, totalRespostas: $totalRespostas, quantidadeEmBranco: $quantidadeEmBranco, quantidadeMultipla: $quantidadeMultipla, alternativaMaisMarcada: $alternativaMaisMarcada, divergeDoGabarito: $divergeDoGabarito, gabaritoAlterado: $gabaritoAlterado)';
}


}

/// @nodoc
abstract mixin class _$QuestaoEstatisticaUiStateCopyWith<$Res> implements $QuestaoEstatisticaUiStateCopyWith<$Res> {
  factory _$QuestaoEstatisticaUiStateCopyWith(_QuestaoEstatisticaUiState value, $Res Function(_QuestaoEstatisticaUiState) _then) = __$QuestaoEstatisticaUiStateCopyWithImpl;
@override @useResult
$Res call({
 int numero, double? percentualAcerto, String? letraDoGabarito, List<AlternativaDistribuicaoUiState> distribuicao, int totalRespostas, int quantidadeEmBranco, int quantidadeMultipla, String? alternativaMaisMarcada, bool divergeDoGabarito, bool gabaritoAlterado
});




}
/// @nodoc
class __$QuestaoEstatisticaUiStateCopyWithImpl<$Res>
    implements _$QuestaoEstatisticaUiStateCopyWith<$Res> {
  __$QuestaoEstatisticaUiStateCopyWithImpl(this._self, this._then);

  final _QuestaoEstatisticaUiState _self;
  final $Res Function(_QuestaoEstatisticaUiState) _then;

/// Create a copy of QuestaoEstatisticaUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? numero = null,Object? percentualAcerto = freezed,Object? letraDoGabarito = freezed,Object? distribuicao = null,Object? totalRespostas = null,Object? quantidadeEmBranco = null,Object? quantidadeMultipla = null,Object? alternativaMaisMarcada = freezed,Object? divergeDoGabarito = null,Object? gabaritoAlterado = null,}) {
  return _then(_QuestaoEstatisticaUiState(
numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,percentualAcerto: freezed == percentualAcerto ? _self.percentualAcerto : percentualAcerto // ignore: cast_nullable_to_non_nullable
as double?,letraDoGabarito: freezed == letraDoGabarito ? _self.letraDoGabarito : letraDoGabarito // ignore: cast_nullable_to_non_nullable
as String?,distribuicao: null == distribuicao ? _self._distribuicao : distribuicao // ignore: cast_nullable_to_non_nullable
as List<AlternativaDistribuicaoUiState>,totalRespostas: null == totalRespostas ? _self.totalRespostas : totalRespostas // ignore: cast_nullable_to_non_nullable
as int,quantidadeEmBranco: null == quantidadeEmBranco ? _self.quantidadeEmBranco : quantidadeEmBranco // ignore: cast_nullable_to_non_nullable
as int,quantidadeMultipla: null == quantidadeMultipla ? _self.quantidadeMultipla : quantidadeMultipla // ignore: cast_nullable_to_non_nullable
as int,alternativaMaisMarcada: freezed == alternativaMaisMarcada ? _self.alternativaMaisMarcada : alternativaMaisMarcada // ignore: cast_nullable_to_non_nullable
as String?,divergeDoGabarito: null == divergeDoGabarito ? _self.divergeDoGabarito : divergeDoGabarito // ignore: cast_nullable_to_non_nullable
as bool,gabaritoAlterado: null == gabaritoAlterado ? _self.gabaritoAlterado : gabaritoAlterado // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$EstatisticasUiState {

 bool get carregando; String get tituloProva; String get disciplina; String get turmas; double get mediaDaTurma; double get maiorNota; double get menorNota; int get totalAlunosCorrigidos; FiltroEstatisticas get filtroSelecionado; List<QuestaoEstatisticaUiState> get todasAsQuestoes; List<QuestaoEstatisticaUiState> get questoesExibidas;
/// Create a copy of EstatisticasUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EstatisticasUiStateCopyWith<EstatisticasUiState> get copyWith => _$EstatisticasUiStateCopyWithImpl<EstatisticasUiState>(this as EstatisticasUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EstatisticasUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EstatisticasUiState&&(identical(other.carregando, _this.carregando) || other.carregando == _this.carregando)&&(identical(other.tituloProva, _this.tituloProva) || other.tituloProva == _this.tituloProva)&&(identical(other.disciplina, _this.disciplina) || other.disciplina == _this.disciplina)&&(identical(other.turmas, _this.turmas) || other.turmas == _this.turmas)&&(identical(other.mediaDaTurma, _this.mediaDaTurma) || other.mediaDaTurma == _this.mediaDaTurma)&&(identical(other.maiorNota, _this.maiorNota) || other.maiorNota == _this.maiorNota)&&(identical(other.menorNota, _this.menorNota) || other.menorNota == _this.menorNota)&&(identical(other.totalAlunosCorrigidos, _this.totalAlunosCorrigidos) || other.totalAlunosCorrigidos == _this.totalAlunosCorrigidos)&&(identical(other.filtroSelecionado, _this.filtroSelecionado) || other.filtroSelecionado == _this.filtroSelecionado)&&const DeepCollectionEquality().equals(other.todasAsQuestoes, _this.todasAsQuestoes)&&const DeepCollectionEquality().equals(other.questoesExibidas, _this.questoesExibidas));
}


@override
int get hashCode {
  final _this = this as EstatisticasUiState;
  return Object.hash(runtimeType,_this.carregando,_this.tituloProva,_this.disciplina,_this.turmas,_this.mediaDaTurma,_this.maiorNota,_this.menorNota,_this.totalAlunosCorrigidos,_this.filtroSelecionado,const DeepCollectionEquality().hash(_this.todasAsQuestoes),const DeepCollectionEquality().hash(_this.questoesExibidas));
}

@override
String toString() {
  final _this = this as EstatisticasUiState;
  return 'EstatisticasUiState(carregando: ${_this.carregando}, tituloProva: ${_this.tituloProva}, disciplina: ${_this.disciplina}, turmas: ${_this.turmas}, mediaDaTurma: ${_this.mediaDaTurma}, maiorNota: ${_this.maiorNota}, menorNota: ${_this.menorNota}, totalAlunosCorrigidos: ${_this.totalAlunosCorrigidos}, filtroSelecionado: ${_this.filtroSelecionado}, todasAsQuestoes: ${_this.todasAsQuestoes}, questoesExibidas: ${_this.questoesExibidas})';
}


}

/// @nodoc
abstract mixin class $EstatisticasUiStateCopyWith<$Res>  {
  factory $EstatisticasUiStateCopyWith(EstatisticasUiState value, $Res Function(EstatisticasUiState) _then) = _$EstatisticasUiStateCopyWithImpl;
@useResult
$Res call({
 bool carregando, String tituloProva, String disciplina, String turmas, double mediaDaTurma, double maiorNota, double menorNota, int totalAlunosCorrigidos, FiltroEstatisticas filtroSelecionado, List<QuestaoEstatisticaUiState> todasAsQuestoes, List<QuestaoEstatisticaUiState> questoesExibidas
});




}
/// @nodoc
class _$EstatisticasUiStateCopyWithImpl<$Res>
    implements $EstatisticasUiStateCopyWith<$Res> {
  _$EstatisticasUiStateCopyWithImpl(this._self, this._then);

  final EstatisticasUiState _self;
  final $Res Function(EstatisticasUiState) _then;

/// Create a copy of EstatisticasUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? carregando = null,Object? tituloProva = null,Object? disciplina = null,Object? turmas = null,Object? mediaDaTurma = null,Object? maiorNota = null,Object? menorNota = null,Object? totalAlunosCorrigidos = null,Object? filtroSelecionado = null,Object? todasAsQuestoes = null,Object? questoesExibidas = null,}) {
  return _then(EstatisticasUiState(
carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,tituloProva: null == tituloProva ? _self.tituloProva : tituloProva // ignore: cast_nullable_to_non_nullable
as String,disciplina: null == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String,turmas: null == turmas ? _self.turmas : turmas // ignore: cast_nullable_to_non_nullable
as String,mediaDaTurma: null == mediaDaTurma ? _self.mediaDaTurma : mediaDaTurma // ignore: cast_nullable_to_non_nullable
as double,maiorNota: null == maiorNota ? _self.maiorNota : maiorNota // ignore: cast_nullable_to_non_nullable
as double,menorNota: null == menorNota ? _self.menorNota : menorNota // ignore: cast_nullable_to_non_nullable
as double,totalAlunosCorrigidos: null == totalAlunosCorrigidos ? _self.totalAlunosCorrigidos : totalAlunosCorrigidos // ignore: cast_nullable_to_non_nullable
as int,filtroSelecionado: null == filtroSelecionado ? _self.filtroSelecionado : filtroSelecionado // ignore: cast_nullable_to_non_nullable
as FiltroEstatisticas,todasAsQuestoes: null == todasAsQuestoes ? _self.todasAsQuestoes : todasAsQuestoes // ignore: cast_nullable_to_non_nullable
as List<QuestaoEstatisticaUiState>,questoesExibidas: null == questoesExibidas ? _self.questoesExibidas : questoesExibidas // ignore: cast_nullable_to_non_nullable
as List<QuestaoEstatisticaUiState>,
  ));
}

}


/// Adds pattern-matching-related methods to [EstatisticasUiState].
extension EstatisticasUiStatePatterns on EstatisticasUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EstatisticasUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EstatisticasUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EstatisticasUiState value)  $default,){
final _that = this;
switch (_that) {
case _EstatisticasUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EstatisticasUiState value)?  $default,){
final _that = this;
switch (_that) {
case _EstatisticasUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool carregando,  String tituloProva,  String disciplina,  String turmas,  double mediaDaTurma,  double maiorNota,  double menorNota,  int totalAlunosCorrigidos,  FiltroEstatisticas filtroSelecionado,  List<QuestaoEstatisticaUiState> todasAsQuestoes,  List<QuestaoEstatisticaUiState> questoesExibidas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EstatisticasUiState() when $default != null:
return $default(_that.carregando,_that.tituloProva,_that.disciplina,_that.turmas,_that.mediaDaTurma,_that.maiorNota,_that.menorNota,_that.totalAlunosCorrigidos,_that.filtroSelecionado,_that.todasAsQuestoes,_that.questoesExibidas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool carregando,  String tituloProva,  String disciplina,  String turmas,  double mediaDaTurma,  double maiorNota,  double menorNota,  int totalAlunosCorrigidos,  FiltroEstatisticas filtroSelecionado,  List<QuestaoEstatisticaUiState> todasAsQuestoes,  List<QuestaoEstatisticaUiState> questoesExibidas)  $default,) {final _that = this;
switch (_that) {
case _EstatisticasUiState():
return $default(_that.carregando,_that.tituloProva,_that.disciplina,_that.turmas,_that.mediaDaTurma,_that.maiorNota,_that.menorNota,_that.totalAlunosCorrigidos,_that.filtroSelecionado,_that.todasAsQuestoes,_that.questoesExibidas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool carregando,  String tituloProva,  String disciplina,  String turmas,  double mediaDaTurma,  double maiorNota,  double menorNota,  int totalAlunosCorrigidos,  FiltroEstatisticas filtroSelecionado,  List<QuestaoEstatisticaUiState> todasAsQuestoes,  List<QuestaoEstatisticaUiState> questoesExibidas)?  $default,) {final _that = this;
switch (_that) {
case _EstatisticasUiState() when $default != null:
return $default(_that.carregando,_that.tituloProva,_that.disciplina,_that.turmas,_that.mediaDaTurma,_that.maiorNota,_that.menorNota,_that.totalAlunosCorrigidos,_that.filtroSelecionado,_that.todasAsQuestoes,_that.questoesExibidas);case _:
  return null;

}
}

}

/// @nodoc


class _EstatisticasUiState implements EstatisticasUiState {
  const _EstatisticasUiState({this.carregando = true, this.tituloProva = '', this.disciplina = '', this.turmas = '', this.mediaDaTurma = 0.0, this.maiorNota = 0.0, this.menorNota = 0.0, this.totalAlunosCorrigidos = 0, this.filtroSelecionado = FiltroEstatisticas.todas,  List<QuestaoEstatisticaUiState> todasAsQuestoes = const <QuestaoEstatisticaUiState>[],  List<QuestaoEstatisticaUiState> questoesExibidas = const <QuestaoEstatisticaUiState>[]}): _todasAsQuestoes = todasAsQuestoes,_questoesExibidas = questoesExibidas;
  

@override@JsonKey() final  bool carregando;
@override@JsonKey() final  String tituloProva;
@override@JsonKey() final  String disciplina;
@override@JsonKey() final  String turmas;
@override@JsonKey() final  double mediaDaTurma;
@override@JsonKey() final  double maiorNota;
@override@JsonKey() final  double menorNota;
@override@JsonKey() final  int totalAlunosCorrigidos;
@override@JsonKey() final  FiltroEstatisticas filtroSelecionado;
 final  List<QuestaoEstatisticaUiState> _todasAsQuestoes;
@override@JsonKey() List<QuestaoEstatisticaUiState> get todasAsQuestoes {
  if (_todasAsQuestoes is EqualUnmodifiableListView) return _todasAsQuestoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_todasAsQuestoes);
}

 final  List<QuestaoEstatisticaUiState> _questoesExibidas;
@override@JsonKey() List<QuestaoEstatisticaUiState> get questoesExibidas {
  if (_questoesExibidas is EqualUnmodifiableListView) return _questoesExibidas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questoesExibidas);
}


/// Create a copy of EstatisticasUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EstatisticasUiStateCopyWith<_EstatisticasUiState> get copyWith => __$EstatisticasUiStateCopyWithImpl<_EstatisticasUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EstatisticasUiState&&(identical(other.carregando, carregando) || other.carregando == carregando)&&(identical(other.tituloProva, tituloProva) || other.tituloProva == tituloProva)&&(identical(other.disciplina, disciplina) || other.disciplina == disciplina)&&(identical(other.turmas, turmas) || other.turmas == turmas)&&(identical(other.mediaDaTurma, mediaDaTurma) || other.mediaDaTurma == mediaDaTurma)&&(identical(other.maiorNota, maiorNota) || other.maiorNota == maiorNota)&&(identical(other.menorNota, menorNota) || other.menorNota == menorNota)&&(identical(other.totalAlunosCorrigidos, totalAlunosCorrigidos) || other.totalAlunosCorrigidos == totalAlunosCorrigidos)&&(identical(other.filtroSelecionado, filtroSelecionado) || other.filtroSelecionado == filtroSelecionado)&&const DeepCollectionEquality().equals(other.todasAsQuestoes, _todasAsQuestoes)&&const DeepCollectionEquality().equals(other.questoesExibidas, _questoesExibidas));
}


@override
int get hashCode {
    return Object.hash(runtimeType,carregando,tituloProva,disciplina,turmas,mediaDaTurma,maiorNota,menorNota,totalAlunosCorrigidos,filtroSelecionado,const DeepCollectionEquality().hash(_todasAsQuestoes),const DeepCollectionEquality().hash(_questoesExibidas));
}

@override
String toString() {
    return 'EstatisticasUiState(carregando: $carregando, tituloProva: $tituloProva, disciplina: $disciplina, turmas: $turmas, mediaDaTurma: $mediaDaTurma, maiorNota: $maiorNota, menorNota: $menorNota, totalAlunosCorrigidos: $totalAlunosCorrigidos, filtroSelecionado: $filtroSelecionado, todasAsQuestoes: $todasAsQuestoes, questoesExibidas: $questoesExibidas)';
}


}

/// @nodoc
abstract mixin class _$EstatisticasUiStateCopyWith<$Res> implements $EstatisticasUiStateCopyWith<$Res> {
  factory _$EstatisticasUiStateCopyWith(_EstatisticasUiState value, $Res Function(_EstatisticasUiState) _then) = __$EstatisticasUiStateCopyWithImpl;
@override @useResult
$Res call({
 bool carregando, String tituloProva, String disciplina, String turmas, double mediaDaTurma, double maiorNota, double menorNota, int totalAlunosCorrigidos, FiltroEstatisticas filtroSelecionado, List<QuestaoEstatisticaUiState> todasAsQuestoes, List<QuestaoEstatisticaUiState> questoesExibidas
});




}
/// @nodoc
class __$EstatisticasUiStateCopyWithImpl<$Res>
    implements _$EstatisticasUiStateCopyWith<$Res> {
  __$EstatisticasUiStateCopyWithImpl(this._self, this._then);

  final _EstatisticasUiState _self;
  final $Res Function(_EstatisticasUiState) _then;

/// Create a copy of EstatisticasUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? carregando = null,Object? tituloProva = null,Object? disciplina = null,Object? turmas = null,Object? mediaDaTurma = null,Object? maiorNota = null,Object? menorNota = null,Object? totalAlunosCorrigidos = null,Object? filtroSelecionado = null,Object? todasAsQuestoes = null,Object? questoesExibidas = null,}) {
  return _then(_EstatisticasUiState(
carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,tituloProva: null == tituloProva ? _self.tituloProva : tituloProva // ignore: cast_nullable_to_non_nullable
as String,disciplina: null == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String,turmas: null == turmas ? _self.turmas : turmas // ignore: cast_nullable_to_non_nullable
as String,mediaDaTurma: null == mediaDaTurma ? _self.mediaDaTurma : mediaDaTurma // ignore: cast_nullable_to_non_nullable
as double,maiorNota: null == maiorNota ? _self.maiorNota : maiorNota // ignore: cast_nullable_to_non_nullable
as double,menorNota: null == menorNota ? _self.menorNota : menorNota // ignore: cast_nullable_to_non_nullable
as double,totalAlunosCorrigidos: null == totalAlunosCorrigidos ? _self.totalAlunosCorrigidos : totalAlunosCorrigidos // ignore: cast_nullable_to_non_nullable
as int,filtroSelecionado: null == filtroSelecionado ? _self.filtroSelecionado : filtroSelecionado // ignore: cast_nullable_to_non_nullable
as FiltroEstatisticas,todasAsQuestoes: null == todasAsQuestoes ? _self._todasAsQuestoes : todasAsQuestoes // ignore: cast_nullable_to_non_nullable
as List<QuestaoEstatisticaUiState>,questoesExibidas: null == questoesExibidas ? _self._questoesExibidas : questoesExibidas // ignore: cast_nullable_to_non_nullable
as List<QuestaoEstatisticaUiState>,
  ));
}


}

// dart format on
