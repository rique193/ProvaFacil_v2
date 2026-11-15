// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resultado_com_detalhes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResultadoComDetalhes {

 ResultadoEntity get resultado; AlunoEntity get aluno; ProvaEntity get prova; List<RespostaAlunoEntity> get respostas;
/// Create a copy of ResultadoComDetalhes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultadoComDetalhesCopyWith<ResultadoComDetalhes> get copyWith => _$ResultadoComDetalhesCopyWithImpl<ResultadoComDetalhes>(this as ResultadoComDetalhes, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ResultadoComDetalhes;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultadoComDetalhes&&(identical(other.resultado, _this.resultado) || other.resultado == _this.resultado)&&(identical(other.aluno, _this.aluno) || other.aluno == _this.aluno)&&(identical(other.prova, _this.prova) || other.prova == _this.prova)&&const DeepCollectionEquality().equals(other.respostas, _this.respostas));
}


@override
int get hashCode {
  final _this = this as ResultadoComDetalhes;
  return Object.hash(runtimeType,_this.resultado,_this.aluno,_this.prova,const DeepCollectionEquality().hash(_this.respostas));
}

@override
String toString() {
  final _this = this as ResultadoComDetalhes;
  return 'ResultadoComDetalhes(resultado: ${_this.resultado}, aluno: ${_this.aluno}, prova: ${_this.prova}, respostas: ${_this.respostas})';
}


}

/// @nodoc
abstract mixin class $ResultadoComDetalhesCopyWith<$Res>  {
  factory $ResultadoComDetalhesCopyWith(ResultadoComDetalhes value, $Res Function(ResultadoComDetalhes) _then) = _$ResultadoComDetalhesCopyWithImpl;
@useResult
$Res call({
 ResultadoEntity resultado, AlunoEntity aluno, ProvaEntity prova, List<RespostaAlunoEntity> respostas
});




}
/// @nodoc
class _$ResultadoComDetalhesCopyWithImpl<$Res>
    implements $ResultadoComDetalhesCopyWith<$Res> {
  _$ResultadoComDetalhesCopyWithImpl(this._self, this._then);

  final ResultadoComDetalhes _self;
  final $Res Function(ResultadoComDetalhes) _then;

/// Create a copy of ResultadoComDetalhes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resultado = null,Object? aluno = null,Object? prova = null,Object? respostas = null,}) {
  return _then(ResultadoComDetalhes(
resultado: null == resultado ? _self.resultado : resultado // ignore: cast_nullable_to_non_nullable
as ResultadoEntity,aluno: null == aluno ? _self.aluno : aluno // ignore: cast_nullable_to_non_nullable
as AlunoEntity,prova: null == prova ? _self.prova : prova // ignore: cast_nullable_to_non_nullable
as ProvaEntity,respostas: null == respostas ? _self.respostas : respostas // ignore: cast_nullable_to_non_nullable
as List<RespostaAlunoEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [ResultadoComDetalhes].
extension ResultadoComDetalhesPatterns on ResultadoComDetalhes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultadoComDetalhes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultadoComDetalhes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultadoComDetalhes value)  $default,){
final _that = this;
switch (_that) {
case _ResultadoComDetalhes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultadoComDetalhes value)?  $default,){
final _that = this;
switch (_that) {
case _ResultadoComDetalhes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ResultadoEntity resultado,  AlunoEntity aluno,  ProvaEntity prova,  List<RespostaAlunoEntity> respostas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultadoComDetalhes() when $default != null:
return $default(_that.resultado,_that.aluno,_that.prova,_that.respostas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ResultadoEntity resultado,  AlunoEntity aluno,  ProvaEntity prova,  List<RespostaAlunoEntity> respostas)  $default,) {final _that = this;
switch (_that) {
case _ResultadoComDetalhes():
return $default(_that.resultado,_that.aluno,_that.prova,_that.respostas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ResultadoEntity resultado,  AlunoEntity aluno,  ProvaEntity prova,  List<RespostaAlunoEntity> respostas)?  $default,) {final _that = this;
switch (_that) {
case _ResultadoComDetalhes() when $default != null:
return $default(_that.resultado,_that.aluno,_that.prova,_that.respostas);case _:
  return null;

}
}

}

/// @nodoc


class _ResultadoComDetalhes implements ResultadoComDetalhes {
  const _ResultadoComDetalhes({required this.resultado, required this.aluno, required this.prova, required  List<RespostaAlunoEntity> respostas}): _respostas = respostas;
  

@override final  ResultadoEntity resultado;
@override final  AlunoEntity aluno;
@override final  ProvaEntity prova;
 final  List<RespostaAlunoEntity> _respostas;
@override List<RespostaAlunoEntity> get respostas {
  if (_respostas is EqualUnmodifiableListView) return _respostas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_respostas);
}


/// Create a copy of ResultadoComDetalhes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultadoComDetalhesCopyWith<_ResultadoComDetalhes> get copyWith => __$ResultadoComDetalhesCopyWithImpl<_ResultadoComDetalhes>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultadoComDetalhes&&(identical(other.resultado, resultado) || other.resultado == resultado)&&(identical(other.aluno, aluno) || other.aluno == aluno)&&(identical(other.prova, prova) || other.prova == prova)&&const DeepCollectionEquality().equals(other.respostas, _respostas));
}


@override
int get hashCode {
    return Object.hash(runtimeType,resultado,aluno,prova,const DeepCollectionEquality().hash(_respostas));
}

@override
String toString() {
    return 'ResultadoComDetalhes(resultado: $resultado, aluno: $aluno, prova: $prova, respostas: $respostas)';
}


}

