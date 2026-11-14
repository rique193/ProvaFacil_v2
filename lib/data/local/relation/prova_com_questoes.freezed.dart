// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prova_com_questoes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProvaComQuestoes {

 ProvaEntity get prova; List<QuestaoComAlternativas> get questoes;
/// Create a copy of ProvaComQuestoes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProvaComQuestoesCopyWith<ProvaComQuestoes> get copyWith => _$ProvaComQuestoesCopyWithImpl<ProvaComQuestoes>(this as ProvaComQuestoes, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProvaComQuestoes;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProvaComQuestoes&&(identical(other.prova, _this.prova) || other.prova == _this.prova)&&const DeepCollectionEquality().equals(other.questoes, _this.questoes));
}


@override
int get hashCode {
  final _this = this as ProvaComQuestoes;
  return Object.hash(runtimeType,_this.prova,const DeepCollectionEquality().hash(_this.questoes));
}

@override
String toString() {
  final _this = this as ProvaComQuestoes;
  return 'ProvaComQuestoes(prova: ${_this.prova}, questoes: ${_this.questoes})';
}


}

/// @nodoc
abstract mixin class $ProvaComQuestoesCopyWith<$Res>  {
  factory $ProvaComQuestoesCopyWith(ProvaComQuestoes value, $Res Function(ProvaComQuestoes) _then) = _$ProvaComQuestoesCopyWithImpl;
@useResult
$Res call({
 ProvaEntity prova, List<QuestaoComAlternativas> questoes
});




}
/// @nodoc
class _$ProvaComQuestoesCopyWithImpl<$Res>
    implements $ProvaComQuestoesCopyWith<$Res> {
  _$ProvaComQuestoesCopyWithImpl(this._self, this._then);

  final ProvaComQuestoes _self;
  final $Res Function(ProvaComQuestoes) _then;

/// Create a copy of ProvaComQuestoes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prova = null,Object? questoes = null,}) {
  return _then(ProvaComQuestoes(
prova: null == prova ? _self.prova : prova // ignore: cast_nullable_to_non_nullable
as ProvaEntity,questoes: null == questoes ? _self.questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<QuestaoComAlternativas>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProvaComQuestoes].
extension ProvaComQuestoesPatterns on ProvaComQuestoes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProvaComQuestoes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProvaComQuestoes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProvaComQuestoes value)  $default,){
final _that = this;
switch (_that) {
case _ProvaComQuestoes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProvaComQuestoes value)?  $default,){
final _that = this;
switch (_that) {
case _ProvaComQuestoes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProvaEntity prova,  List<QuestaoComAlternativas> questoes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProvaComQuestoes() when $default != null:
return $default(_that.prova,_that.questoes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProvaEntity prova,  List<QuestaoComAlternativas> questoes)  $default,) {final _that = this;
switch (_that) {
case _ProvaComQuestoes():
return $default(_that.prova,_that.questoes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProvaEntity prova,  List<QuestaoComAlternativas> questoes)?  $default,) {final _that = this;
switch (_that) {
case _ProvaComQuestoes() when $default != null:
return $default(_that.prova,_that.questoes);case _:
  return null;

}
}

}

/// @nodoc


class _ProvaComQuestoes implements ProvaComQuestoes {
  const _ProvaComQuestoes({required this.prova, required  List<QuestaoComAlternativas> questoes}): _questoes = questoes;
  

@override final  ProvaEntity prova;
 final  List<QuestaoComAlternativas> _questoes;
@override List<QuestaoComAlternativas> get questoes {
  if (_questoes is EqualUnmodifiableListView) return _questoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questoes);
}


/// Create a copy of ProvaComQuestoes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProvaComQuestoesCopyWith<_ProvaComQuestoes> get copyWith => __$ProvaComQuestoesCopyWithImpl<_ProvaComQuestoes>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProvaComQuestoes&&(identical(other.prova, prova) || other.prova == prova)&&const DeepCollectionEquality().equals(other.questoes, _questoes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,prova,const DeepCollectionEquality().hash(_questoes));
}

@override
String toString() {
    return 'ProvaComQuestoes(prova: $prova, questoes: $questoes)';
}


}

/// @nodoc
abstract mixin class _$ProvaComQuestoesCopyWith<$Res> implements $ProvaComQuestoesCopyWith<$Res> {
  factory _$ProvaComQuestoesCopyWith(_ProvaComQuestoes value, $Res Function(_ProvaComQuestoes) _then) = __$ProvaComQuestoesCopyWithImpl;
@override @useResult
$Res call({
 ProvaEntity prova, List<QuestaoComAlternativas> questoes
});




}
/// @nodoc
class __$ProvaComQuestoesCopyWithImpl<$Res>
    implements _$ProvaComQuestoesCopyWith<$Res> {
  __$ProvaComQuestoesCopyWithImpl(this._self, this._then);

  final _ProvaComQuestoes _self;
  final $Res Function(_ProvaComQuestoes) _then;

/// Create a copy of ProvaComQuestoes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prova = null,Object? questoes = null,}) {
  return _then(_ProvaComQuestoes(
prova: null == prova ? _self.prova : prova // ignore: cast_nullable_to_non_nullable
as ProvaEntity,questoes: null == questoes ? _self._questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<QuestaoComAlternativas>,
  ));
}


}

// dart format on
