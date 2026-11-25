// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_code_prova.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DadosQrCode {

 int get provaId; String get aluno; String get turma;
/// Create a copy of DadosQrCode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DadosQrCodeCopyWith<DadosQrCode> get copyWith => _$DadosQrCodeCopyWithImpl<DadosQrCode>(this as DadosQrCode, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DadosQrCode;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DadosQrCode&&(identical(other.provaId, _this.provaId) || other.provaId == _this.provaId)&&(identical(other.aluno, _this.aluno) || other.aluno == _this.aluno)&&(identical(other.turma, _this.turma) || other.turma == _this.turma));
}


@override
int get hashCode {
  final _this = this as DadosQrCode;
  return Object.hash(runtimeType,_this.provaId,_this.aluno,_this.turma);
}

@override
String toString() {
  final _this = this as DadosQrCode;
  return 'DadosQrCode(provaId: ${_this.provaId}, aluno: ${_this.aluno}, turma: ${_this.turma})';
}


}

/// @nodoc
abstract mixin class $DadosQrCodeCopyWith<$Res>  {
  factory $DadosQrCodeCopyWith(DadosQrCode value, $Res Function(DadosQrCode) _then) = _$DadosQrCodeCopyWithImpl;
@useResult
$Res call({
 int provaId, String aluno, String turma
});




}
/// @nodoc
class _$DadosQrCodeCopyWithImpl<$Res>
    implements $DadosQrCodeCopyWith<$Res> {
  _$DadosQrCodeCopyWithImpl(this._self, this._then);

  final DadosQrCode _self;
  final $Res Function(DadosQrCode) _then;

/// Create a copy of DadosQrCode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provaId = null,Object? aluno = null,Object? turma = null,}) {
  return _then(DadosQrCode(
provaId: null == provaId ? _self.provaId : provaId // ignore: cast_nullable_to_non_nullable
as int,aluno: null == aluno ? _self.aluno : aluno // ignore: cast_nullable_to_non_nullable
as String,turma: null == turma ? _self.turma : turma // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DadosQrCode].
extension DadosQrCodePatterns on DadosQrCode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DadosQrCode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DadosQrCode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DadosQrCode value)  $default,){
final _that = this;
switch (_that) {
case _DadosQrCode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DadosQrCode value)?  $default,){
final _that = this;
switch (_that) {
case _DadosQrCode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int provaId,  String aluno,  String turma)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DadosQrCode() when $default != null:
return $default(_that.provaId,_that.aluno,_that.turma);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int provaId,  String aluno,  String turma)  $default,) {final _that = this;
switch (_that) {
case _DadosQrCode():
return $default(_that.provaId,_that.aluno,_that.turma);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int provaId,  String aluno,  String turma)?  $default,) {final _that = this;
switch (_that) {
case _DadosQrCode() when $default != null:
return $default(_that.provaId,_that.aluno,_that.turma);case _:
  return null;

}
}

}

/// @nodoc


class _DadosQrCode implements DadosQrCode {
  const _DadosQrCode({required this.provaId, required this.aluno, this.turma = ''});
  

@override final  int provaId;
@override final  String aluno;
@override@JsonKey() final  String turma;

/// Create a copy of DadosQrCode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DadosQrCodeCopyWith<_DadosQrCode> get copyWith => __$DadosQrCodeCopyWithImpl<_DadosQrCode>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DadosQrCode&&(identical(other.provaId, provaId) || other.provaId == provaId)&&(identical(other.aluno, aluno) || other.aluno == aluno)&&(identical(other.turma, turma) || other.turma == turma));
}


@override
int get hashCode {
    return Object.hash(runtimeType,provaId,aluno,turma);
}

@override
String toString() {
    return 'DadosQrCode(provaId: $provaId, aluno: $aluno, turma: $turma)';
}


}

