// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'historico_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AvaliacaoHistoricoUiState {

 int get provaId; String get titulo; String get disciplina;/// Turmas dos alunos corrigidos, já formatadas ("Turma A, Turma B"); vazio se não houver.
 String get turmas; int get totalCorrigidos; double get media; int get ultimaCorrecaoEm;
/// Create a copy of AvaliacaoHistoricoUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvaliacaoHistoricoUiStateCopyWith<AvaliacaoHistoricoUiState> get copyWith => _$AvaliacaoHistoricoUiStateCopyWithImpl<AvaliacaoHistoricoUiState>(this as AvaliacaoHistoricoUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AvaliacaoHistoricoUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvaliacaoHistoricoUiState&&(identical(other.provaId, _this.provaId) || other.provaId == _this.provaId)&&(identical(other.titulo, _this.titulo) || other.titulo == _this.titulo)&&(identical(other.disciplina, _this.disciplina) || other.disciplina == _this.disciplina)&&(identical(other.turmas, _this.turmas) || other.turmas == _this.turmas)&&(identical(other.totalCorrigidos, _this.totalCorrigidos) || other.totalCorrigidos == _this.totalCorrigidos)&&(identical(other.media, _this.media) || other.media == _this.media)&&(identical(other.ultimaCorrecaoEm, _this.ultimaCorrecaoEm) || other.ultimaCorrecaoEm == _this.ultimaCorrecaoEm));
}


@override
int get hashCode {
  final _this = this as AvaliacaoHistoricoUiState;
  return Object.hash(runtimeType,_this.provaId,_this.titulo,_this.disciplina,_this.turmas,_this.totalCorrigidos,_this.media,_this.ultimaCorrecaoEm);
}

@override
String toString() {
  final _this = this as AvaliacaoHistoricoUiState;
  return 'AvaliacaoHistoricoUiState(provaId: ${_this.provaId}, titulo: ${_this.titulo}, disciplina: ${_this.disciplina}, turmas: ${_this.turmas}, totalCorrigidos: ${_this.totalCorrigidos}, media: ${_this.media}, ultimaCorrecaoEm: ${_this.ultimaCorrecaoEm})';
}


}

