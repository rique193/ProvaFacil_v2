// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'corretor_prova.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GabaritoQuestao {

 int get questaoId; int get numero; String? get letraCorreta;
/// Create a copy of GabaritoQuestao
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GabaritoQuestaoCopyWith<GabaritoQuestao> get copyWith => _$GabaritoQuestaoCopyWithImpl<GabaritoQuestao>(this as GabaritoQuestao, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GabaritoQuestao;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GabaritoQuestao&&(identical(other.questaoId, _this.questaoId) || other.questaoId == _this.questaoId)&&(identical(other.numero, _this.numero) || other.numero == _this.numero)&&(identical(other.letraCorreta, _this.letraCorreta) || other.letraCorreta == _this.letraCorreta));
}


@override
int get hashCode {
  final _this = this as GabaritoQuestao;
  return Object.hash(runtimeType,_this.questaoId,_this.numero,_this.letraCorreta);
}

@override
String toString() {
  final _this = this as GabaritoQuestao;
  return 'GabaritoQuestao(questaoId: ${_this.questaoId}, numero: ${_this.numero}, letraCorreta: ${_this.letraCorreta})';
}


}

/// @nodoc
abstract mixin class $GabaritoQuestaoCopyWith<$Res>  {
  factory $GabaritoQuestaoCopyWith(GabaritoQuestao value, $Res Function(GabaritoQuestao) _then) = _$GabaritoQuestaoCopyWithImpl;
@useResult
$Res call({
 int questaoId, int numero, String? letraCorreta
});




}
/// @nodoc
class _$GabaritoQuestaoCopyWithImpl<$Res>
    implements $GabaritoQuestaoCopyWith<$Res> {
  _$GabaritoQuestaoCopyWithImpl(this._self, this._then);

  final GabaritoQuestao _self;
  final $Res Function(GabaritoQuestao) _then;

/// Create a copy of GabaritoQuestao
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questaoId = null,Object? numero = null,Object? letraCorreta = freezed,}) {
  return _then(GabaritoQuestao(
questaoId: null == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int,numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,letraCorreta: freezed == letraCorreta ? _self.letraCorreta : letraCorreta // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GabaritoQuestao].
extension GabaritoQuestaoPatterns on GabaritoQuestao {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GabaritoQuestao value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GabaritoQuestao() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GabaritoQuestao value)  $default,){
final _that = this;
switch (_that) {
case _GabaritoQuestao():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GabaritoQuestao value)?  $default,){
final _that = this;
switch (_that) {
case _GabaritoQuestao() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int questaoId,  int numero,  String? letraCorreta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GabaritoQuestao() when $default != null:
return $default(_that.questaoId,_that.numero,_that.letraCorreta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int questaoId,  int numero,  String? letraCorreta)  $default,) {final _that = this;
switch (_that) {
case _GabaritoQuestao():
return $default(_that.questaoId,_that.numero,_that.letraCorreta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int questaoId,  int numero,  String? letraCorreta)?  $default,) {final _that = this;
switch (_that) {
case _GabaritoQuestao() when $default != null:
return $default(_that.questaoId,_that.numero,_that.letraCorreta);case _:
  return null;

}
}

}

/// @nodoc


class _GabaritoQuestao implements GabaritoQuestao {
  const _GabaritoQuestao({required this.questaoId, required this.numero, required this.letraCorreta});
  

@override final  int questaoId;
@override final  int numero;
@override final  String? letraCorreta;

/// Create a copy of GabaritoQuestao
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GabaritoQuestaoCopyWith<_GabaritoQuestao> get copyWith => __$GabaritoQuestaoCopyWithImpl<_GabaritoQuestao>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GabaritoQuestao&&(identical(other.questaoId, questaoId) || other.questaoId == questaoId)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.letraCorreta, letraCorreta) || other.letraCorreta == letraCorreta));
}


@override
int get hashCode {
    return Object.hash(runtimeType,questaoId,numero,letraCorreta);
}

@override
String toString() {
    return 'GabaritoQuestao(questaoId: $questaoId, numero: $numero, letraCorreta: $letraCorreta)';
}


}

