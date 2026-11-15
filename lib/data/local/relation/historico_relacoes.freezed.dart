// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'historico_relacoes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProvaCorrigida {

 int get provaId; String get titulo; String get disciplina; int get totalCorrigidos; double get media;/// `corrigidoEm` do resultado mais recente da prova.
 int get ultimaCorrecaoEm;/// Turmas dos alunos corrigidos, separadas por vírgula pelo `GROUP_CONCAT` (pode ser nulo).
 String? get turmas;
/// Create a copy of ProvaCorrigida
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProvaCorrigidaCopyWith<ProvaCorrigida> get copyWith => _$ProvaCorrigidaCopyWithImpl<ProvaCorrigida>(this as ProvaCorrigida, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProvaCorrigida;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProvaCorrigida&&(identical(other.provaId, _this.provaId) || other.provaId == _this.provaId)&&(identical(other.titulo, _this.titulo) || other.titulo == _this.titulo)&&(identical(other.disciplina, _this.disciplina) || other.disciplina == _this.disciplina)&&(identical(other.totalCorrigidos, _this.totalCorrigidos) || other.totalCorrigidos == _this.totalCorrigidos)&&(identical(other.media, _this.media) || other.media == _this.media)&&(identical(other.ultimaCorrecaoEm, _this.ultimaCorrecaoEm) || other.ultimaCorrecaoEm == _this.ultimaCorrecaoEm)&&(identical(other.turmas, _this.turmas) || other.turmas == _this.turmas));
}


@override
int get hashCode {
  final _this = this as ProvaCorrigida;
  return Object.hash(runtimeType,_this.provaId,_this.titulo,_this.disciplina,_this.totalCorrigidos,_this.media,_this.ultimaCorrecaoEm,_this.turmas);
}

@override
String toString() {
  final _this = this as ProvaCorrigida;
  return 'ProvaCorrigida(provaId: ${_this.provaId}, titulo: ${_this.titulo}, disciplina: ${_this.disciplina}, totalCorrigidos: ${_this.totalCorrigidos}, media: ${_this.media}, ultimaCorrecaoEm: ${_this.ultimaCorrecaoEm}, turmas: ${_this.turmas})';
}


}

/// @nodoc
abstract mixin class $ProvaCorrigidaCopyWith<$Res>  {
  factory $ProvaCorrigidaCopyWith(ProvaCorrigida value, $Res Function(ProvaCorrigida) _then) = _$ProvaCorrigidaCopyWithImpl;
@useResult
$Res call({
 int provaId, String titulo, String disciplina, int totalCorrigidos, double media, int ultimaCorrecaoEm, String? turmas
});




}
/// @nodoc
class _$ProvaCorrigidaCopyWithImpl<$Res>
    implements $ProvaCorrigidaCopyWith<$Res> {
  _$ProvaCorrigidaCopyWithImpl(this._self, this._then);

  final ProvaCorrigida _self;
  final $Res Function(ProvaCorrigida) _then;

/// Create a copy of ProvaCorrigida
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provaId = null,Object? titulo = null,Object? disciplina = null,Object? totalCorrigidos = null,Object? media = null,Object? ultimaCorrecaoEm = null,Object? turmas = freezed,}) {
  return _then(ProvaCorrigida(
provaId: null == provaId ? _self.provaId : provaId // ignore: cast_nullable_to_non_nullable
as int,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,disciplina: null == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String,totalCorrigidos: null == totalCorrigidos ? _self.totalCorrigidos : totalCorrigidos // ignore: cast_nullable_to_non_nullable
as int,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as double,ultimaCorrecaoEm: null == ultimaCorrecaoEm ? _self.ultimaCorrecaoEm : ultimaCorrecaoEm // ignore: cast_nullable_to_non_nullable
as int,turmas: freezed == turmas ? _self.turmas : turmas // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProvaCorrigida].
extension ProvaCorrigidaPatterns on ProvaCorrigida {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProvaCorrigida value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProvaCorrigida() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProvaCorrigida value)  $default,){
final _that = this;
switch (_that) {
case _ProvaCorrigida():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProvaCorrigida value)?  $default,){
final _that = this;
switch (_that) {
case _ProvaCorrigida() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int provaId,  String titulo,  String disciplina,  int totalCorrigidos,  double media,  int ultimaCorrecaoEm,  String? turmas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProvaCorrigida() when $default != null:
return $default(_that.provaId,_that.titulo,_that.disciplina,_that.totalCorrigidos,_that.media,_that.ultimaCorrecaoEm,_that.turmas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int provaId,  String titulo,  String disciplina,  int totalCorrigidos,  double media,  int ultimaCorrecaoEm,  String? turmas)  $default,) {final _that = this;
switch (_that) {
case _ProvaCorrigida():
return $default(_that.provaId,_that.titulo,_that.disciplina,_that.totalCorrigidos,_that.media,_that.ultimaCorrecaoEm,_that.turmas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int provaId,  String titulo,  String disciplina,  int totalCorrigidos,  double media,  int ultimaCorrecaoEm,  String? turmas)?  $default,) {final _that = this;
switch (_that) {
case _ProvaCorrigida() when $default != null:
return $default(_that.provaId,_that.titulo,_that.disciplina,_that.totalCorrigidos,_that.media,_that.ultimaCorrecaoEm,_that.turmas);case _:
  return null;

}
}

}

/// @nodoc


class _ProvaCorrigida implements ProvaCorrigida {
  const _ProvaCorrigida({required this.provaId, required this.titulo, required this.disciplina, required this.totalCorrigidos, required this.media, required this.ultimaCorrecaoEm, required this.turmas});
  

@override final  int provaId;
@override final  String titulo;
@override final  String disciplina;
@override final  int totalCorrigidos;
@override final  double media;
/// `corrigidoEm` do resultado mais recente da prova.
@override final  int ultimaCorrecaoEm;
/// Turmas dos alunos corrigidos, separadas por vírgula pelo `GROUP_CONCAT` (pode ser nulo).
@override final  String? turmas;

/// Create a copy of ProvaCorrigida
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProvaCorrigidaCopyWith<_ProvaCorrigida> get copyWith => __$ProvaCorrigidaCopyWithImpl<_ProvaCorrigida>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProvaCorrigida&&(identical(other.provaId, provaId) || other.provaId == provaId)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.disciplina, disciplina) || other.disciplina == disciplina)&&(identical(other.totalCorrigidos, totalCorrigidos) || other.totalCorrigidos == totalCorrigidos)&&(identical(other.media, media) || other.media == media)&&(identical(other.ultimaCorrecaoEm, ultimaCorrecaoEm) || other.ultimaCorrecaoEm == ultimaCorrecaoEm)&&(identical(other.turmas, turmas) || other.turmas == turmas));
}


