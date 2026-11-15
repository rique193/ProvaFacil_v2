// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estatisticas_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DadosEstatisticasProva {

 ProvaEntity? get prova;/// Turmas separadas por vírgula, como vêm do `GROUP_CONCAT`.
 String? get turmas; List<NotaAluno> get notas; List<QuestaoDaProva> get questoes; List<RespostaRegistrada> get respostas;
/// Create a copy of DadosEstatisticasProva
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DadosEstatisticasProvaCopyWith<DadosEstatisticasProva> get copyWith => _$DadosEstatisticasProvaCopyWithImpl<DadosEstatisticasProva>(this as DadosEstatisticasProva, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DadosEstatisticasProva;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DadosEstatisticasProva&&(identical(other.prova, _this.prova) || other.prova == _this.prova)&&(identical(other.turmas, _this.turmas) || other.turmas == _this.turmas)&&const DeepCollectionEquality().equals(other.notas, _this.notas)&&const DeepCollectionEquality().equals(other.questoes, _this.questoes)&&const DeepCollectionEquality().equals(other.respostas, _this.respostas));
}


@override
int get hashCode {
  final _this = this as DadosEstatisticasProva;
  return Object.hash(runtimeType,_this.prova,_this.turmas,const DeepCollectionEquality().hash(_this.notas),const DeepCollectionEquality().hash(_this.questoes),const DeepCollectionEquality().hash(_this.respostas));
}

@override
String toString() {
  final _this = this as DadosEstatisticasProva;
  return 'DadosEstatisticasProva(prova: ${_this.prova}, turmas: ${_this.turmas}, notas: ${_this.notas}, questoes: ${_this.questoes}, respostas: ${_this.respostas})';
}


}

/// @nodoc
abstract mixin class $DadosEstatisticasProvaCopyWith<$Res>  {
  factory $DadosEstatisticasProvaCopyWith(DadosEstatisticasProva value, $Res Function(DadosEstatisticasProva) _then) = _$DadosEstatisticasProvaCopyWithImpl;
@useResult
$Res call({
 ProvaEntity? prova, String? turmas, List<NotaAluno> notas, List<QuestaoDaProva> questoes, List<RespostaRegistrada> respostas
});




}
/// @nodoc
class _$DadosEstatisticasProvaCopyWithImpl<$Res>
    implements $DadosEstatisticasProvaCopyWith<$Res> {
  _$DadosEstatisticasProvaCopyWithImpl(this._self, this._then);

  final DadosEstatisticasProva _self;
  final $Res Function(DadosEstatisticasProva) _then;

/// Create a copy of DadosEstatisticasProva
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prova = freezed,Object? turmas = freezed,Object? notas = null,Object? questoes = null,Object? respostas = null,}) {
  return _then(DadosEstatisticasProva(
prova: freezed == prova ? _self.prova : prova // ignore: cast_nullable_to_non_nullable
as ProvaEntity?,turmas: freezed == turmas ? _self.turmas : turmas // ignore: cast_nullable_to_non_nullable
as String?,notas: null == notas ? _self.notas : notas // ignore: cast_nullable_to_non_nullable
as List<NotaAluno>,questoes: null == questoes ? _self.questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<QuestaoDaProva>,respostas: null == respostas ? _self.respostas : respostas // ignore: cast_nullable_to_non_nullable
as List<RespostaRegistrada>,
  ));
}

}