/// @nodoc
abstract mixin class _$GabaritoQuestaoCopyWith<$Res> implements $GabaritoQuestaoCopyWith<$Res> {
  factory _$GabaritoQuestaoCopyWith(_GabaritoQuestao value, $Res Function(_GabaritoQuestao) _then) = __$GabaritoQuestaoCopyWithImpl;
@override @useResult
$Res call({
 int questaoId, int numero, String? letraCorreta
});




}
/// @nodoc
class __$GabaritoQuestaoCopyWithImpl<$Res>
    implements _$GabaritoQuestaoCopyWith<$Res> {
  __$GabaritoQuestaoCopyWithImpl(this._self, this._then);

  final _GabaritoQuestao _self;
  final $Res Function(_GabaritoQuestao) _then;

/// Create a copy of GabaritoQuestao
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questaoId = null,Object? numero = null,Object? letraCorreta = freezed,}) {
  return _then(_GabaritoQuestao(
questaoId: null == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int,numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,letraCorreta: freezed == letraCorreta ? _self.letraCorreta : letraCorreta // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$QuestaoCorrigida {

 int get questaoId; int get numero; Set<String> get letrasMarcadas; String get letraCorreta; SituacaoQuestao get situacao;
/// Create a copy of QuestaoCorrigida
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestaoCorrigidaCopyWith<QuestaoCorrigida> get copyWith => _$QuestaoCorrigidaCopyWithImpl<QuestaoCorrigida>(this as QuestaoCorrigida, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as QuestaoCorrigida;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestaoCorrigida&&(identical(other.questaoId, _this.questaoId) || other.questaoId == _this.questaoId)&&(identical(other.numero, _this.numero) || other.numero == _this.numero)&&const DeepCollectionEquality().equals(other.letrasMarcadas, _this.letrasMarcadas)&&(identical(other.letraCorreta, _this.letraCorreta) || other.letraCorreta == _this.letraCorreta)&&(identical(other.situacao, _this.situacao) || other.situacao == _this.situacao));
}


@override
int get hashCode {
  final _this = this as QuestaoCorrigida;
  return Object.hash(runtimeType,_this.questaoId,_this.numero,const DeepCollectionEquality().hash(_this.letrasMarcadas),_this.letraCorreta,_this.situacao);
}

@override
String toString() {
  final _this = this as QuestaoCorrigida;
  return 'QuestaoCorrigida(questaoId: ${_this.questaoId}, numero: ${_this.numero}, letrasMarcadas: ${_this.letrasMarcadas}, letraCorreta: ${_this.letraCorreta}, situacao: ${_this.situacao})';
}


}

/// @nodoc
abstract mixin class $QuestaoCorrigidaCopyWith<$Res>  {
  factory $QuestaoCorrigidaCopyWith(QuestaoCorrigida value, $Res Function(QuestaoCorrigida) _then) = _$QuestaoCorrigidaCopyWithImpl;
@useResult
$Res call({
 int questaoId, int numero, Set<String> letrasMarcadas, String letraCorreta, SituacaoQuestao situacao
});




}
/// @nodoc
class _$QuestaoCorrigidaCopyWithImpl<$Res>
    implements $QuestaoCorrigidaCopyWith<$Res> {
  _$QuestaoCorrigidaCopyWithImpl(this._self, this._then);

  final QuestaoCorrigida _self;
  final $Res Function(QuestaoCorrigida) _then;

/// Create a copy of QuestaoCorrigida
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questaoId = null,Object? numero = null,Object? letrasMarcadas = null,Object? letraCorreta = null,Object? situacao = null,}) {
  return _then(QuestaoCorrigida(
questaoId: null == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int,numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,letrasMarcadas: null == letrasMarcadas ? _self.letrasMarcadas : letrasMarcadas // ignore: cast_nullable_to_non_nullable
as Set<String>,letraCorreta: null == letraCorreta ? _self.letraCorreta : letraCorreta // ignore: cast_nullable_to_non_nullable
as String,situacao: null == situacao ? _self.situacao : situacao // ignore: cast_nullable_to_non_nullable
as SituacaoQuestao,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestaoCorrigida].
extension QuestaoCorrigidaPatterns on QuestaoCorrigida {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestaoCorrigida value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestaoCorrigida() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestaoCorrigida value)  $default,){
final _that = this;
switch (_that) {
case _QuestaoCorrigida():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestaoCorrigida value)?  $default,){
final _that = this;
switch (_that) {
case _QuestaoCorrigida() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int questaoId,  int numero,  Set<String> letrasMarcadas,  String letraCorreta,  SituacaoQuestao situacao)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestaoCorrigida() when $default != null:
return $default(_that.questaoId,_that.numero,_that.letrasMarcadas,_that.letraCorreta,_that.situacao);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int questaoId,  int numero,  Set<String> letrasMarcadas,  String letraCorreta,  SituacaoQuestao situacao)  $default,) {final _that = this;
switch (_that) {
case _QuestaoCorrigida():
return $default(_that.questaoId,_that.numero,_that.letrasMarcadas,_that.letraCorreta,_that.situacao);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int questaoId,  int numero,  Set<String> letrasMarcadas,  String letraCorreta,  SituacaoQuestao situacao)?  $default,) {final _that = this;
switch (_that) {
case _QuestaoCorrigida() when $default != null:
return $default(_that.questaoId,_that.numero,_that.letrasMarcadas,_that.letraCorreta,_that.situacao);case _:
  return null;

}
}

}

