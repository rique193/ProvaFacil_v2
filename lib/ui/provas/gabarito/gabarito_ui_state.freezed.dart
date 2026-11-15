// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gabarito_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GabaritoAlternativaState {

 int get alternativaId; String get letra;
/// Create a copy of GabaritoAlternativaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GabaritoAlternativaStateCopyWith<GabaritoAlternativaState> get copyWith => _$GabaritoAlternativaStateCopyWithImpl<GabaritoAlternativaState>(this as GabaritoAlternativaState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GabaritoAlternativaState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GabaritoAlternativaState&&(identical(other.alternativaId, _this.alternativaId) || other.alternativaId == _this.alternativaId)&&(identical(other.letra, _this.letra) || other.letra == _this.letra));
}


@override
int get hashCode {
  final _this = this as GabaritoAlternativaState;
  return Object.hash(runtimeType,_this.alternativaId,_this.letra);
}

@override
String toString() {
  final _this = this as GabaritoAlternativaState;
  return 'GabaritoAlternativaState(alternativaId: ${_this.alternativaId}, letra: ${_this.letra})';
}


}

/// @nodoc
abstract mixin class $GabaritoAlternativaStateCopyWith<$Res>  {
  factory $GabaritoAlternativaStateCopyWith(GabaritoAlternativaState value, $Res Function(GabaritoAlternativaState) _then) = _$GabaritoAlternativaStateCopyWithImpl;
@useResult
$Res call({
 int alternativaId, String letra
});




}
/// @nodoc
class _$GabaritoAlternativaStateCopyWithImpl<$Res>
    implements $GabaritoAlternativaStateCopyWith<$Res> {
  _$GabaritoAlternativaStateCopyWithImpl(this._self, this._then);

  final GabaritoAlternativaState _self;
  final $Res Function(GabaritoAlternativaState) _then;

/// Create a copy of GabaritoAlternativaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? alternativaId = null,Object? letra = null,}) {
  return _then(GabaritoAlternativaState(
alternativaId: null == alternativaId ? _self.alternativaId : alternativaId // ignore: cast_nullable_to_non_nullable
as int,letra: null == letra ? _self.letra : letra // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GabaritoAlternativaState].
extension GabaritoAlternativaStatePatterns on GabaritoAlternativaState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GabaritoAlternativaState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GabaritoAlternativaState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GabaritoAlternativaState value)  $default,){
final _that = this;
switch (_that) {
case _GabaritoAlternativaState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GabaritoAlternativaState value)?  $default,){
final _that = this;
switch (_that) {
case _GabaritoAlternativaState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int alternativaId,  String letra)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GabaritoAlternativaState() when $default != null:
return $default(_that.alternativaId,_that.letra);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int alternativaId,  String letra)  $default,) {final _that = this;
switch (_that) {
case _GabaritoAlternativaState():
return $default(_that.alternativaId,_that.letra);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int alternativaId,  String letra)?  $default,) {final _that = this;
switch (_that) {
case _GabaritoAlternativaState() when $default != null:
return $default(_that.alternativaId,_that.letra);case _:
  return null;

}
}

}

/// @nodoc


class _GabaritoAlternativaState implements GabaritoAlternativaState {
  const _GabaritoAlternativaState({required this.alternativaId, required this.letra});
  

@override final  int alternativaId;
@override final  String letra;

/// Create a copy of GabaritoAlternativaState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GabaritoAlternativaStateCopyWith<_GabaritoAlternativaState> get copyWith => __$GabaritoAlternativaStateCopyWithImpl<_GabaritoAlternativaState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GabaritoAlternativaState&&(identical(other.alternativaId, alternativaId) || other.alternativaId == alternativaId)&&(identical(other.letra, letra) || other.letra == letra));
}


@override
int get hashCode {
    return Object.hash(runtimeType,alternativaId,letra);
}

@override
String toString() {
    return 'GabaritoAlternativaState(alternativaId: $alternativaId, letra: $letra)';
}


}