/// @nodoc
abstract mixin class _$DadosQrCodeCopyWith<$Res> implements $DadosQrCodeCopyWith<$Res> {
  factory _$DadosQrCodeCopyWith(_DadosQrCode value, $Res Function(_DadosQrCode) _then) = __$DadosQrCodeCopyWithImpl;
@override @useResult
$Res call({
 int provaId, String aluno, String turma
});




}
/// @nodoc
class __$DadosQrCodeCopyWithImpl<$Res>
    implements _$DadosQrCodeCopyWith<$Res> {
  __$DadosQrCodeCopyWithImpl(this._self, this._then);

  final _DadosQrCode _self;
  final $Res Function(_DadosQrCode) _then;

/// Create a copy of DadosQrCode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provaId = null,Object? aluno = null,Object? turma = null,}) {
  return _then(_DadosQrCode(
provaId: null == provaId ? _self.provaId : provaId // ignore: cast_nullable_to_non_nullable
as int,aluno: null == aluno ? _self.aluno : aluno // ignore: cast_nullable_to_non_nullable
as String,turma: null == turma ? _self.turma : turma // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Valido {

 DadosQrCode get dados;
/// Create a copy of Valido
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidoCopyWith<Valido> get copyWith => _$ValidoCopyWithImpl<Valido>(this as Valido, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Valido;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Valido&&(identical(other.dados, _this.dados) || other.dados == _this.dados));
}


@override
int get hashCode {
  final _this = this as Valido;
  return Object.hash(runtimeType,_this.dados);
}

@override
String toString() {
  final _this = this as Valido;
  return 'Valido(dados: ${_this.dados})';
}


}

/// @nodoc
abstract mixin class $ValidoCopyWith<$Res>  {
  factory $ValidoCopyWith(Valido value, $Res Function(Valido) _then) = _$ValidoCopyWithImpl;
@useResult
$Res call({
 DadosQrCode dados
});


$DadosQrCodeCopyWith<$Res> get dados;

}
/// @nodoc
class _$ValidoCopyWithImpl<$Res>
    implements $ValidoCopyWith<$Res> {
  _$ValidoCopyWithImpl(this._self, this._then);

  final Valido _self;
  final $Res Function(Valido) _then;

/// Create a copy of Valido
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dados = null,}) {
  return _then(Valido(
null == dados ? _self.dados : dados // ignore: cast_nullable_to_non_nullable
as DadosQrCode,
  ));
}
/// Create a copy of Valido
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DadosQrCodeCopyWith<$Res> get dados {
  
  return $DadosQrCodeCopyWith<$Res>(_self.dados, (value) {
    return _then(_self.copyWith(dados: value));
  });
}
}


/// Adds pattern-matching-related methods to [Valido].
extension ValidoPatterns on Valido {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Valido value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Valido() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Valido value)  $default,){
final _that = this;
switch (_that) {
case _Valido():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Valido value)?  $default,){
final _that = this;
switch (_that) {
case _Valido() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DadosQrCode dados)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Valido() when $default != null:
return $default(_that.dados);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DadosQrCode dados)  $default,) {final _that = this;
switch (_that) {
case _Valido():
return $default(_that.dados);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DadosQrCode dados)?  $default,) {final _that = this;
switch (_that) {
case _Valido() when $default != null:
return $default(_that.dados);case _:
  return null;

}
}

}

/// @nodoc


class _Valido extends Valido {
  const _Valido(this.dados): super._();
  

@override final  DadosQrCode dados;

/// Create a copy of Valido
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidoCopyWith<_Valido> get copyWith => __$ValidoCopyWithImpl<_Valido>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Valido&&(identical(other.dados, dados) || other.dados == dados));
}


@override
int get hashCode {
    return Object.hash(runtimeType,dados);
}

@override
String toString() {
    return 'Valido(dados: $dados)';
}


}

/// @nodoc
abstract mixin class _$ValidoCopyWith<$Res> implements $ValidoCopyWith<$Res> {
  factory _$ValidoCopyWith(_Valido value, $Res Function(_Valido) _then) = __$ValidoCopyWithImpl;
@override @useResult
$Res call({
 DadosQrCode dados
});


@override $DadosQrCodeCopyWith<$Res> get dados;

}
/// @nodoc
class __$ValidoCopyWithImpl<$Res>
    implements _$ValidoCopyWith<$Res> {
  __$ValidoCopyWithImpl(this._self, this._then);

  final _Valido _self;
  final $Res Function(_Valido) _then;

/// Create a copy of Valido
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dados = null,}) {
  return _then(_Valido(
null == dados ? _self.dados : dados // ignore: cast_nullable_to_non_nullable
as DadosQrCode,
  ));
}

