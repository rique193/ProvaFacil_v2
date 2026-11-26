// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prova_form_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlternativaFormState {

 String get texto; int? get id;
/// Create a copy of AlternativaFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlternativaFormStateCopyWith<AlternativaFormState> get copyWith => _$AlternativaFormStateCopyWithImpl<AlternativaFormState>(this as AlternativaFormState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AlternativaFormState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlternativaFormState&&(identical(other.texto, _this.texto) || other.texto == _this.texto)&&(identical(other.id, _this.id) || other.id == _this.id));
}


@override
int get hashCode {
  final _this = this as AlternativaFormState;
  return Object.hash(runtimeType,_this.texto,_this.id);
}

@override
String toString() {
  final _this = this as AlternativaFormState;
  return 'AlternativaFormState(texto: ${_this.texto}, id: ${_this.id})';
}


}

/// @nodoc
abstract mixin class $AlternativaFormStateCopyWith<$Res>  {
  factory $AlternativaFormStateCopyWith(AlternativaFormState value, $Res Function(AlternativaFormState) _then) = _$AlternativaFormStateCopyWithImpl;
@useResult
$Res call({
 String texto, int? id
});




}
/// @nodoc
class _$AlternativaFormStateCopyWithImpl<$Res>
    implements $AlternativaFormStateCopyWith<$Res> {
  _$AlternativaFormStateCopyWithImpl(this._self, this._then);

  final AlternativaFormState _self;
  final $Res Function(AlternativaFormState) _then;

/// Create a copy of AlternativaFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? texto = null,Object? id = freezed,}) {
  return _then(AlternativaFormState(
texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AlternativaFormState].
extension AlternativaFormStatePatterns on AlternativaFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlternativaFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlternativaFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlternativaFormState value)  $default,){
final _that = this;
switch (_that) {
case _AlternativaFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlternativaFormState value)?  $default,){
final _that = this;
switch (_that) {
case _AlternativaFormState() when $default != null:
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
case _AlternativaFormState() when $default != null:
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
case _AlternativaFormState():
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
case _AlternativaFormState() when $default != null:
return $default(_that.texto,_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _AlternativaFormState implements AlternativaFormState {
  const _AlternativaFormState({this.texto = '', this.id});
  

@override@JsonKey() final  String texto;
@override final  int? id;

/// Create a copy of AlternativaFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlternativaFormStateCopyWith<_AlternativaFormState> get copyWith => __$AlternativaFormStateCopyWithImpl<_AlternativaFormState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlternativaFormState&&(identical(other.texto, texto) || other.texto == texto)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,texto,id);
}

@override
String toString() {
    return 'AlternativaFormState(texto: $texto, id: $id)';
}


}

/// @nodoc
abstract mixin class _$AlternativaFormStateCopyWith<$Res> implements $AlternativaFormStateCopyWith<$Res> {
  factory _$AlternativaFormStateCopyWith(_AlternativaFormState value, $Res Function(_AlternativaFormState) _then) = __$AlternativaFormStateCopyWithImpl;
@override @useResult
$Res call({
 String texto, int? id
});




}
/// @nodoc
class __$AlternativaFormStateCopyWithImpl<$Res>
    implements _$AlternativaFormStateCopyWith<$Res> {
  __$AlternativaFormStateCopyWithImpl(this._self, this._then);

  final _AlternativaFormState _self;
  final $Res Function(_AlternativaFormState) _then;

/// Create a copy of AlternativaFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? texto = null,Object? id = freezed,}) {
  return _then(_AlternativaFormState(
texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$QuestaoFormState {

 String get enunciado; int? get id; List<AlternativaFormState> get alternativas;
/// Create a copy of QuestaoFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestaoFormStateCopyWith<QuestaoFormState> get copyWith => _$QuestaoFormStateCopyWithImpl<QuestaoFormState>(this as QuestaoFormState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as QuestaoFormState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestaoFormState&&(identical(other.enunciado, _this.enunciado) || other.enunciado == _this.enunciado)&&(identical(other.id, _this.id) || other.id == _this.id)&&const DeepCollectionEquality().equals(other.alternativas, _this.alternativas));
}


@override
int get hashCode {
  final _this = this as QuestaoFormState;
  return Object.hash(runtimeType,_this.enunciado,_this.id,const DeepCollectionEquality().hash(_this.alternativas));
}

@override
String toString() {
  final _this = this as QuestaoFormState;
  return 'QuestaoFormState(enunciado: ${_this.enunciado}, id: ${_this.id}, alternativas: ${_this.alternativas})';
}


}

/// @nodoc
abstract mixin class $QuestaoFormStateCopyWith<$Res>  {
  factory $QuestaoFormStateCopyWith(QuestaoFormState value, $Res Function(QuestaoFormState) _then) = _$QuestaoFormStateCopyWithImpl;
@useResult
$Res call({
 String enunciado, int? id, List<AlternativaFormState> alternativas
});




}
/// @nodoc
class _$QuestaoFormStateCopyWithImpl<$Res>
    implements $QuestaoFormStateCopyWith<$Res> {
  _$QuestaoFormStateCopyWithImpl(this._self, this._then);

  final QuestaoFormState _self;
  final $Res Function(QuestaoFormState) _then;

/// Create a copy of QuestaoFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enunciado = null,Object? id = freezed,Object? alternativas = null,}) {
  return _then(QuestaoFormState(
enunciado: null == enunciado ? _self.enunciado : enunciado // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,alternativas: null == alternativas ? _self.alternativas : alternativas // ignore: cast_nullable_to_non_nullable
as List<AlternativaFormState>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestaoFormState].
extension QuestaoFormStatePatterns on QuestaoFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestaoFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestaoFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestaoFormState value)  $default,){
final _that = this;
switch (_that) {
case _QuestaoFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestaoFormState value)?  $default,){
final _that = this;
switch (_that) {
case _QuestaoFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String enunciado,  int? id,  List<AlternativaFormState> alternativas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestaoFormState() when $default != null:
return $default(_that.enunciado,_that.id,_that.alternativas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String enunciado,  int? id,  List<AlternativaFormState> alternativas)  $default,) {final _that = this;
switch (_that) {
case _QuestaoFormState():
return $default(_that.enunciado,_that.id,_that.alternativas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String enunciado,  int? id,  List<AlternativaFormState> alternativas)?  $default,) {final _that = this;
switch (_that) {
case _QuestaoFormState() when $default != null:
return $default(_that.enunciado,_that.id,_that.alternativas);case _:
  return null;

}
}

}

/// @nodoc


class _QuestaoFormState implements QuestaoFormState {
  const _QuestaoFormState({this.enunciado = '', this.id,  List<AlternativaFormState> alternativas = const [AlternativaFormState(), AlternativaFormState(), AlternativaFormState(), AlternativaFormState(), AlternativaFormState()]}): _alternativas = alternativas;
  

@override@JsonKey() final  String enunciado;
@override final  int? id;
 final  List<AlternativaFormState> _alternativas;
@override@JsonKey() List<AlternativaFormState> get alternativas {
  if (_alternativas is EqualUnmodifiableListView) return _alternativas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alternativas);
}


/// Create a copy of QuestaoFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestaoFormStateCopyWith<_QuestaoFormState> get copyWith => __$QuestaoFormStateCopyWithImpl<_QuestaoFormState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestaoFormState&&(identical(other.enunciado, enunciado) || other.enunciado == enunciado)&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.alternativas, _alternativas));
}


@override
int get hashCode {
    return Object.hash(runtimeType,enunciado,id,const DeepCollectionEquality().hash(_alternativas));
}

@override
String toString() {
    return 'QuestaoFormState(enunciado: $enunciado, id: $id, alternativas: $alternativas)';
}


}

/// @nodoc
abstract mixin class _$QuestaoFormStateCopyWith<$Res> implements $QuestaoFormStateCopyWith<$Res> {
  factory _$QuestaoFormStateCopyWith(_QuestaoFormState value, $Res Function(_QuestaoFormState) _then) = __$QuestaoFormStateCopyWithImpl;
@override @useResult
$Res call({
 String enunciado, int? id, List<AlternativaFormState> alternativas
});




}
/// @nodoc
class __$QuestaoFormStateCopyWithImpl<$Res>
    implements _$QuestaoFormStateCopyWith<$Res> {
  __$QuestaoFormStateCopyWithImpl(this._self, this._then);

  final _QuestaoFormState _self;
  final $Res Function(_QuestaoFormState) _then;

/// Create a copy of QuestaoFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enunciado = null,Object? id = freezed,Object? alternativas = null,}) {
  return _then(_QuestaoFormState(
enunciado: null == enunciado ? _self.enunciado : enunciado // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,alternativas: null == alternativas ? _self._alternativas : alternativas // ignore: cast_nullable_to_non_nullable
as List<AlternativaFormState>,
  ));
}


}

/// @nodoc
mixin _$ProvaFormUiState {

 int? get provaId; String get titulo; String get disciplina; String get turma; String get descricao; List<DisciplinaEntity> get disciplinas; List<TurmaEntity> get turmas; List<QuestaoFormState> get questoes; bool get carregando; String? get erro; bool get salvo;
/// Create a copy of ProvaFormUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProvaFormUiStateCopyWith<ProvaFormUiState> get copyWith => _$ProvaFormUiStateCopyWithImpl<ProvaFormUiState>(this as ProvaFormUiState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProvaFormUiState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProvaFormUiState&&(identical(other.provaId, _this.provaId) || other.provaId == _this.provaId)&&(identical(other.titulo, _this.titulo) || other.titulo == _this.titulo)&&(identical(other.disciplina, _this.disciplina) || other.disciplina == _this.disciplina)&&(identical(other.turma, _this.turma) || other.turma == _this.turma)&&(identical(other.descricao, _this.descricao) || other.descricao == _this.descricao)&&const DeepCollectionEquality().equals(other.disciplinas, _this.disciplinas)&&const DeepCollectionEquality().equals(other.turmas, _this.turmas)&&const DeepCollectionEquality().equals(other.questoes, _this.questoes)&&(identical(other.carregando, _this.carregando) || other.carregando == _this.carregando)&&(identical(other.erro, _this.erro) || other.erro == _this.erro)&&(identical(other.salvo, _this.salvo) || other.salvo == _this.salvo));
}


@override
int get hashCode {
  final _this = this as ProvaFormUiState;
  return Object.hash(runtimeType,_this.provaId,_this.titulo,_this.disciplina,_this.turma,_this.descricao,const DeepCollectionEquality().hash(_this.disciplinas),const DeepCollectionEquality().hash(_this.turmas),const DeepCollectionEquality().hash(_this.questoes),_this.carregando,_this.erro,_this.salvo);
}

@override
String toString() {
  final _this = this as ProvaFormUiState;
  return 'ProvaFormUiState(provaId: ${_this.provaId}, titulo: ${_this.titulo}, disciplina: ${_this.disciplina}, turma: ${_this.turma}, descricao: ${_this.descricao}, disciplinas: ${_this.disciplinas}, turmas: ${_this.turmas}, questoes: ${_this.questoes}, carregando: ${_this.carregando}, erro: ${_this.erro}, salvo: ${_this.salvo})';
}


}

/// @nodoc
abstract mixin class $ProvaFormUiStateCopyWith<$Res>  {
  factory $ProvaFormUiStateCopyWith(ProvaFormUiState value, $Res Function(ProvaFormUiState) _then) = _$ProvaFormUiStateCopyWithImpl;
@useResult
$Res call({
 int? provaId, String titulo, String disciplina, String turma, String descricao, List<DisciplinaEntity> disciplinas, List<TurmaEntity> turmas, List<QuestaoFormState> questoes, bool carregando, String? erro, bool salvo
});




}
/// @nodoc
class _$ProvaFormUiStateCopyWithImpl<$Res>
    implements $ProvaFormUiStateCopyWith<$Res> {
  _$ProvaFormUiStateCopyWithImpl(this._self, this._then);

  final ProvaFormUiState _self;
  final $Res Function(ProvaFormUiState) _then;

/// Create a copy of ProvaFormUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provaId = freezed,Object? titulo = null,Object? disciplina = null,Object? turma = null,Object? descricao = null,Object? disciplinas = null,Object? turmas = null,Object? questoes = null,Object? carregando = null,Object? erro = freezed,Object? salvo = null,}) {
  return _then(ProvaFormUiState(
provaId: freezed == provaId ? _self.provaId : provaId // ignore: cast_nullable_to_non_nullable
as int?,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,disciplina: null == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String,turma: null == turma ? _self.turma : turma // ignore: cast_nullable_to_non_nullable
as String,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,disciplinas: null == disciplinas ? _self.disciplinas : disciplinas // ignore: cast_nullable_to_non_nullable
as List<DisciplinaEntity>,turmas: null == turmas ? _self.turmas : turmas // ignore: cast_nullable_to_non_nullable
as List<TurmaEntity>,questoes: null == questoes ? _self.questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<QuestaoFormState>,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,salvo: null == salvo ? _self.salvo : salvo // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProvaFormUiState].
extension ProvaFormUiStatePatterns on ProvaFormUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProvaFormUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProvaFormUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProvaFormUiState value)  $default,){
final _that = this;
switch (_that) {
case _ProvaFormUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProvaFormUiState value)?  $default,){
final _that = this;
switch (_that) {
case _ProvaFormUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? provaId,  String titulo,  String disciplina,  String turma,  String descricao,  List<DisciplinaEntity> disciplinas,  List<TurmaEntity> turmas,  List<QuestaoFormState> questoes,  bool carregando,  String? erro,  bool salvo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProvaFormUiState() when $default != null:
return $default(_that.provaId,_that.titulo,_that.disciplina,_that.turma,_that.descricao,_that.disciplinas,_that.turmas,_that.questoes,_that.carregando,_that.erro,_that.salvo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? provaId,  String titulo,  String disciplina,  String turma,  String descricao,  List<DisciplinaEntity> disciplinas,  List<TurmaEntity> turmas,  List<QuestaoFormState> questoes,  bool carregando,  String? erro,  bool salvo)  $default,) {final _that = this;
switch (_that) {
case _ProvaFormUiState():
return $default(_that.provaId,_that.titulo,_that.disciplina,_that.turma,_that.descricao,_that.disciplinas,_that.turmas,_that.questoes,_that.carregando,_that.erro,_that.salvo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? provaId,  String titulo,  String disciplina,  String turma,  String descricao,  List<DisciplinaEntity> disciplinas,  List<TurmaEntity> turmas,  List<QuestaoFormState> questoes,  bool carregando,  String? erro,  bool salvo)?  $default,) {final _that = this;
switch (_that) {
case _ProvaFormUiState() when $default != null:
return $default(_that.provaId,_that.titulo,_that.disciplina,_that.turma,_that.descricao,_that.disciplinas,_that.turmas,_that.questoes,_that.carregando,_that.erro,_that.salvo);case _:
  return null;

}
}

}

/// @nodoc


class _ProvaFormUiState extends ProvaFormUiState {
  const _ProvaFormUiState({this.provaId, this.titulo = '', this.disciplina = '', this.turma = '', this.descricao = '',  List<DisciplinaEntity> disciplinas = const [],  List<TurmaEntity> turmas = const [],  List<QuestaoFormState> questoes = const [QuestaoFormState()], this.carregando = false, this.erro, this.salvo = false}): _disciplinas = disciplinas,_turmas = turmas,_questoes = questoes,super._();
  

@override final  int? provaId;
@override@JsonKey() final  String titulo;
@override@JsonKey() final  String disciplina;
@override@JsonKey() final  String turma;
@override@JsonKey() final  String descricao;
 final  List<DisciplinaEntity> _disciplinas;
@override@JsonKey() List<DisciplinaEntity> get disciplinas {
  if (_disciplinas is EqualUnmodifiableListView) return _disciplinas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_disciplinas);
}

 final  List<TurmaEntity> _turmas;
@override@JsonKey() List<TurmaEntity> get turmas {
  if (_turmas is EqualUnmodifiableListView) return _turmas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_turmas);
}

 final  List<QuestaoFormState> _questoes;
@override@JsonKey() List<QuestaoFormState> get questoes {
  if (_questoes is EqualUnmodifiableListView) return _questoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questoes);
}

@override@JsonKey() final  bool carregando;
@override final  String? erro;
@override@JsonKey() final  bool salvo;

/// Create a copy of ProvaFormUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProvaFormUiStateCopyWith<_ProvaFormUiState> get copyWith => __$ProvaFormUiStateCopyWithImpl<_ProvaFormUiState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProvaFormUiState&&(identical(other.provaId, provaId) || other.provaId == provaId)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.disciplina, disciplina) || other.disciplina == disciplina)&&(identical(other.turma, turma) || other.turma == turma)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&const DeepCollectionEquality().equals(other.disciplinas, _disciplinas)&&const DeepCollectionEquality().equals(other.turmas, _turmas)&&const DeepCollectionEquality().equals(other.questoes, _questoes)&&(identical(other.carregando, carregando) || other.carregando == carregando)&&(identical(other.erro, erro) || other.erro == erro)&&(identical(other.salvo, salvo) || other.salvo == salvo));
}