/// @nodoc
abstract mixin class _$GabaritoAlternativaStateCopyWith<$Res> implements $GabaritoAlternativaStateCopyWith<$Res> {
  factory _$GabaritoAlternativaStateCopyWith(_GabaritoAlternativaState value, $Res Function(_GabaritoAlternativaState) _then) = __$GabaritoAlternativaStateCopyWithImpl;
@override @useResult
$Res call({
 int alternativaId, String letra
});




}
/// @nodoc
class __$GabaritoAlternativaStateCopyWithImpl<$Res>
    implements _$GabaritoAlternativaStateCopyWith<$Res> {
  __$GabaritoAlternativaStateCopyWithImpl(this._self, this._then);

  final _GabaritoAlternativaState _self;
  final $Res Function(_GabaritoAlternativaState) _then;

/// Create a copy of GabaritoAlternativaState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? alternativaId = null,Object? letra = null,}) {
  return _then(_GabaritoAlternativaState(
alternativaId: null == alternativaId ? _self.alternativaId : alternativaId // ignore: cast_nullable_to_non_nullable
as int,letra: null == letra ? _self.letra : letra // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$GabaritoQuestaoState {

 int get questaoId; int get numero; List<GabaritoAlternativaState> get alternativas; int? get alternativaCorretaId;
/// Create a copy of GabaritoQuestaoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GabaritoQuestaoStateCopyWith<GabaritoQuestaoState> get copyWith => _$GabaritoQuestaoStateCopyWithImpl<GabaritoQuestaoState>(this as GabaritoQuestaoState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GabaritoQuestaoState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GabaritoQuestaoState&&(identical(other.questaoId, _this.questaoId) || other.questaoId == _this.questaoId)&&(identical(other.numero, _this.numero) || other.numero == _this.numero)&&const DeepCollectionEquality().equals(other.alternativas, _this.alternativas)&&(identical(other.alternativaCorretaId, _this.alternativaCorretaId) || other.alternativaCorretaId == _this.alternativaCorretaId));
}


@override
int get hashCode {
  final _this = this as GabaritoQuestaoState;
  return Object.hash(runtimeType,_this.questaoId,_this.numero,const DeepCollectionEquality().hash(_this.alternativas),_this.alternativaCorretaId);
}

@override
String toString() {
  final _this = this as GabaritoQuestaoState;
  return 'GabaritoQuestaoState(questaoId: ${_this.questaoId}, numero: ${_this.numero}, alternativas: ${_this.alternativas}, alternativaCorretaId: ${_this.alternativaCorretaId})';
}


}

/// @nodoc
abstract mixin class $GabaritoQuestaoStateCopyWith<$Res>  {
  factory $GabaritoQuestaoStateCopyWith(GabaritoQuestaoState value, $Res Function(GabaritoQuestaoState) _then) = _$GabaritoQuestaoStateCopyWithImpl;
@useResult
$Res call({
 int questaoId, int numero, List<GabaritoAlternativaState> alternativas, int? alternativaCorretaId
});




}
/// @nodoc
class _$GabaritoQuestaoStateCopyWithImpl<$Res>
    implements $GabaritoQuestaoStateCopyWith<$Res> {
  _$GabaritoQuestaoStateCopyWithImpl(this._self, this._then);

  final GabaritoQuestaoState _self;
  final $Res Function(GabaritoQuestaoState) _then;

/// Create a copy of GabaritoQuestaoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questaoId = null,Object? numero = null,Object? alternativas = null,Object? alternativaCorretaId = freezed,}) {
  return _then(GabaritoQuestaoState(
questaoId: null == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int,numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,alternativas: null == alternativas ? _self.alternativas : alternativas // ignore: cast_nullable_to_non_nullable
as List<GabaritoAlternativaState>,alternativaCorretaId: freezed == alternativaCorretaId ? _self.alternativaCorretaId : alternativaCorretaId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GabaritoQuestaoState].
extension GabaritoQuestaoStatePatterns on GabaritoQuestaoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GabaritoQuestaoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GabaritoQuestaoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GabaritoQuestaoState value)  $default,){
final _that = this;
switch (_that) {
case _GabaritoQuestaoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GabaritoQuestaoState value)?  $default,){
final _that = this;
switch (_that) {
case _GabaritoQuestaoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int questaoId,  int numero,  List<GabaritoAlternativaState> alternativas,  int? alternativaCorretaId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GabaritoQuestaoState() when $default != null:
return $default(_that.questaoId,_that.numero,_that.alternativas,_that.alternativaCorretaId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int questaoId,  int numero,  List<GabaritoAlternativaState> alternativas,  int? alternativaCorretaId)  $default,) {final _that = this;
switch (_that) {
case _GabaritoQuestaoState():
return $default(_that.questaoId,_that.numero,_that.alternativas,_that.alternativaCorretaId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int questaoId,  int numero,  List<GabaritoAlternativaState> alternativas,  int? alternativaCorretaId)?  $default,) {final _that = this;
switch (_that) {
case _GabaritoQuestaoState() when $default != null:
return $default(_that.questaoId,_that.numero,_that.alternativas,_that.alternativaCorretaId);case _:
  return null;

}
}

}

/// @nodoc


class _GabaritoQuestaoState implements GabaritoQuestaoState {
  const _GabaritoQuestaoState({required this.questaoId, required this.numero, required  List<GabaritoAlternativaState> alternativas, this.alternativaCorretaId}): _alternativas = alternativas;
  

@override final  int questaoId;
@override final  int numero;
 final  List<GabaritoAlternativaState> _alternativas;
@override List<GabaritoAlternativaState> get alternativas {
  if (_alternativas is EqualUnmodifiableListView) return _alternativas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alternativas);
}

@override final  int? alternativaCorretaId;

/// Create a copy of GabaritoQuestaoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GabaritoQuestaoStateCopyWith<_GabaritoQuestaoState> get copyWith => __$GabaritoQuestaoStateCopyWithImpl<_GabaritoQuestaoState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GabaritoQuestaoState&&(identical(other.questaoId, questaoId) || other.questaoId == questaoId)&&(identical(other.numero, numero) || other.numero == numero)&&const DeepCollectionEquality().equals(other.alternativas, _alternativas)&&(identical(other.alternativaCorretaId, alternativaCorretaId) || other.alternativaCorretaId == alternativaCorretaId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,questaoId,numero,const DeepCollectionEquality().hash(_alternativas),alternativaCorretaId);
}

@override
String toString() {
    return 'GabaritoQuestaoState(questaoId: $questaoId, numero: $numero, alternativas: $alternativas, alternativaCorretaId: $alternativaCorretaId)';
}


}