/// @nodoc


class _QuestaoCorrigida extends QuestaoCorrigida {
  const _QuestaoCorrigida({required this.questaoId, required this.numero, required  Set<String> letrasMarcadas, required this.letraCorreta, required this.situacao}): _letrasMarcadas = letrasMarcadas,super._();
  

@override final  int questaoId;
@override final  int numero;
 final  Set<String> _letrasMarcadas;
@override Set<String> get letrasMarcadas {
  if (_letrasMarcadas is EqualUnmodifiableSetView) return _letrasMarcadas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_letrasMarcadas);
}

@override final  String letraCorreta;
@override final  SituacaoQuestao situacao;

/// Create a copy of QuestaoCorrigida
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestaoCorrigidaCopyWith<_QuestaoCorrigida> get copyWith => __$QuestaoCorrigidaCopyWithImpl<_QuestaoCorrigida>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestaoCorrigida&&(identical(other.questaoId, questaoId) || other.questaoId == questaoId)&&(identical(other.numero, numero) || other.numero == numero)&&const DeepCollectionEquality().equals(other.letrasMarcadas, _letrasMarcadas)&&(identical(other.letraCorreta, letraCorreta) || other.letraCorreta == letraCorreta)&&(identical(other.situacao, situacao) || other.situacao == situacao));
}


@override
int get hashCode {
    return Object.hash(runtimeType,questaoId,numero,const DeepCollectionEquality().hash(_letrasMarcadas),letraCorreta,situacao);
}

@override
String toString() {
    return 'QuestaoCorrigida(questaoId: $questaoId, numero: $numero, letrasMarcadas: $letrasMarcadas, letraCorreta: $letraCorreta, situacao: $situacao)';
}


}

/// @nodoc
abstract mixin class _$QuestaoCorrigidaCopyWith<$Res> implements $QuestaoCorrigidaCopyWith<$Res> {
  factory _$QuestaoCorrigidaCopyWith(_QuestaoCorrigida value, $Res Function(_QuestaoCorrigida) _then) = __$QuestaoCorrigidaCopyWithImpl;
@override @useResult
$Res call({
 int questaoId, int numero, Set<String> letrasMarcadas, String letraCorreta, SituacaoQuestao situacao
});




}
/// @nodoc
class __$QuestaoCorrigidaCopyWithImpl<$Res>
    implements _$QuestaoCorrigidaCopyWith<$Res> {
  __$QuestaoCorrigidaCopyWithImpl(this._self, this._then);

  final _QuestaoCorrigida _self;
  final $Res Function(_QuestaoCorrigida) _then;

/// Create a copy of QuestaoCorrigida
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questaoId = null,Object? numero = null,Object? letrasMarcadas = null,Object? letraCorreta = null,Object? situacao = null,}) {
  return _then(_QuestaoCorrigida(
questaoId: null == questaoId ? _self.questaoId : questaoId // ignore: cast_nullable_to_non_nullable
as int,numero: null == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as int,letrasMarcadas: null == letrasMarcadas ? _self._letrasMarcadas : letrasMarcadas // ignore: cast_nullable_to_non_nullable
as Set<String>,letraCorreta: null == letraCorreta ? _self.letraCorreta : letraCorreta // ignore: cast_nullable_to_non_nullable
as String,situacao: null == situacao ? _self.situacao : situacao // ignore: cast_nullable_to_non_nullable
as SituacaoQuestao,
  ));
}


}

/// @nodoc
mixin _$CorrecaoProva {

 List<QuestaoCorrigida> get questoes; double get nota; double get notaMaxima;
/// Create a copy of CorrecaoProva
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CorrecaoProvaCopyWith<CorrecaoProva> get copyWith => _$CorrecaoProvaCopyWithImpl<CorrecaoProva>(this as CorrecaoProva, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CorrecaoProva;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CorrecaoProva&&const DeepCollectionEquality().equals(other.questoes, _this.questoes)&&(identical(other.nota, _this.nota) || other.nota == _this.nota)&&(identical(other.notaMaxima, _this.notaMaxima) || other.notaMaxima == _this.notaMaxima));
}


@override
int get hashCode {
  final _this = this as CorrecaoProva;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.questoes),_this.nota,_this.notaMaxima);
}