/// Create a copy of Valido
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DadosQrCodeCopyWith<$Res> get dados {
  
  return $DadosQrCodeCopyWith<$Res>(_self.dados, (value) {
    return _then(_self.copyWith(dados: value));
  });
}
}

/// @nodoc
mixin _$Invalido {

 MotivoQrInvalido get motivo;
/// Create a copy of Invalido
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidoCopyWith<Invalido> get copyWith => _$InvalidoCopyWithImpl<Invalido>(this as Invalido, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Invalido;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Invalido&&(identical(other.motivo, _this.motivo) || other.motivo == _this.motivo));
}


@override
int get hashCode {
  final _this = this as Invalido;
  return Object.hash(runtimeType,_this.motivo);
}

@override
String toString() {
  final _this = this as Invalido;
  return 'Invalido(motivo: ${_this.motivo})';
}


}

/// @nodoc
abstract mixin class $InvalidoCopyWith<$Res>  {
  factory $InvalidoCopyWith(Invalido value, $Res Function(Invalido) _then) = _$InvalidoCopyWithImpl;
@useResult
$Res call({
 MotivoQrInvalido motivo
});




}
/// @nodoc
class _$InvalidoCopyWithImpl<$Res>
    implements $InvalidoCopyWith<$Res> {
  _$InvalidoCopyWithImpl(this._self, this._then);

  final Invalido _self;
  final $Res Function(Invalido) _then;

/// Create a copy of Invalido
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? motivo = null,}) {
  return _then(Invalido(
null == motivo ? _self.motivo : motivo // ignore: cast_nullable_to_non_nullable
as MotivoQrInvalido,
  ));
}

}


/// Adds pattern-matching-related methods to [Invalido].
extension InvalidoPatterns on Invalido {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Invalido value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Invalido() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Invalido value)  $default,){
final _that = this;
switch (_that) {
case _Invalido():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Invalido value)?  $default,){
final _that = this;
switch (_that) {
case _Invalido() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MotivoQrInvalido motivo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Invalido() when $default != null:
return $default(_that.motivo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MotivoQrInvalido motivo)  $default,) {final _that = this;
switch (_that) {
case _Invalido():
return $default(_that.motivo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MotivoQrInvalido motivo)?  $default,) {final _that = this;
switch (_that) {
case _Invalido() when $default != null:
return $default(_that.motivo);case _:
  return null;

}
}

}

/// @nodoc


class _Invalido extends Invalido {
  const _Invalido(this.motivo): super._();
  

@override final  MotivoQrInvalido motivo;

/// Create a copy of Invalido
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvalidoCopyWith<_Invalido> get copyWith => __$InvalidoCopyWithImpl<_Invalido>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Invalido&&(identical(other.motivo, motivo) || other.motivo == motivo));
}


@override
int get hashCode {
    return Object.hash(runtimeType,motivo);
}

@override
String toString() {
    return 'Invalido(motivo: $motivo)';
}


}

/// @nodoc
abstract mixin class _$InvalidoCopyWith<$Res> implements $InvalidoCopyWith<$Res> {
  factory _$InvalidoCopyWith(_Invalido value, $Res Function(_Invalido) _then) = __$InvalidoCopyWithImpl;
@override @useResult
$Res call({
 MotivoQrInvalido motivo
});




}
/// @nodoc
class __$InvalidoCopyWithImpl<$Res>
    implements _$InvalidoCopyWith<$Res> {
  __$InvalidoCopyWithImpl(this._self, this._then);

  final _Invalido _self;
  final $Res Function(_Invalido) _then;

/// Create a copy of Invalido
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? motivo = null,}) {
  return _then(_Invalido(
null == motivo ? _self.motivo : motivo // ignore: cast_nullable_to_non_nullable
as MotivoQrInvalido,
  ));
}


}

// dart format on
