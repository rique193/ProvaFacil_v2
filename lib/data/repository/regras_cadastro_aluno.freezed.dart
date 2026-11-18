// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'regras_cadastro_aluno.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DecisaoCadastroAluno {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DecisaoCadastroAluno);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DecisaoCadastroAluno()';
}


}

/// @nodoc
class $DecisaoCadastroAlunoCopyWith<$Res>  {
$DecisaoCadastroAlunoCopyWith(DecisaoCadastroAluno _, $Res Function(DecisaoCadastroAluno) __);
}


/// Adds pattern-matching-related methods to [DecisaoCadastroAluno].
extension DecisaoCadastroAlunoPatterns on DecisaoCadastroAluno {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Inserir value)?  inserir,TResult Function( Completar value)?  completar,TResult Function( Recusar value)?  recusar,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Inserir() when inserir != null:
return inserir(_that);case Completar() when completar != null:
return completar(_that);case Recusar() when recusar != null:
return recusar(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Inserir value)  inserir,required TResult Function( Completar value)  completar,required TResult Function( Recusar value)  recusar,}){
final _that = this;
switch (_that) {
case Inserir():
return inserir(_that);case Completar():
return completar(_that);case Recusar():
return recusar(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Inserir value)?  inserir,TResult? Function( Completar value)?  completar,TResult? Function( Recusar value)?  recusar,}){
final _that = this;
switch (_that) {
case Inserir() when inserir != null:
return inserir(_that);case Completar() when completar != null:
return completar(_that);case Recusar() when recusar != null:
return recusar(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  inserir,TResult Function( AlunoEntity aluno)?  completar,TResult Function( String mensagem)?  recusar,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Inserir() when inserir != null:
return inserir();case Completar() when completar != null:
return completar(_that.aluno);case Recusar() when recusar != null:
return recusar(_that.mensagem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  inserir,required TResult Function( AlunoEntity aluno)  completar,required TResult Function( String mensagem)  recusar,}) {final _that = this;
switch (_that) {
case Inserir():
return inserir();case Completar():
return completar(_that.aluno);case Recusar():
return recusar(_that.mensagem);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  inserir,TResult? Function( AlunoEntity aluno)?  completar,TResult? Function( String mensagem)?  recusar,}) {final _that = this;
switch (_that) {
case Inserir() when inserir != null:
return inserir();case Completar() when completar != null:
return completar(_that.aluno);case Recusar() when recusar != null:
return recusar(_that.mensagem);case _:
  return null;

}
}

}

/// @nodoc


class Inserir implements DecisaoCadastroAluno {
  const Inserir();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Inserir);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DecisaoCadastroAluno.inserir()';
}


}




/// @nodoc


class Completar implements DecisaoCadastroAluno {
  const Completar(this.aluno);
  

 final  AlunoEntity aluno;

/// Create a copy of DecisaoCadastroAluno
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompletarCopyWith<Completar> get copyWith => _$CompletarCopyWithImpl<Completar>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Completar&&(identical(other.aluno, aluno) || other.aluno == aluno));
}


@override
int get hashCode {
    return Object.hash(runtimeType,aluno);
}

@override
String toString() {
    return 'DecisaoCadastroAluno.completar(aluno: $aluno)';
}


}

/// @nodoc
abstract mixin class $CompletarCopyWith<$Res> implements $DecisaoCadastroAlunoCopyWith<$Res> {
  factory $CompletarCopyWith(Completar value, $Res Function(Completar) _then) = _$CompletarCopyWithImpl;
@useResult
$Res call({
 AlunoEntity aluno
});




}
/// @nodoc
class _$CompletarCopyWithImpl<$Res>
    implements $CompletarCopyWith<$Res> {
  _$CompletarCopyWithImpl(this._self, this._then);

  final Completar _self;
  final $Res Function(Completar) _then;

/// Create a copy of DecisaoCadastroAluno
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? aluno = null,}) {
  return _then(Completar(
null == aluno ? _self.aluno : aluno // ignore: cast_nullable_to_non_nullable
as AlunoEntity,
  ));
}


}

/// @nodoc


class Recusar implements DecisaoCadastroAluno {
  const Recusar(this.mensagem);
  

 final  String mensagem;

/// Create a copy of DecisaoCadastroAluno
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecusarCopyWith<Recusar> get copyWith => _$RecusarCopyWithImpl<Recusar>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Recusar&&(identical(other.mensagem, mensagem) || other.mensagem == mensagem));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mensagem);
}

@override
String toString() {
    return 'DecisaoCadastroAluno.recusar(mensagem: $mensagem)';
}


}