@override
int get hashCode {
    return Object.hash(runtimeType,provaId,titulo,disciplina,totalCorrigidos,media,ultimaCorrecaoEm,turmas);
}

@override
String toString() {
    return 'ProvaCorrigida(provaId: $provaId, titulo: $titulo, disciplina: $disciplina, totalCorrigidos: $totalCorrigidos, media: $media, ultimaCorrecaoEm: $ultimaCorrecaoEm, turmas: $turmas)';
}


}

/// @nodoc
abstract mixin class _$ProvaCorrigidaCopyWith<$Res> implements $ProvaCorrigidaCopyWith<$Res> {
  factory _$ProvaCorrigidaCopyWith(_ProvaCorrigida value, $Res Function(_ProvaCorrigida) _then) = __$ProvaCorrigidaCopyWithImpl;
@override @useResult
$Res call({
 int provaId, String titulo, String disciplina, int totalCorrigidos, double media, int ultimaCorrecaoEm, String? turmas
});




}
/// @nodoc
class __$ProvaCorrigidaCopyWithImpl<$Res>
    implements _$ProvaCorrigidaCopyWith<$Res> {
  __$ProvaCorrigidaCopyWithImpl(this._self, this._then);

  final _ProvaCorrigida _self;
  final $Res Function(_ProvaCorrigida) _then;

/// Create a copy of ProvaCorrigida
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provaId = null,Object? titulo = null,Object? disciplina = null,Object? totalCorrigidos = null,Object? media = null,Object? ultimaCorrecaoEm = null,Object? turmas = freezed,}) {
  return _then(_ProvaCorrigida(
provaId: null == provaId ? _self.provaId : provaId // ignore: cast_nullable_to_non_nullable
as int,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,disciplina: null == disciplina ? _self.disciplina : disciplina // ignore: cast_nullable_to_non_nullable
as String,totalCorrigidos: null == totalCorrigidos ? _self.totalCorrigidos : totalCorrigidos // ignore: cast_nullable_to_non_nullable
as int,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as double,ultimaCorrecaoEm: null == ultimaCorrecaoEm ? _self.ultimaCorrecaoEm : ultimaCorrecaoEm // ignore: cast_nullable_to_non_nullable
as int,turmas: freezed == turmas ? _self.turmas : turmas // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$NotaAluno {

 int get alunoId; String get nome; String? get matricula; int get acertos; double get nota;
/// Create a copy of NotaAluno
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotaAlunoCopyWith<NotaAluno> get copyWith => _$NotaAlunoCopyWithImpl<NotaAluno>(this as NotaAluno, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NotaAluno;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotaAluno&&(identical(other.alunoId, _this.alunoId) || other.alunoId == _this.alunoId)&&(identical(other.nome, _this.nome) || other.nome == _this.nome)&&(identical(other.matricula, _this.matricula) || other.matricula == _this.matricula)&&(identical(other.acertos, _this.acertos) || other.acertos == _this.acertos)&&(identical(other.nota, _this.nota) || other.nota == _this.nota));
}


@override
int get hashCode {
  final _this = this as NotaAluno;
  return Object.hash(runtimeType,_this.alunoId,_this.nome,_this.matricula,_this.acertos,_this.nota);
}

@override
String toString() {
  final _this = this as NotaAluno;
  return 'NotaAluno(alunoId: ${_this.alunoId}, nome: ${_this.nome}, matricula: ${_this.matricula}, acertos: ${_this.acertos}, nota: ${_this.nota})';
}


}

/// @nodoc
abstract mixin class $NotaAlunoCopyWith<$Res>  {
  factory $NotaAlunoCopyWith(NotaAluno value, $Res Function(NotaAluno) _then) = _$NotaAlunoCopyWithImpl;
@useResult
$Res call({
 int alunoId, String nome, String? matricula, int acertos, double nota
});




}
/// @nodoc
class _$NotaAlunoCopyWithImpl<$Res>
    implements $NotaAlunoCopyWith<$Res> {
  _$NotaAlunoCopyWithImpl(this._self, this._then);

  final NotaAluno _self;
  final $Res Function(NotaAluno) _then;

/// Create a copy of NotaAluno
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? alunoId = null,Object? nome = null,Object? matricula = freezed,Object? acertos = null,Object? nota = null,}) {
  return _then(NotaAluno(
alunoId: null == alunoId ? _self.alunoId : alunoId // ignore: cast_nullable_to_non_nullable
as int,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,matricula: freezed == matricula ? _self.matricula : matricula // ignore: cast_nullable_to_non_nullable
as String?,acertos: null == acertos ? _self.acertos : acertos // ignore: cast_nullable_to_non_nullable
as int,nota: null == nota ? _self.nota : nota // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [NotaAluno].
extension NotaAlunoPatterns on NotaAluno {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotaAluno value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotaAluno() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotaAluno value)  $default,){
final _that = this;
switch (_that) {
case _NotaAluno():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotaAluno value)?  $default,){
final _that = this;
switch (_that) {
case _NotaAluno() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int alunoId,  String nome,  String? matricula,  int acertos,  double nota)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotaAluno() when $default != null:
return $default(_that.alunoId,_that.nome,_that.matricula,_that.acertos,_that.nota);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int alunoId,  String nome,  String? matricula,  int acertos,  double nota)  $default,) {final _that = this;
switch (_that) {
case _NotaAluno():
return $default(_that.alunoId,_that.nome,_that.matricula,_that.acertos,_that.nota);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int alunoId,  String nome,  String? matricula,  int acertos,  double nota)?  $default,) {final _that = this;
switch (_that) {
case _NotaAluno() when $default != null:
return $default(_that.alunoId,_that.nome,_that.matricula,_that.acertos,_that.nota);case _:
  return null;

}
}

}