/// @nodoc
abstract mixin class _$GabaritoQuestaoStateCopyWith<$Res> implements $GabaritoQuestaoStateCopyWith<$Res> {
  factory _$GabaritoQuestaoStateCopyWith(_GabaritoQuestaoState value, $Res Function(_GabaritoQuestaoState) _then) = __$GabaritoQuestaoStateCopyWithImpl;
@override @useResult
$Res call({
 int questaoId, int numero, List<GabaritoAlternativaState> alternativas, int? alternativaCorretaId
});




}
/// @nodoc
class __$GabaritoQuestaoStateCopyWithImpl<$Res>
    implements _$GabaritoQuestaoStateCopyWith<$Res> {
  __$GabaritoQuestaoStateCopyWithImpl(this._self, this._then);

  final _GabaritoQuestaoState _self;
  final $Res Function(_GabaritoQuestaoState) _then;

/// Create a copy of GabaritoQuestaoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questaoId = null,Object? numero = null,Object? alternativas = null,Object? alternativaCorretaId = freezed,}) {
  return _then(_GabaritoQuestaoState(
questaoId: null == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int,numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,alternativas: null == alternativas ? _self._alternativas : alternativas // ignore: cast_nullable_to_non_nullable
as List<GabaritoAlternativaState>,alternativaCorretaId: freezed == alternativaCorretaId ? _self.alternativaCorretaId : alternativaCorretaId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$GabaritoUiState {

 String get tituloProva; String get disciplina; List<GabaritoQuestaoState> get questoes; bool get carregando; String? get erro; bool get salvo;
/// Create a copy of GabaritoUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GabaritoUiStateCopyWith<GabaritoUiState> get copyWith => _$GabaritoUiStateCopyWithImpl<GabaritoUiState>(this as GabaritoUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GabaritoUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GabaritoUiState&&(identical(other.tituloProva, _this.tituloProva) || other.tituloProva == _this.tituloProva)&&(identical(other.disciplina, _this.disciplina) || other.disciplina == _this.disciplina)&&const DeepCollectionEquality().equals(other.questoes, _this.questoes)&&(identical(other.carregando, _this.carregando) || other.carregando == _this.carregando)&&(identical(other.erro, _this.erro) || other.erro == _this.erro)&&(identical(other.salvo, _this.salvo) || other.salvo == _this.salvo));
}


@override
int get hashCode {
  final _this = this as GabaritoUiState;
  return Object.hash(runtimeType,_this.tituloProva,_this.disciplina,const DeepCollectionEquality().hash(_this.questoes),_this.carregando,_this.erro,_this.salvo);
}

@override
String toString() {
  final _this = this as GabaritoUiState;
  return 'GabaritoUiState(tituloProva: ${_this.tituloProva}, disciplina: ${_this.disciplina}, questoes: ${_this.questoes}, carregando: ${_this.carregando}, erro: ${_this.erro}, salvo: ${_this.salvo})';
}


}

/// @nodoc
abstract mixin class $GabaritoUiStateCopyWith<$Res>  {
  factory $GabaritoUiStateCopyWith(GabaritoUiState value, $Res Function(GabaritoUiState) _then) = _$GabaritoUiStateCopyWithImpl;
@useResult
$Res call({
 String tituloProva, String disciplina, List<GabaritoQuestaoState> questoes, bool carregando, String? erro, bool salvo
});




}
/// @nodoc
class _$GabaritoUiStateCopyWithImpl<$Res>
    implements $GabaritoUiStateCopyWith<$Res> {
  _$GabaritoUiStateCopyWithImpl(this._self, this._then);

  final GabaritoUiState _self;
  final $Res Function(GabaritoUiState) _then;

/// Create a copy of GabaritoUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tituloProva = null,Object? disciplina = null,Object? questoes = null,Object? carregando = null,Object? erro = freezed,Object? salvo = null,}) {
  return _then(GabaritoUiState(
tituloProva: null == tituloProva ? _self.tituloProva : tituloProva // ignore: cast_nullable_to_non_nullable
as String,disciplina: null == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String,questoes: null == questoes ? _self.questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<GabaritoQuestaoState>,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,salvo: null == salvo ? _self.salvo : salvo // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GabaritoUiState].
extension GabaritoUiStatePatterns on GabaritoUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GabaritoUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GabaritoUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GabaritoUiState value)  $default,){
final _that = this;
switch (_that) {
case _GabaritoUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GabaritoUiState value)?  $default,){
final _that = this;
switch (_that) {
case _GabaritoUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tituloProva,  String disciplina,  List<GabaritoQuestaoState> questoes,  bool carregando,  String? erro,  bool salvo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GabaritoUiState() when $default != null:
return $default(_that.tituloProva,_that.disciplina,_that.questoes,_that.carregando,_that.erro,_that.salvo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tituloProva,  String disciplina,  List<GabaritoQuestaoState> questoes,  bool carregando,  String? erro,  bool salvo)  $default,) {final _that = this;
switch (_that) {
case _GabaritoUiState():
return $default(_that.tituloProva,_that.disciplina,_that.questoes,_that.carregando,_that.erro,_that.salvo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tituloProva,  String disciplina,  List<GabaritoQuestaoState> questoes,  bool carregando,  String? erro,  bool salvo)?  $default,) {final _that = this;
switch (_that) {
case _GabaritoUiState() when $default != null:
return $default(_that.tituloProva,_that.disciplina,_that.questoes,_that.carregando,_that.erro,_that.salvo);case _:
  return null;

}
}

}

/// @nodoc


class _GabaritoUiState extends GabaritoUiState {
  const _GabaritoUiState({this.tituloProva = '', this.disciplina = '',  List<GabaritoQuestaoState> questoes = const [], this.carregando = true, this.erro, this.salvo = false}): _questoes = questoes,super._();
  

@override@JsonKey() final  String tituloProva;
@override@JsonKey() final  String disciplina;
 final  List<GabaritoQuestaoState> _questoes;
@override@JsonKey() List<GabaritoQuestaoState> get questoes {
  if (_questoes is EqualUnmodifiableListView) return _questoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questoes);
}

@override@JsonKey() final  bool carregando;
@override final  String? erro;
@override@JsonKey() final  bool salvo;

/// Create a copy of GabaritoUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GabaritoUiStateCopyWith<_GabaritoUiState> get copyWith => __$GabaritoUiStateCopyWithImpl<_GabaritoUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GabaritoUiState&&(identical(other.tituloProva, tituloProva) || other.tituloProva == tituloProva)&&(identical(other.disciplina, disciplina) || other.disciplina == disciplina)&&const DeepCollectionEquality().equals(other.questoes, _questoes)&&(identical(other.carregando, carregando) || other.carregando == carregando)&&(identical(other.erro, erro) || other.erro == erro)&&(identical(other.salvo, salvo) || other.salvo == salvo));
}


@override
int get hashCode {
    return Object.hash(runtimeType,tituloProva,disciplina,const DeepCollectionEquality().hash(_questoes),carregando,erro,salvo);
}

@override
String toString() {
    return 'GabaritoUiState(tituloProva: $tituloProva, disciplina: $disciplina, questoes: $questoes, carregando: $carregando, erro: $erro, salvo: $salvo)';
}


}

/// @nodoc
abstract mixin class _$GabaritoUiStateCopyWith<$Res> implements $GabaritoUiStateCopyWith<$Res> {
  factory _$GabaritoUiStateCopyWith(_GabaritoUiState value, $Res Function(_GabaritoUiState) _then) = __$GabaritoUiStateCopyWithImpl;
@override @useResult
$Res call({
 String tituloProva, String disciplina, List<GabaritoQuestaoState> questoes, bool carregando, String? erro, bool salvo
});




}
/// @nodoc
class __$GabaritoUiStateCopyWithImpl<$Res>
    implements _$GabaritoUiStateCopyWith<$Res> {
  __$GabaritoUiStateCopyWithImpl(this._self, this._then);

  final _GabaritoUiState _self;
  final $Res Function(_GabaritoUiState) _then;

/// Create a copy of GabaritoUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tituloProva = null,Object? disciplina = null,Object? questoes = null,Object? carregando = null,Object? erro = freezed,Object? salvo = null,}) {
  return _then(_GabaritoUiState(
tituloProva: null == tituloProva ? _self.tituloProva : tituloProva // ignore: cast_nullable_to_non_nullable
as String,disciplina: null == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String,questoes: null == questoes ? _self._questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<GabaritoQuestaoState>,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,salvo: null == salvo ? _self.salvo : salvo // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