/// @nodoc
abstract mixin class $AvaliacaoHistoricoUiStateCopyWith<$Res>  {
  factory $AvaliacaoHistoricoUiStateCopyWith(AvaliacaoHistoricoUiState value, $Res Function(AvaliacaoHistoricoUiState) _then) = _$AvaliacaoHistoricoUiStateCopyWithImpl;
@useResult
$Res call({
 int provaId, String titulo, String disciplina, String turmas, int totalCorrigidos, double media, int ultimaCorrecaoEm
});




}
/// @nodoc
class _$AvaliacaoHistoricoUiStateCopyWithImpl<$Res>
    implements $AvaliacaoHistoricoUiStateCopyWith<$Res> {
  _$AvaliacaoHistoricoUiStateCopyWithImpl(this._self, this._then);

  final AvaliacaoHistoricoUiState _self;
  final $Res Function(AvaliacaoHistoricoUiState) _then;

/// Create a copy of AvaliacaoHistoricoUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provaId = null,Object? titulo = null,Object? disciplina = null,Object? turmas = null,Object? totalCorrigidos = null,Object? media = null,Object? ultimaCorrecaoEm = null,}) {
  return _then(AvaliacaoHistoricoUiState(
provaId: null == provaId ? _self.provaId : provaId // ignore: cast_nullable_to_non_nullable
as int,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,disciplina: null == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String,turmas: null == turmas ? _self.turmas : turmas // ignore: cast_nullable_to_non_nullable
as String,totalCorrigidos: null == totalCorrigidos ? _self.totalCorrigidos : totalCorrigidos // ignore: cast_nullable_to_non_nullable
as int,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as double,ultimaCorrecaoEm: null == ultimaCorrecaoEm ? _self.ultimaCorrecaoEm : ultimaCorrecaoEm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AvaliacaoHistoricoUiState].
extension AvaliacaoHistoricoUiStatePatterns on AvaliacaoHistoricoUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvaliacaoHistoricoUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvaliacaoHistoricoUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvaliacaoHistoricoUiState value)  $default,){
final _that = this;
switch (_that) {
case _AvaliacaoHistoricoUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvaliacaoHistoricoUiState value)?  $default,){
final _that = this;
switch (_that) {
case _AvaliacaoHistoricoUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int provaId,  String titulo,  String disciplina,  String turmas,  int totalCorrigidos,  double media,  int ultimaCorrecaoEm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvaliacaoHistoricoUiState() when $default != null:
return $default(_that.provaId,_that.titulo,_that.disciplina,_that.turmas,_that.totalCorrigidos,_that.media,_that.ultimaCorrecaoEm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int provaId,  String titulo,  String disciplina,  String turmas,  int totalCorrigidos,  double media,  int ultimaCorrecaoEm)  $default,) {final _that = this;
switch (_that) {
case _AvaliacaoHistoricoUiState():
return $default(_that.provaId,_that.titulo,_that.disciplina,_that.turmas,_that.totalCorrigidos,_that.media,_that.ultimaCorrecaoEm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int provaId,  String titulo,  String disciplina,  String turmas,  int totalCorrigidos,  double media,  int ultimaCorrecaoEm)?  $default,) {final _that = this;
switch (_that) {
case _AvaliacaoHistoricoUiState() when $default != null:
return $default(_that.provaId,_that.titulo,_that.disciplina,_that.turmas,_that.totalCorrigidos,_that.media,_that.ultimaCorrecaoEm);case _:
  return null;

}
}

}

/// @nodoc


class _AvaliacaoHistoricoUiState implements AvaliacaoHistoricoUiState {
  const _AvaliacaoHistoricoUiState({required this.provaId, required this.titulo, required this.disciplina, required this.turmas, required this.totalCorrigidos, required this.media, required this.ultimaCorrecaoEm});
  

@override final  int provaId;
@override final  String titulo;
@override final  String disciplina;
/// Turmas dos alunos corrigidos, já formatadas ("Turma A, Turma B"); vazio se não houver.
@override final  String turmas;
@override final  int totalCorrigidos;
@override final  double media;
@override final  int ultimaCorrecaoEm;

/// Create a copy of AvaliacaoHistoricoUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvaliacaoHistoricoUiStateCopyWith<_AvaliacaoHistoricoUiState> get copyWith => __$AvaliacaoHistoricoUiStateCopyWithImpl<_AvaliacaoHistoricoUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvaliacaoHistoricoUiState&&(identical(other.provaId, provaId) || other.provaId == provaId)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.disciplina, disciplina) || other.disciplina == disciplina)&&(identical(other.turmas, turmas) || other.turmas == turmas)&&(identical(other.totalCorrigidos, totalCorrigidos) || other.totalCorrigidos == totalCorrigidos)&&(identical(other.media, media) || other.media == media)&&(identical(other.ultimaCorrecaoEm, ultimaCorrecaoEm) || other.ultimaCorrecaoEm == ultimaCorrecaoEm));
}


@override
int get hashCode {
    return Object.hash(runtimeType,provaId,titulo,disciplina,turmas,totalCorrigidos,media,ultimaCorrecaoEm);
}

@override
String toString() {
    return 'AvaliacaoHistoricoUiState(provaId: $provaId, titulo: $titulo, disciplina: $disciplina, turmas: $turmas, totalCorrigidos: $totalCorrigidos, media: $media, ultimaCorrecaoEm: $ultimaCorrecaoEm)';
}


}