/// @nodoc
abstract mixin class _$ResultadoComDetalhesCopyWith<$Res> implements $ResultadoComDetalhesCopyWith<$Res> {
  factory _$ResultadoComDetalhesCopyWith(_ResultadoComDetalhes value, $Res Function(_ResultadoComDetalhes) _then) = __$ResultadoComDetalhesCopyWithImpl;
@override @useResult
$Res call({
 ResultadoEntity resultado, AlunoEntity aluno, ProvaEntity prova, List<RespostaAlunoEntity> respostas
});




}
/// @nodoc
class __$ResultadoComDetalhesCopyWithImpl<$Res>
    implements _$ResultadoComDetalhesCopyWith<$Res> {
  __$ResultadoComDetalhesCopyWithImpl(this._self, this._then);

  final _ResultadoComDetalhes _self;
  final $Res Function(_ResultadoComDetalhes) _then;

/// Create a copy of ResultadoComDetalhes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resultado = null,Object? aluno = null,Object? prova = null,Object? respostas = null,}) {
  return _then(_ResultadoComDetalhes(
resultado: null == resultado ? _self.resultado : resultado // ignore: cast_nullable_to_non_nullable
as ResultadoEntity,aluno: null == aluno ? _self.aluno : aluno // ignore: cast_nullable_to_non_nullable
as AlunoEntity,prova: null == prova ? _self.prova : prova // ignore: cast_nullable_to_non_nullable
as ProvaEntity,respostas: null == respostas ? _self._respostas : respostas // ignore: cast_nullable_to_non_nullable
as List<RespostaAlunoEntity>,
  ));
}


}

/// @nodoc
mixin _$ResultadoComAluno {

 ResultadoEntity get resultado; AlunoEntity get aluno;
/// Create a copy of ResultadoComAluno
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultadoComAlunoCopyWith<ResultadoComAluno> get copyWith => _$ResultadoComAlunoCopyWithImpl<ResultadoComAluno>(this as ResultadoComAluno, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ResultadoComAluno;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultadoComAluno&&(identical(other.resultado, _this.resultado) || other.resultado == _this.resultado)&&(identical(other.aluno, _this.aluno) || other.aluno == _this.aluno));
}


@override
int get hashCode {
  final _this = this as ResultadoComAluno;
  return Object.hash(runtimeType,_this.resultado,_this.aluno);
}

@override
String toString() {
  final _this = this as ResultadoComAluno;
  return 'ResultadoComAluno(resultado: ${_this.resultado}, aluno: ${_this.aluno})';
}


}

