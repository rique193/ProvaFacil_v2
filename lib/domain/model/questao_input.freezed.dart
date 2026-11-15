// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questao_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuestaoInput {

 String get enunciado; List<AlternativaInput> get alternativas; int? get id;
/// Create a copy of QuestaoInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestaoInputCopyWith<QuestaoInput> get copyWith => _$QuestaoInputCopyWithImpl<QuestaoInput>(this as QuestaoInput, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as QuestaoInput;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestaoInput&&(identical(other.enunciado, _this.enunciado) || other.enunciado == _this.enunciado)&&const DeepCollectionEquality().equals(other.alternativas, _this.alternativas)&&(identical(other.id, _this.id) || other.id == _this.id));
}


@override
int get hashCode {
  final _this = this as QuestaoInput;
  return Object.hash(runtimeType,_this.enunciado,const DeepCollectionEquality().hash(_this.alternativas),_this.id);
}

@override
String toString() {
  final _this = this as QuestaoInput;
  return 'QuestaoInput(enunciado: ${_this.enunciado}, alternativas: ${_this.alternativas}, id: ${_this.id})';
}


}

/// @nodoc
abstract mixin class $QuestaoInputCopyWith<$Res>  {
  factory $QuestaoInputCopyWith(QuestaoInput value, $Res Function(QuestaoInput) _then) = _$QuestaoInputCopyWithImpl;
@useResult
$Res call({
 String enunciado, List<AlternativaInput> alternativas, int? id
});




}
/// @nodoc
class _$QuestaoInputCopyWithImpl<$Res>
    implements $QuestaoInputCopyWith<$Res> {
  _$QuestaoInputCopyWithImpl(this._self, this._then);

  final QuestaoInput _self;
  final $Res Function(QuestaoInput) _then;

/// Create a copy of QuestaoInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enunciado = null,Object? alternativas = null,Object? id = freezed,}) {
  return _then(QuestaoInput(
enunciado: null == enunciado ? _self.enunciado : enunciado // ignore: cast_nullable_to_non_nullable
as String,alternativas: null == alternativas ? _self.alternativas : alternativas // ignore: cast_nullable_to_non_nullable
as List<AlternativaInput>,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestaoInput].
extension QuestaoInputPatterns on QuestaoInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestaoInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestaoInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestaoInput value)  $default,){
final _that = this;
switch (_that) {
case _QuestaoInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestaoInput value)?  $default,){
final _that = this;
switch (_that) {
case _QuestaoInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String enunciado,  List<AlternativaInput> alternativas,  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestaoInput() when $default != null:
return $default(_that.enunciado,_that.alternativas,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String enunciado,  List<AlternativaInput> alternativas,  int? id)  $default,) {final _that = this;
switch (_that) {
case _QuestaoInput():
return $default(_that.enunciado,_that.alternativas,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String enunciado,  List<AlternativaInput> alternativas,  int? id)?  $default,) {final _that = this;
switch (_that) {
case _QuestaoInput() when $default != null:
return $default(_that.enunciado,_that.alternativas,_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _QuestaoInput implements QuestaoInput {
  const _QuestaoInput({required this.enunciado, required  List<AlternativaInput> alternativas, this.id}): _alternativas = alternativas;
  

@override final  String enunciado;
 final  List<AlternativaInput> _alternativas;
@override List<AlternativaInput> get alternativas {
  if (_alternativas is EqualUnmodifiableListView) return _alternativas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alternativas);
}

@override final  int? id;

/// Create a copy of QuestaoInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestaoInputCopyWith<_QuestaoInput> get copyWith => __$QuestaoInputCopyWithImpl<_QuestaoInput>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestaoInput&&(identical(other.enunciado, enunciado) || other.enunciado == enunciado)&&const DeepCollectionEquality().equals(other.alternativas, _alternativas)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,enunciado,const DeepCollectionEquality().hash(_alternativas),id);
}

@override
String toString() {
    return 'QuestaoInput(enunciado: $enunciado, alternativas: $alternativas, id: $id)';
}


}

/// @nodoc
abstract mixin class _$QuestaoInputCopyWith<$Res> implements $QuestaoInputCopyWith<$Res> {
  factory _$QuestaoInputCopyWith(_QuestaoInput value, $Res Function(_QuestaoInput) _then) = __$QuestaoInputCopyWithImpl;
@override @useResult
$Res call({
 String enunciado, List<AlternativaInput> alternativas, int? id
});




}
/// @nodoc
class __$QuestaoInputCopyWithImpl<$Res>
    implements _$QuestaoInputCopyWith<$Res> {
  __$QuestaoInputCopyWithImpl(this._self, this._then);

  final _QuestaoInput _self;
  final $Res Function(_QuestaoInput) _then;

/// Create a copy of QuestaoInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enunciado = null,Object? alternativas = null,Object? id = freezed,}) {
  return _then(_QuestaoInput(
enunciado: null == enunciado ? _self.enunciado : enunciado // ignore: cast_nullable_to_non_nullable
as String,alternativas: null == alternativas ? _self._alternativas : alternativas // ignore: cast_nullable_to_non_nullable
as List<AlternativaInput>,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$AlternativaInput {

 String get texto; int? get id;
/// Create a copy of AlternativaInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlternativaInputCopyWith<AlternativaInput> get copyWith => _$AlternativaInputCopyWithImpl<AlternativaInput>(this as AlternativaInput, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AlternativaInput;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlternativaInput&&(identical(other.texto, _this.texto) || other.texto == _this.texto)&&(identical(other.id, _this.id) || other.id == _this.id));
}


@override
int get hashCode {
  final _this = this as AlternativaInput;
  return Object.hash(runtimeType,_this.texto,_this.id);
}

@override
String toString() {
  final _this = this as AlternativaInput;
  return 'AlternativaInput(texto: ${_this.texto}, id: ${_this.id})';
}


}

/// @nodoc
abstract mixin class $AlternativaInputCopyWith<$Res>  {
  factory $AlternativaInputCopyWith(AlternativaInput value, $Res Function(AlternativaInput) _then) = _$AlternativaInputCopyWithImpl;
@useResult
$Res call({
 String texto, int? id
});




}
/// @nodoc
class _$AlternativaInputCopyWithImpl<$Res>
    implements $AlternativaInputCopyWith<$Res> {
  _$AlternativaInputCopyWithImpl(this._self, this._then);

  final AlternativaInput _self;
  final $Res Function(AlternativaInput) _then;

/// Create a copy of AlternativaInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? texto = null,Object? id = freezed,}) {
  return _then(AlternativaInput(
texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AlternativaInput].
extension AlternativaInputPatterns on AlternativaInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlternativaInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlternativaInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlternativaInput value)  $default,){
final _that = this;
switch (_that) {
case _AlternativaInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlternativaInput value)?  $default,){
final _that = this;
switch (_that) {
case _AlternativaInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String texto,  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlternativaInput() when $default != null:
return $default(_that.texto,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String texto,  int? id)  $default,) {final _that = this;
switch (_that) {
case _AlternativaInput():
return $default(_that.texto,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String texto,  int? id)?  $default,) {final _that = this;
switch (_that) {
case _AlternativaInput() when $default != null:
return $default(_that.texto,_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _AlternativaInput implements AlternativaInput {
  const _AlternativaInput({required this.texto, this.id});
  

@override final  String texto;
@override final  int? id;

/// Create a copy of AlternativaInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlternativaInputCopyWith<_AlternativaInput> get copyWith => __$AlternativaInputCopyWithImpl<_AlternativaInput>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlternativaInput&&(identical(other.texto, texto) || other.texto == texto)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,texto,id);
}

@override
String toString() {
    return 'AlternativaInput(texto: $texto, id: $id)';
}


}

/// @nodoc
abstract mixin class _$AlternativaInputCopyWith<$Res> implements $AlternativaInputCopyWith<$Res> {
  factory _$AlternativaInputCopyWith(_AlternativaInput value, $Res Function(_AlternativaInput) _then) = __$AlternativaInputCopyWithImpl;
@override @useResult
$Res call({
 String texto, int? id
});




}
/// @nodoc
class __$AlternativaInputCopyWithImpl<$Res>
    implements _$AlternativaInputCopyWith<$Res> {
  __$AlternativaInputCopyWithImpl(this._self, this._then);

  final _AlternativaInput _self;
  final $Res Function(_AlternativaInput) _then;

/// Create a copy of AlternativaInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? texto = null,Object? id = freezed,}) {
  return _then(_AlternativaInput(
texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