/// @nodoc
abstract mixin class _$AvaliacaoHistoricoUiStateCopyWith<$Res> implements $AvaliacaoHistoricoUiStateCopyWith<$Res> {
  factory _$AvaliacaoHistoricoUiStateCopyWith(_AvaliacaoHistoricoUiState value, $Res Function(_AvaliacaoHistoricoUiState) _then) = __$AvaliacaoHistoricoUiStateCopyWithImpl;
@override @useResult
$Res call({
 int provaId, String titulo, String disciplina, String turmas, int totalCorrigidos, double media, int ultimaCorrecaoEm
});




}
/// @nodoc
class __$AvaliacaoHistoricoUiStateCopyWithImpl<$Res>
    implements _$AvaliacaoHistoricoUiStateCopyWith<$Res> {
  __$AvaliacaoHistoricoUiStateCopyWithImpl(this._self, this._then);

  final _AvaliacaoHistoricoUiState _self;
  final $Res Function(_AvaliacaoHistoricoUiState) _then;

/// Create a copy of AvaliacaoHistoricoUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provaId = null,Object? titulo = null,Object? disciplina = null,Object? turmas = null,Object? totalCorrigidos = null,Object? media = null,Object? ultimaCorrecaoEm = null,}) {
  return _then(_AvaliacaoHistoricoUiState(
provaId: null == provaId ? _self.provaId : provaId // ignore: cast_nullable_to_non_nullable
as int,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,disciplina: null == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String,turmas: null == turmas ? _self.turmas : turmas // ignore: cast_nullable_to_non_nullable
as String,totalCorrigidos: null == totalCorrigidos ? _self.totalCorrigidos : totalCorrigidos // ignore: cast_nullable_to_non_nullable
as int,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as double,ultimaCorrecaoEm: null == ultimaCorrecaoEm ? _self.ultimaCorrecaoEm : ultimaCorrecaoEm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$HistoricoUiState {

 bool get carregando; List<AvaliacaoHistoricoUiState> get avaliacoes;
/// Create a copy of HistoricoUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoricoUiStateCopyWith<HistoricoUiState> get copyWith => _$HistoricoUiStateCopyWithImpl<HistoricoUiState>(this as HistoricoUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HistoricoUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoricoUiState&&(identical(other.carregando, _this.carregando) || other.carregando == _this.carregando)&&const DeepCollectionEquality().equals(other.avaliacoes, _this.avaliacoes));
}


@override
int get hashCode {
  final _this = this as HistoricoUiState;
  return Object.hash(runtimeType,_this.carregando,const DeepCollectionEquality().hash(_this.avaliacoes));
}

@override
String toString() {
  final _this = this as HistoricoUiState;
  return 'HistoricoUiState(carregando: ${_this.carregando}, avaliacoes: ${_this.avaliacoes})';
}


}

/// @nodoc
abstract mixin class $HistoricoUiStateCopyWith<$Res>  {
  factory $HistoricoUiStateCopyWith(HistoricoUiState value, $Res Function(HistoricoUiState) _then) = _$HistoricoUiStateCopyWithImpl;
@useResult
$Res call({
 bool carregando, List<AvaliacaoHistoricoUiState> avaliacoes
});




}
/// @nodoc
class _$HistoricoUiStateCopyWithImpl<$Res>
    implements $HistoricoUiStateCopyWith<$Res> {
  _$HistoricoUiStateCopyWithImpl(this._self, this._then);

  final HistoricoUiState _self;
  final $Res Function(HistoricoUiState) _then;

/// Create a copy of HistoricoUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? carregando = null,Object? avaliacoes = null,}) {
  return _then(HistoricoUiState(
carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,avaliacoes: null == avaliacoes ? _self.avaliacoes : avaliacoes // ignore: cast_nullable_to_non_nullable
as List<AvaliacaoHistoricoUiState>,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoricoUiState].
extension HistoricoUiStatePatterns on HistoricoUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoricoUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoricoUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoricoUiState value)  $default,){
final _that = this;
switch (_that) {
case _HistoricoUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoricoUiState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoricoUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool carregando,  List<AvaliacaoHistoricoUiState> avaliacoes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoricoUiState() when $default != null:
return $default(_that.carregando,_that.avaliacoes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool carregando,  List<AvaliacaoHistoricoUiState> avaliacoes)  $default,) {final _that = this;
switch (_that) {
case _HistoricoUiState():
return $default(_that.carregando,_that.avaliacoes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool carregando,  List<AvaliacaoHistoricoUiState> avaliacoes)?  $default,) {final _that = this;
switch (_that) {
case _HistoricoUiState() when $default != null:
return $default(_that.carregando,_that.avaliacoes);case _:
  return null;

}
}

}

/// @nodoc


class _HistoricoUiState implements HistoricoUiState {
  const _HistoricoUiState({this.carregando = true,  List<AvaliacaoHistoricoUiState> avaliacoes = const <AvaliacaoHistoricoUiState>[]}): _avaliacoes = avaliacoes;
  

@override@JsonKey() final  bool carregando;
 final  List<AvaliacaoHistoricoUiState> _avaliacoes;
@override@JsonKey() List<AvaliacaoHistoricoUiState> get avaliacoes {
  if (_avaliacoes is EqualUnmodifiableListView) return _avaliacoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_avaliacoes);
}


/// Create a copy of HistoricoUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoricoUiStateCopyWith<_HistoricoUiState> get copyWith => __$HistoricoUiStateCopyWithImpl<_HistoricoUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoricoUiState&&(identical(other.carregando, carregando) || other.carregando == carregando)&&const DeepCollectionEquality().equals(other.avaliacoes, _avaliacoes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,carregando,const DeepCollectionEquality().hash(_avaliacoes));
}

@override
String toString() {
    return 'HistoricoUiState(carregando: $carregando, avaliacoes: $avaliacoes)';
}


}

/// @nodoc
abstract mixin class _$HistoricoUiStateCopyWith<$Res> implements $HistoricoUiStateCopyWith<$Res> {
  factory _$HistoricoUiStateCopyWith(_HistoricoUiState value, $Res Function(_HistoricoUiState) _then) = __$HistoricoUiStateCopyWithImpl;
@override @useResult
$Res call({
 bool carregando, List<AvaliacaoHistoricoUiState> avaliacoes
});




}
/// @nodoc
class __$HistoricoUiStateCopyWithImpl<$Res>
    implements _$HistoricoUiStateCopyWith<$Res> {
  __$HistoricoUiStateCopyWithImpl(this._self, this._then);

  final _HistoricoUiState _self;
  final $Res Function(_HistoricoUiState) _then;

/// Create a copy of HistoricoUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? carregando = null,Object? avaliacoes = null,}) {
  return _then(_HistoricoUiState(
carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,avaliacoes: null == avaliacoes ? _self._avaliacoes : avaliacoes // ignore: cast_nullable_to_non_nullable
as List<AvaliacaoHistoricoUiState>,
  ));
}


}

// dart format on