@override
int get hashCode {
    return Object.hash(runtimeType,provaId,titulo,disciplina,turma,descricao,const DeepCollectionEquality().hash(_disciplinas),const DeepCollectionEquality().hash(_turmas),const DeepCollectionEquality().hash(_questoes),carregando,erro,salvo);
}

@override
String toString() {
    return 'ProvaFormUiState(provaId: $provaId, titulo: $titulo, disciplina: $disciplina, turma: $turma, descricao: $descricao, disciplinas: $disciplinas, turmas: $turmas, questoes: $questoes, carregando: $carregando, erro: $erro, salvo: $salvo)';
}


}

/// @nodoc
abstract mixin class _$ProvaFormUiStateCopyWith<$Res> implements $ProvaFormUiStateCopyWith<$Res> {
  factory _$ProvaFormUiStateCopyWith(_ProvaFormUiState value, $Res Function(_ProvaFormUiState) _then) = __$ProvaFormUiStateCopyWithImpl;
@override @useResult
$Res call({
 int? provaId, String titulo, String disciplina, String turma, String descricao, List<DisciplinaEntity> disciplinas, List<TurmaEntity> turmas, List<QuestaoFormState> questoes, bool carregando, String? erro, bool salvo
});




}
/// @nodoc
class __$ProvaFormUiStateCopyWithImpl<$Res>
    implements _$ProvaFormUiStateCopyWith<$Res> {
  __$ProvaFormUiStateCopyWithImpl(this._self, this._then);

  final _ProvaFormUiState _self;
  final $Res Function(_ProvaFormUiState) _then;

/// Create a copy of ProvaFormUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provaId = freezed,Object? titulo = null,Object? disciplina = null,Object? turma = null,Object? descricao = null,Object? disciplinas = null,Object? turmas = null,Object? questoes = null,Object? carregando = null,Object? erro = freezed,Object? salvo = null,}) {
  return _then(_ProvaFormUiState(
provaId: freezed == provaId ? _self.provaId : provaId // ignore: cast_nullable_to_non_nullable
as int?,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,disciplina: null == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String,turma: null == turma ? _self.turma : turma // ignore: cast_nullable_to_non_nullable
as String,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,disciplinas: null == disciplinas ? _self._disciplinas : disciplinas // ignore: cast_nullable_to_non_nullable
as List<DisciplinaEntity>,turmas: null == turmas ? _self._turmas : turmas // ignore: cast_nullable_to_non_nullable
as List<TurmaEntity>,questoes: null == questoes ? _self._questoes : questoes // ignore: cast_nullable_to_non_nullable
as List<QuestaoFormState>,carregando: null == carregando ? _self.carregando : carregando // ignore: cast_nullable_to_non_nullable
as bool,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,salvo: null == salvo ? _self.salvo : salvo // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