/// Adds pattern-matching-related methods to [DadosEstatisticasProva].
extension DadosEstatisticasProvaPatterns on DadosEstatisticasProva {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DadosEstatisticasProva value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DadosEstatisticasProva() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DadosEstatisticasProva value)  $default,){
final _that = this;
switch (_that) {
case _DadosEstatisticasProva():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DadosEstatisticasProva value)?  $default,){
final _that = this;
switch (_that) {
case _DadosEstatisticasProva() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProvaEntity? prova,  String? turmas,  List<NotaAluno> notas,  List<QuestaoDaProva> questoes,  List<RespostaRegistrada> respostas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DadosEstatisticasProva() when $default != null:
return $default(_that.prova,_that.turmas,_that.notas,_that.questoes,_that.respostas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProvaEntity? prova,  String? turmas,  List<NotaAluno> notas,  List<QuestaoDaProva> questoes,  List<RespostaRegistrada> respostas)  $default,) {final _that = this;
switch (_that) {
case _DadosEstatisticasProva():
return $default(_that.prova,_that.turmas,_that.notas,_that.questoes,_that.respostas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProvaEntity? prova,  String? turmas,  List<NotaAluno> notas,  List<QuestaoDaProva> questoes,  List<RespostaRegistrada> respostas)?  $default,) {final _that = this;
switch (_that) {
case _DadosEstatisticasProva() when $default != null:
return $default(_that.prova,_that.turmas,_that.notas,_that.questoes,_that.respostas);case _:
  return null;

}
}

}

/// @nodoc


class _DadosEstatisticasProva implements DadosEstatisticasProva {
  const _DadosEstatisticasProva({required this.prova, required this.turmas, required  List<NotaAluno> notas, required  List<QuestaoDaProva> questoes, required  List<RespostaRegistrada> respostas}): _notas = notas,_questoes = questoes,_respostas = respostas;
  

@override final  ProvaEntity? prova;
/// Turmas separadas por vírgula, como vêm do `GROUP_CONCAT`.
@override final  String? turmas;
 final  List<NotaAluno> _notas;
@override List<NotaAluno> get notas {
  if (_notas is EqualUnmodifiableListView) return _notas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notas);
}

 final  List<QuestaoDaProva> _questoes;
@override List<QuestaoDaProva> get questoes {
  if (_questoes is EqualUnmodifiableListView) return _questoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questoes);
}

 final  List<RespostaRegistrada> _respostas;
@override List<RespostaRegistrada> get respostas {
  if (_respostas is EqualUnmodifiableListView) return _respostas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_respostas);
}


/// Create a copy of DadosEstatisticasProva
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DadosEstatisticasProvaCopyWith<_DadosEstatisticasProva> get copyWith => __$DadosEstatisticasProvaCopyWithImpl<_DadosEstatisticasProva>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DadosEstatisticasProva&&(identical(other.prova, prova) || other.prova == prova)&&(identical(other.turmas, turmas) || other.turmas == turmas)&&const DeepCollectionEquality().equals(other.notas, _notas)&&const DeepCollectionEquality().equals(other.questoes, _questoes)&&const DeepCollectionEquality().equals(other.respostas, _respostas));
}


@override
int get hashCode {
    return Object.hash(runtimeType,prova,turmas,const DeepCollectionEquality().hash(_notas),const DeepCollectionEquality().hash(_questoes),const DeepCollectionEquality().hash(_respostas));
}

@override
String toString() {
    return 'DadosEstatisticasProva(prova: $prova, turmas: $turmas, notas: $notas, questoes: $questoes, respostas: $respostas)';
}


}

/// @nodoc
abstract mixin class _$DadosEstatisticasProvaCopyWith<$Res> implements $DadosEstatisticasProvaCopyWith<$Res> {
  factory _$DadosEstatisticasProvaCopyWith(_DadosEstatisticasProva value, $Res Function(_DadosEstatisticasProva) _then) = __$DadosEstatisticasProvaCopyWithImpl;
@override @useResult
$Res call({
 ProvaEntity? prova, String? turmas, List<NotaAluno> notas, List<QuestaoDaProva> questoes, List<RespostaRegistrada> respostas
});




}
/// @nodoc
class __$DadosEstatisticasProvaCopyWithImpl<$Res>
    implements _$DadosEstatisticasProvaCopyWith<$Res> {
  __$DadosEstatisticasProvaCopyWithImpl(this._self, this._then);

  final _DadosEstatisticasProva _self;
  final $Res Function(_DadosEstatisticasProva) _then;

/// Create a copy of DadosEstatisticasProva
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prova = freezed,Object? turmas = freezed,Object? notas = null,Object? questoes = null,Object? respostas = null,}) {
  return _then(_DadosEstatisticasProva(
prova: freezed == prova ? _self.prova : prova // ignore: cast_nullable_to_non_nullable
as ProvaEntity?,turmas: freezed == turmas ? _self.turmas : turmas // ignore: cast_nullable_to_non_nullable
as String?,notas: null == notas ? _self._notas : notas // ignore: cast_nullable_to_non_nullable
as List<NotaAluno>,questoes: null == questoes ? _self._questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<QuestaoDaProva>,respostas: null == respostas ? _self._respostas : respostas // ignore: cast_nullable_to_non_nullable
as List<RespostaRegistrada>,
  ));
}


}

// dart format on