/// @nodoc
abstract mixin class $ResultadoComAlunoCopyWith<$Res>  {
  factory $ResultadoComAlunoCopyWith(ResultadoComAluno value, $Res Function(ResultadoComAluno) _then) = _$ResultadoComAlunoCopyWithImpl;
@useResult
$Res call({
 ResultadoEntity resultado, AlunoEntity aluno
});




}
/// @nodoc
class _$ResultadoComAlunoCopyWithImpl<$Res>
    implements $ResultadoComAlunoCopyWith<$Res> {
  _$ResultadoComAlunoCopyWithImpl(this._self, this._then);

  final ResultadoComAluno _self;
  final $Res Function(ResultadoComAluno) _then;

/// Create a copy of ResultadoComAluno
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resultado = null,Object? aluno = null,}) {
  return _then(ResultadoComAluno(
resultado: null == resultado ? _self.resultado : resultado // ignore: cast_nullable_to_non_nullable
as ResultadoEntity,aluno: null == aluno ? _self.aluno : aluno // ignore: cast_nullable_to_non_nullable
as AlunoEntity,
  ));
}

}


/// Adds pattern-matching-related methods to [ResultadoComAluno].
extension ResultadoComAlunoPatterns on ResultadoComAluno {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultadoComAluno value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultadoComAluno() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultadoComAluno value)  $default,){
final _that = this;
switch (_that) {
case _ResultadoComAluno():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultadoComAluno value)?  $default,){
final _that = this;
switch (_that) {
case _ResultadoComAluno() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ResultadoEntity resultado,  AlunoEntity aluno)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultadoComAluno() when $default != null:
return $default(_that.resultado,_that.aluno);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ResultadoEntity resultado,  AlunoEntity aluno)  $default,) {final _that = this;
switch (_that) {
case _ResultadoComAluno():
return $default(_that.resultado,_that.aluno);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ResultadoEntity resultado,  AlunoEntity aluno)?  $default,) {final _that = this;
switch (_that) {
case _ResultadoComAluno() when $default != null:
return $default(_that.resultado,_that.aluno);case _:
  return null;

}
}

}

/// @nodoc


class _ResultadoComAluno implements ResultadoComAluno {
  const _ResultadoComAluno({required this.resultado, required this.aluno});
  

@override final  ResultadoEntity resultado;
@override final  AlunoEntity aluno;

/// Create a copy of ResultadoComAluno
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultadoComAlunoCopyWith<_ResultadoComAluno> get copyWith => __$ResultadoComAlunoCopyWithImpl<_ResultadoComAluno>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultadoComAluno&&(identical(other.resultado, resultado) || other.resultado == resultado)&&(identical(other.aluno, aluno) || other.aluno == aluno));
}


@override
int get hashCode {
    return Object.hash(runtimeType,resultado,aluno);
}

@override
String toString() {
    return 'ResultadoComAluno(resultado: $resultado, aluno: $aluno)';
}


}

/// @nodoc
abstract mixin class _$ResultadoComAlunoCopyWith<$Res> implements $ResultadoComAlunoCopyWith<$Res> {
  factory _$ResultadoComAlunoCopyWith(_ResultadoComAluno value, $Res Function(_ResultadoComAluno) _then) = __$ResultadoComAlunoCopyWithImpl;
@override @useResult
$Res call({
 ResultadoEntity resultado, AlunoEntity aluno
});




}
/// @nodoc
class __$ResultadoComAlunoCopyWithImpl<$Res>
    implements _$ResultadoComAlunoCopyWith<$Res> {
  __$ResultadoComAlunoCopyWithImpl(this._self, this._then);

  final _ResultadoComAluno _self;
  final $Res Function(_ResultadoComAluno) _then;

/// Create a copy of ResultadoComAluno
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resultado = null,Object? aluno = null,}) {
  return _then(_ResultadoComAluno(
resultado: null == resultado ? _self.resultado : resultado // ignore: cast_nullable_to_non_nullable
as ResultadoEntity,aluno: null == aluno ? _self.aluno : aluno // ignore: cast_nullable_to_non_nullable
as AlunoEntity,
  ));
}


}

// dart format on