/// @nodoc
abstract mixin class $RecusarCopyWith<$Res> implements $DecisaoCadastroAlunoCopyWith<$Res> {
  factory $RecusarCopyWith(Recusar value, $Res Function(Recusar) _then) = _$RecusarCopyWithImpl;
@useResult
$Res call({
 String mensagem
});




}
/// @nodoc
class _$RecusarCopyWithImpl<$Res>
    implements $RecusarCopyWith<$Res> {
  _$RecusarCopyWithImpl(this._self, this._then);

  final Recusar _self;
  final $Res Function(Recusar) _then;

/// Create a copy of DecisaoCadastroAluno
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mensagem = null,}) {
  return _then(Recusar(
null == mensagem ? _self.mensagem : mensagem // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$DadosAluno {

 String get nome; String get turma; String? get matricula; String? get email;
/// Create a copy of DadosAluno
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DadosAlunoCopyWith<DadosAluno> get copyWith => _$DadosAlunoCopyWithImpl<DadosAluno>(this as DadosAluno, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DadosAluno;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DadosAluno&&(identical(other.nome, _this.nome) || other.nome == _this.nome)&&(identical(other.turma, _this.turma) || other.turma == _this.turma)&&(identical(other.matricula, _this.matricula) || other.matricula == _this.matricula)&&(identical(other.email, _this.email) || other.email == _this.email));
}


@override
int get hashCode {
  final _this = this as DadosAluno;
  return Object.hash(runtimeType,_this.nome,_this.turma,_this.matricula,_this.email);
}

@override
String toString() {
  final _this = this as DadosAluno;
  return 'DadosAluno(nome: ${_this.nome}, turma: ${_this.turma}, matricula: ${_this.matricula}, email: ${_this.email})';
}


}

/// @nodoc
abstract mixin class $DadosAlunoCopyWith<$Res>  {
  factory $DadosAlunoCopyWith(DadosAluno value, $Res Function(DadosAluno) _then) = _$DadosAlunoCopyWithImpl;
@useResult
$Res call({
 String nome, String turma, String? matricula, String? email
});




}
/// @nodoc
class _$DadosAlunoCopyWithImpl<$Res>
    implements $DadosAlunoCopyWith<$Res> {
  _$DadosAlunoCopyWithImpl(this._self, this._then);

  final DadosAluno _self;
  final $Res Function(DadosAluno) _then;

/// Create a copy of DadosAluno
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nome = null,Object? turma = null,Object? matricula = freezed,Object? email = freezed,}) {
  return _then(DadosAluno(
nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,turma: null == turma ? _self.turma : turma // ignore: cast_nullable_to_non_nullable
as String,matricula: freezed == matricula ? _self.matricula : matricula // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DadosAluno].
extension DadosAlunoPatterns on DadosAluno {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DadosAluno value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DadosAluno() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DadosAluno value)  $default,){
final _that = this;
switch (_that) {
case _DadosAluno():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DadosAluno value)?  $default,){
final _that = this;
switch (_that) {
case _DadosAluno() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nome,  String turma,  String? matricula,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DadosAluno() when $default != null:
return $default(_that.nome,_that.turma,_that.matricula,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nome,  String turma,  String? matricula,  String? email)  $default,) {final _that = this;
switch (_that) {
case _DadosAluno():
return $default(_that.nome,_that.turma,_that.matricula,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nome,  String turma,  String? matricula,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _DadosAluno() when $default != null:
return $default(_that.nome,_that.turma,_that.matricula,_that.email);case _:
  return null;

}
}

}

/// @nodoc


class _DadosAluno implements DadosAluno {
  const _DadosAluno({required this.nome, required this.turma, required this.matricula, required this.email});
  

@override final  String nome;
@override final  String turma;
@override final  String? matricula;
@override final  String? email;

/// Create a copy of DadosAluno
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DadosAlunoCopyWith<_DadosAluno> get copyWith => __$DadosAlunoCopyWithImpl<_DadosAluno>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DadosAluno&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.turma, turma) || other.turma == turma)&&(identical(other.matricula, matricula) || other.matricula == matricula)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode {
    return Object.hash(runtimeType,nome,turma,matricula,email);
}

@override
String toString() {
    return 'DadosAluno(nome: $nome, turma: $turma, matricula: $matricula, email: $email)';
}


}

/// @nodoc
abstract mixin class _$DadosAlunoCopyWith<$Res> implements $DadosAlunoCopyWith<$Res> {
  factory _$DadosAlunoCopyWith(_DadosAluno value, $Res Function(_DadosAluno) _then) = __$DadosAlunoCopyWithImpl;
@override @useResult
$Res call({
 String nome, String turma, String? matricula, String? email
});




}
/// @nodoc
class __$DadosAlunoCopyWithImpl<$Res>
    implements _$DadosAlunoCopyWith<$Res> {
  __$DadosAlunoCopyWithImpl(this._self, this._then);

  final _DadosAluno _self;
  final $Res Function(_DadosAluno) _then;

/// Create a copy of DadosAluno
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nome = null,Object? turma = null,Object? matricula = freezed,Object? email = freezed,}) {
  return _then(_DadosAluno(
nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,turma: null == turma ? _self.turma : turma // ignore: cast_nullable_to_non_nullable
as String,matricula: freezed == matricula ? _self.matricula : matricula // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