/// @nodoc


class _NotaAluno implements NotaAluno {
  const _NotaAluno({required this.alunoId, required this.nome, required this.matricula, required this.acertos, required this.nota});
  

@override final  int alunoId;
@override final  String nome;
@override final  String? matricula;
@override final  int acertos;
@override final  double nota;

/// Create a copy of NotaAluno
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotaAlunoCopyWith<_NotaAluno> get copyWith => __$NotaAlunoCopyWithImpl<_NotaAluno>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotaAluno&&(identical(other.alunoId, alunoId) || other.alunoId == alunoId)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.matricula, matricula) || other.matricula == matricula)&&(identical(other.acertos, acertos) || other.acertos == acertos)&&(identical(other.nota, nota) || other.nota == nota));
}


@override
int get hashCode {
    return Object.hash(runtimeType,alunoId,nome,matricula,acertos,nota);
}

@override
String toString() {
    return 'NotaAluno(alunoId: $alunoId, nome: $nome, matricula: $matricula, acertos: $acertos, nota: $nota)';
}


}

/// @nodoc
abstract mixin class _$NotaAlunoCopyWith<$Res> implements $NotaAlunoCopyWith<$Res> {
  factory _$NotaAlunoCopyWith(_NotaAluno value, $Res Function(_NotaAluno) _then) = __$NotaAlunoCopyWithImpl;
@override @useResult
$Res call({
 int alunoId, String nome, String? matricula, int acertos, double nota
});




}
/// @nodoc
class __$NotaAlunoCopyWithImpl<$Res>
    implements _$NotaAlunoCopyWith<$Res> {
  __$NotaAlunoCopyWithImpl(this._self, this._then);

  final _NotaAluno _self;
  final $Res Function(_NotaAluno) _then;

/// Create a copy of NotaAluno
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? alunoId = null,Object? nome = null,Object? matricula = freezed,Object? acertos = null,Object? nota = null,}) {
  return _then(_NotaAluno(
alunoId: null == alunoId ? _self.alunoId : alunoId // ignore: cast_nullable_to_non_nullable
as int,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,matricula: freezed == matricula ? _self.matricula : matricula // ignore: cast_nullable_to_non_nullable
as String?,acertos: null == acertos ? _self.acertos : acertos // ignore: cast_nullable_to_non_nullable
as int,nota: null == nota ? _self.nota : nota // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