@override
String toString() {
  final _this = this as CorrecaoProva;
  return 'CorrecaoProva(questoes: ${_this.questoes}, nota: ${_this.nota}, notaMaxima: ${_this.notaMaxima})';
}


}

/// @nodoc
abstract mixin class $CorrecaoProvaCopyWith<$Res>  {
  factory $CorrecaoProvaCopyWith(CorrecaoProva value, $Res Function(CorrecaoProva) _then) = _$CorrecaoProvaCopyWithImpl;
@useResult
$Res call({
 List<QuestaoCorrigida> questoes, double nota, double notaMaxima
});




}
/// @nodoc
class _$CorrecaoProvaCopyWithImpl<$Res>
    implements $CorrecaoProvaCopyWith<$Res> {
  _$CorrecaoProvaCopyWithImpl(this._self, this._then);

  final CorrecaoProva _self;
  final $Res Function(CorrecaoProva) _then;

/// Create a copy of CorrecaoProva
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questoes = null,Object? nota = null,Object? notaMaxima = null,}) {
  return _then(CorrecaoProva(
questoes: null == questoes ? _self.questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<QuestaoCorrigida>,nota: null == nota ? _self.nota : nota // ignore: cast_nullable_to_non_nullable
as double,notaMaxima: null == notaMaxima ? _self.notaMaxima : notaMaxima // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CorrecaoProva].
extension CorrecaoProvaPatterns on CorrecaoProva {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CorrecaoProva value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CorrecaoProva() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CorrecaoProva value)  $default,){
final _that = this;
switch (_that) {
case _CorrecaoProva():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CorrecaoProva value)?  $default,){
final _that = this;
switch (_that) {
case _CorrecaoProva() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<QuestaoCorrigida> questoes,  double nota,  double notaMaxima)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CorrecaoProva() when $default != null:
return $default(_that.questoes,_that.nota,_that.notaMaxima);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<QuestaoCorrigida> questoes,  double nota,  double notaMaxima)  $default,) {final _that = this;
switch (_that) {
case _CorrecaoProva():
return $default(_that.questoes,_that.nota,_that.notaMaxima);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<QuestaoCorrigida> questoes,  double nota,  double notaMaxima)?  $default,) {final _that = this;
switch (_that) {
case _CorrecaoProva() when $default != null:
return $default(_that.questoes,_that.nota,_that.notaMaxima);case _:
  return null;

}
}

}

/// @nodoc


class _CorrecaoProva extends CorrecaoProva {
  const _CorrecaoProva({required  List<QuestaoCorrigida> questoes, required this.nota, required this.notaMaxima}): _questoes = questoes,super._();
  

 final  List<QuestaoCorrigida> _questoes;
@override List<QuestaoCorrigida> get questoes {
  if (_questoes is EqualUnmodifiableListView) return _questoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questoes);
}

@override final  double nota;
@override final  double notaMaxima;

/// Create a copy of CorrecaoProva
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CorrecaoProvaCopyWith<_CorrecaoProva> get copyWith => __$CorrecaoProvaCopyWithImpl<_CorrecaoProva>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CorrecaoProva&&const DeepCollectionEquality().equals(other.questoes, _questoes)&&(identical(other.nota, nota) || other.nota == nota)&&(identical(other.notaMaxima, notaMaxima) || other.notaMaxima == notaMaxima));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_questoes),nota,notaMaxima);
}

@override
String toString() {
    return 'CorrecaoProva(questoes: $questoes, nota: $nota, notaMaxima: $notaMaxima)';
}


}

/// @nodoc
abstract mixin class _$CorrecaoProvaCopyWith<$Res> implements $CorrecaoProvaCopyWith<$Res> {
  factory _$CorrecaoProvaCopyWith(_CorrecaoProva value, $Res Function(_CorrecaoProva) _then) = __$CorrecaoProvaCopyWithImpl;
@override @useResult
$Res call({
 List<QuestaoCorrigida> questoes, double nota, double notaMaxima
});




}
/// @nodoc
class __$CorrecaoProvaCopyWithImpl<$Res>
    implements _$CorrecaoProvaCopyWith<$Res> {
  __$CorrecaoProvaCopyWithImpl(this._self, this._then);

  final _CorrecaoProva _self;
  final $Res Function(_CorrecaoProva) _then;

/// Create a copy of CorrecaoProva
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questoes = null,Object? nota = null,Object? notaMaxima = null,}) {
  return _then(_CorrecaoProva(
questoes: null == questoes ? _self._questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<QuestaoCorrigida>,nota: null == nota ? _self.nota : nota // ignore: cast_nullable_to_non_nullable
as double,notaMaxima: null == notaMaxima ? _self.notaMaxima : notaMaxima // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
