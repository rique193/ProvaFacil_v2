// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProvasTable extends Provas with TableInfo<$ProvasTable, ProvaEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProvasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _tituloMeta = const VerificationMeta('titulo');
  @override
  late final GeneratedColumn<String> titulo = GeneratedColumn<String>(
    'titulo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _disciplinaMeta = const VerificationMeta(
    'disciplina',
  );
  @override
  late final GeneratedColumn<String> disciplina = GeneratedColumn<String>(
    'disciplina',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descricaoMeta = const VerificationMeta(
    'descricao',
  );
  @override
  late final GeneratedColumn<String> descricao = GeneratedColumn<String>(
    'descricao',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _criadaEmMeta = const VerificationMeta(
    'criadaEm',
  );
  @override
  late final GeneratedColumn<int> criadaEm = GeneratedColumn<int>(
    'criadaEm',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().millisecondsSinceEpoch,
  );
  static const VerificationMeta _turmaMeta = const VerificationMeta('turma');
  @override
  late final GeneratedColumn<String> turma = GeneratedColumn<String>(
    'turma',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    titulo,
    disciplina,
    descricao,
    criadaEm,
    turma,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'provas';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProvaEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('titulo')) {
      context.handle(
        _tituloMeta,
        titulo.isAcceptableOrUnknown(data['titulo']!, _tituloMeta),
      );
    } else if (isInserting) {
      context.missing(_tituloMeta);
    }
    if (data.containsKey('disciplina')) {
      context.handle(
        _disciplinaMeta,
        disciplina.isAcceptableOrUnknown(data['disciplina']!, _disciplinaMeta),
      );
    } else if (isInserting) {
      context.missing(_disciplinaMeta);
    }
    if (data.containsKey('descricao')) {
      context.handle(
        _descricaoMeta,
        descricao.isAcceptableOrUnknown(data['descricao']!, _descricaoMeta),
      );
    }
    if (data.containsKey('criadaEm')) {
      context.handle(
        _criadaEmMeta,
        criadaEm.isAcceptableOrUnknown(data['criadaEm']!, _criadaEmMeta),
      );
    }
    if (data.containsKey('turma')) {
      context.handle(
        _turmaMeta,
        turma.isAcceptableOrUnknown(data['turma']!, _turmaMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProvaEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProvaEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      titulo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}titulo'],
      )!,
      disciplina: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}disciplina'],
      )!,
      descricao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descricao'],
      )!,
      criadaEm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}criadaEm'],
      )!,
      turma: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}turma'],
      )!,
    );
  }

  @override
  $ProvasTable createAlias(String alias) {
    return $ProvasTable(attachedDatabase, alias);
  }
}

class ProvaEntity extends DataClass implements Insertable<ProvaEntity> {
  final int id;
  final String titulo;
  final String disciplina;
  final String descricao;
  final int criadaEm;
  final String turma;
  const ProvaEntity({
    required this.id,
    required this.titulo,
    required this.disciplina,
    required this.descricao,
    required this.criadaEm,
    required this.turma,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['titulo'] = Variable<String>(titulo);
    map['disciplina'] = Variable<String>(disciplina);
    map['descricao'] = Variable<String>(descricao);
    map['criadaEm'] = Variable<int>(criadaEm);
    map['turma'] = Variable<String>(turma);
    return map;
  }

  ProvasCompanion toCompanion(bool nullToAbsent) {
    return ProvasCompanion(
      id: Value(id),
      titulo: Value(titulo),
      disciplina: Value(disciplina),
      descricao: Value(descricao),
      criadaEm: Value(criadaEm),
      turma: Value(turma),
    );
  }

  factory ProvaEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProvaEntity(
      id: serializer.fromJson<int>(json['id']),
      titulo: serializer.fromJson<String>(json['titulo']),
      disciplina: serializer.fromJson<String>(json['disciplina']),
      descricao: serializer.fromJson<String>(json['descricao']),
      criadaEm: serializer.fromJson<int>(json['criadaEm']),
      turma: serializer.fromJson<String>(json['turma']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'titulo': serializer.toJson<String>(titulo),
      'disciplina': serializer.toJson<String>(disciplina),
      'descricao': serializer.toJson<String>(descricao),
      'criadaEm': serializer.toJson<int>(criadaEm),
      'turma': serializer.toJson<String>(turma),
    };
  }

  ProvaEntity copyWith({
    int? id,
    String? titulo,
    String? disciplina,
    String? descricao,
    int? criadaEm,
    String? turma,
  }) => ProvaEntity(
    id: id ?? this.id,
    titulo: titulo ?? this.titulo,
    disciplina: disciplina ?? this.disciplina,
    descricao: descricao ?? this.descricao,
    criadaEm: criadaEm ?? this.criadaEm,
    turma: turma ?? this.turma,
  );
  ProvaEntity copyWithCompanion(ProvasCompanion data) {
    return ProvaEntity(
      id: data.id.present ? data.id.value : this.id,
      titulo: data.titulo.present ? data.titulo.value : this.titulo,
      disciplina: data.disciplina.present
          ? data.disciplina.value
          : this.disciplina,
      descricao: data.descricao.present ? data.descricao.value : this.descricao,
      criadaEm: data.criadaEm.present ? data.criadaEm.value : this.criadaEm,
      turma: data.turma.present ? data.turma.value : this.turma,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProvaEntity(')
          ..write('id: $id, ')
          ..write('titulo: $titulo, ')
          ..write('disciplina: $disciplina, ')
          ..write('descricao: $descricao, ')
          ..write('criadaEm: $criadaEm, ')
          ..write('turma: $turma')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, titulo, disciplina, descricao, criadaEm, turma);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProvaEntity &&
          other.id == this.id &&
          other.titulo == this.titulo &&
          other.disciplina == this.disciplina &&
          other.descricao == this.descricao &&
          other.criadaEm == this.criadaEm &&
          other.turma == this.turma);
}

class ProvasCompanion extends UpdateCompanion<ProvaEntity> {
  final Value<int> id;
  final Value<String> titulo;
  final Value<String> disciplina;
  final Value<String> descricao;
  final Value<int> criadaEm;
  final Value<String> turma;
  const ProvasCompanion({
    this.id = const Value.absent(),
    this.titulo = const Value.absent(),
    this.disciplina = const Value.absent(),
    this.descricao = const Value.absent(),
    this.criadaEm = const Value.absent(),
    this.turma = const Value.absent(),
  });
  ProvasCompanion.insert({
    this.id = const Value.absent(),
    required String titulo,
    required String disciplina,
    this.descricao = const Value.absent(),
    this.criadaEm = const Value.absent(),
    this.turma = const Value.absent(),
  }) : titulo = Value(titulo),
       disciplina = Value(disciplina);
  static Insertable<ProvaEntity> custom({
    Expression<int>? id,
    Expression<String>? titulo,
    Expression<String>? disciplina,
    Expression<String>? descricao,
    Expression<int>? criadaEm,
    Expression<String>? turma,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (titulo != null) 'titulo': titulo,
      if (disciplina != null) 'disciplina': disciplina,
      if (descricao != null) 'descricao': descricao,
      if (criadaEm != null) 'criadaEm': criadaEm,
      if (turma != null) 'turma': turma,
    });
  }

  ProvasCompanion copyWith({
    Value<int>? id,
    Value<String>? titulo,
    Value<String>? disciplina,
    Value<String>? descricao,
    Value<int>? criadaEm,
    Value<String>? turma,
  }) {
    return ProvasCompanion(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      disciplina: disciplina ?? this.disciplina,
      descricao: descricao ?? this.descricao,
      criadaEm: criadaEm ?? this.criadaEm,
      turma: turma ?? this.turma,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (titulo.present) {
      map['titulo'] = Variable<String>(titulo.value);
    }
    if (disciplina.present) {
      map['disciplina'] = Variable<String>(disciplina.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    if (criadaEm.present) {
      map['criadaEm'] = Variable<int>(criadaEm.value);
    }
    if (turma.present) {
      map['turma'] = Variable<String>(turma.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProvasCompanion(')
          ..write('id: $id, ')
          ..write('titulo: $titulo, ')
          ..write('disciplina: $disciplina, ')
          ..write('descricao: $descricao, ')
          ..write('criadaEm: $criadaEm, ')
          ..write('turma: $turma')
          ..write(')'))
        .toString();
  }
}

class $QuestoesTable extends Questoes
    with TableInfo<$QuestoesTable, QuestaoEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestoesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _provaIdMeta = const VerificationMeta(
    'provaId',
  );
  @override
  late final GeneratedColumn<int> provaId = GeneratedColumn<int>(
    'provaId',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES provas (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _enunciadoMeta = const VerificationMeta(
    'enunciado',
  );
  @override
  late final GeneratedColumn<String> enunciado = GeneratedColumn<String>(
    'enunciado',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ordemMeta = const VerificationMeta('ordem');
  @override
  late final GeneratedColumn<int> ordem = GeneratedColumn<int>(
    'ordem',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, provaId, enunciado, ordem];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'questoes';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuestaoEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('provaId')) {
      context.handle(
        _provaIdMeta,
        provaId.isAcceptableOrUnknown(data['provaId']!, _provaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_provaIdMeta);
    }
    if (data.containsKey('enunciado')) {
      context.handle(
        _enunciadoMeta,
        enunciado.isAcceptableOrUnknown(data['enunciado']!, _enunciadoMeta),
      );
    } else if (isInserting) {
      context.missing(_enunciadoMeta);
    }
    if (data.containsKey('ordem')) {
      context.handle(
        _ordemMeta,
        ordem.isAcceptableOrUnknown(data['ordem']!, _ordemMeta),
      );
    } else if (isInserting) {
      context.missing(_ordemMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuestaoEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestaoEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      provaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}provaId'],
      )!,
      enunciado: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}enunciado'],
      )!,
      ordem: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ordem'],
      )!,
    );
  }

  @override
  $QuestoesTable createAlias(String alias) {
    return $QuestoesTable(attachedDatabase, alias);
  }
}

class QuestaoEntity extends DataClass implements Insertable<QuestaoEntity> {
  final int id;
  final int provaId;
  final String enunciado;
  final int ordem;
  const QuestaoEntity({
    required this.id,
    required this.provaId,
    required this.enunciado,
    required this.ordem,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['provaId'] = Variable<int>(provaId);
    map['enunciado'] = Variable<String>(enunciado);
    map['ordem'] = Variable<int>(ordem);
    return map;
  }

  QuestoesCompanion toCompanion(bool nullToAbsent) {
    return QuestoesCompanion(
      id: Value(id),
      provaId: Value(provaId),
      enunciado: Value(enunciado),
      ordem: Value(ordem),
    );
  }

  factory QuestaoEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestaoEntity(
      id: serializer.fromJson<int>(json['id']),
      provaId: serializer.fromJson<int>(json['provaId']),
      enunciado: serializer.fromJson<String>(json['enunciado']),
      ordem: serializer.fromJson<int>(json['ordem']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'provaId': serializer.toJson<int>(provaId),
      'enunciado': serializer.toJson<String>(enunciado),
      'ordem': serializer.toJson<int>(ordem),
    };
  }

  QuestaoEntity copyWith({
    int? id,
    int? provaId,
    String? enunciado,
    int? ordem,
  }) => QuestaoEntity(
    id: id ?? this.id,
    provaId: provaId ?? this.provaId,
    enunciado: enunciado ?? this.enunciado,
    ordem: ordem ?? this.ordem,
  );
  QuestaoEntity copyWithCompanion(QuestoesCompanion data) {
    return QuestaoEntity(
      id: data.id.present ? data.id.value : this.id,
      provaId: data.provaId.present ? data.provaId.value : this.provaId,
      enunciado: data.enunciado.present ? data.enunciado.value : this.enunciado,
      ordem: data.ordem.present ? data.ordem.value : this.ordem,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuestaoEntity(')
          ..write('id: $id, ')
          ..write('provaId: $provaId, ')
          ..write('enunciado: $enunciado, ')
          ..write('ordem: $ordem')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, provaId, enunciado, ordem);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestaoEntity &&
          other.id == this.id &&
          other.provaId == this.provaId &&
          other.enunciado == this.enunciado &&
          other.ordem == this.ordem);
}

class QuestoesCompanion extends UpdateCompanion<QuestaoEntity> {
  final Value<int> id;
  final Value<int> provaId;
  final Value<String> enunciado;
  final Value<int> ordem;
  const QuestoesCompanion({
    this.id = const Value.absent(),
    this.provaId = const Value.absent(),
    this.enunciado = const Value.absent(),
    this.ordem = const Value.absent(),
  });
  QuestoesCompanion.insert({
    this.id = const Value.absent(),
    required int provaId,
    required String enunciado,
    required int ordem,
  }) : provaId = Value(provaId),
       enunciado = Value(enunciado),
       ordem = Value(ordem);
  static Insertable<QuestaoEntity> custom({
    Expression<int>? id,
    Expression<int>? provaId,
    Expression<String>? enunciado,
    Expression<int>? ordem,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (provaId != null) 'provaId': provaId,
      if (enunciado != null) 'enunciado': enunciado,
      if (ordem != null) 'ordem': ordem,
    });
  }

  QuestoesCompanion copyWith({
    Value<int>? id,
    Value<int>? provaId,
    Value<String>? enunciado,
    Value<int>? ordem,
  }) {
    return QuestoesCompanion(
      id: id ?? this.id,
      provaId: provaId ?? this.provaId,
      enunciado: enunciado ?? this.enunciado,
      ordem: ordem ?? this.ordem,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (provaId.present) {
      map['provaId'] = Variable<int>(provaId.value);
    }
    if (enunciado.present) {
      map['enunciado'] = Variable<String>(enunciado.value);
    }
    if (ordem.present) {
      map['ordem'] = Variable<int>(ordem.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestoesCompanion(')
          ..write('id: $id, ')
          ..write('provaId: $provaId, ')
          ..write('enunciado: $enunciado, ')
          ..write('ordem: $ordem')
          ..write(')'))
        .toString();
  }
}

class $AlternativasTable extends Alternativas
    with TableInfo<$AlternativasTable, AlternativaEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlternativasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _questaoIdMeta = const VerificationMeta(
    'questaoId',
  );
  @override
  late final GeneratedColumn<int> questaoId = GeneratedColumn<int>(
    'questaoId',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES questoes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _textoMeta = const VerificationMeta('texto');
  @override
  late final GeneratedColumn<String> texto = GeneratedColumn<String>(
    'texto',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _corretaMeta = const VerificationMeta(
    'correta',
  );
  @override
  late final GeneratedColumn<bool> correta = GeneratedColumn<bool>(
    'correta',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("correta" IN (0, 1))',
    ),
  );
  static const VerificationMeta _ordemMeta = const VerificationMeta('ordem');
  @override
  late final GeneratedColumn<int> ordem = GeneratedColumn<int>(
    'ordem',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, questaoId, texto, correta, ordem];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alternativas';
  @override
  VerificationContext validateIntegrity(
    Insertable<AlternativaEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('questaoId')) {
      context.handle(
        _questaoIdMeta,
        questaoId.isAcceptableOrUnknown(data['questaoId']!, _questaoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_questaoIdMeta);
    }
    if (data.containsKey('texto')) {
      context.handle(
        _textoMeta,
        texto.isAcceptableOrUnknown(data['texto']!, _textoMeta),
      );
    } else if (isInserting) {
      context.missing(_textoMeta);
    }
    if (data.containsKey('correta')) {
      context.handle(
        _corretaMeta,
        correta.isAcceptableOrUnknown(data['correta']!, _corretaMeta),
      );
    } else if (isInserting) {
      context.missing(_corretaMeta);
    }
    if (data.containsKey('ordem')) {
      context.handle(
        _ordemMeta,
        ordem.isAcceptableOrUnknown(data['ordem']!, _ordemMeta),
      );
    } else if (isInserting) {
      context.missing(_ordemMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AlternativaEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AlternativaEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      questaoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}questaoId'],
      )!,
      texto: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}texto'],
      )!,
      correta: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}correta'],
      )!,
      ordem: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ordem'],
      )!,
    );
  }

  @override
  $AlternativasTable createAlias(String alias) {
    return $AlternativasTable(attachedDatabase, alias);
  }
}

class AlternativaEntity extends DataClass
    implements Insertable<AlternativaEntity> {
  final int id;
  final int questaoId;
  final String texto;
  final bool correta;
  final int ordem;
  const AlternativaEntity({
    required this.id,
    required this.questaoId,
    required this.texto,
    required this.correta,
    required this.ordem,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['questaoId'] = Variable<int>(questaoId);
    map['texto'] = Variable<String>(texto);
    map['correta'] = Variable<bool>(correta);
    map['ordem'] = Variable<int>(ordem);
    return map;
  }

  AlternativasCompanion toCompanion(bool nullToAbsent) {
    return AlternativasCompanion(
      id: Value(id),
      questaoId: Value(questaoId),
      texto: Value(texto),
      correta: Value(correta),
      ordem: Value(ordem),
    );
  }

  factory AlternativaEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AlternativaEntity(
      id: serializer.fromJson<int>(json['id']),
      questaoId: serializer.fromJson<int>(json['questaoId']),
      texto: serializer.fromJson<String>(json['texto']),
      correta: serializer.fromJson<bool>(json['correta']),
      ordem: serializer.fromJson<int>(json['ordem']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'questaoId': serializer.toJson<int>(questaoId),
      'texto': serializer.toJson<String>(texto),
      'correta': serializer.toJson<bool>(correta),
      'ordem': serializer.toJson<int>(ordem),
    };
  }

  AlternativaEntity copyWith({
    int? id,
    int? questaoId,
    String? texto,
    bool? correta,
    int? ordem,
  }) => AlternativaEntity(
    id: id ?? this.id,
    questaoId: questaoId ?? this.questaoId,
    texto: texto ?? this.texto,
    correta: correta ?? this.correta,
    ordem: ordem ?? this.ordem,
  );
  AlternativaEntity copyWithCompanion(AlternativasCompanion data) {
    return AlternativaEntity(
      id: data.id.present ? data.id.value : this.id,
      questaoId: data.questaoId.present ? data.questaoId.value : this.questaoId,
      texto: data.texto.present ? data.texto.value : this.texto,
      correta: data.correta.present ? data.correta.value : this.correta,
      ordem: data.ordem.present ? data.ordem.value : this.ordem,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AlternativaEntity(')
          ..write('id: $id, ')
          ..write('questaoId: $questaoId, ')
          ..write('texto: $texto, ')
          ..write('correta: $correta, ')
          ..write('ordem: $ordem')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, questaoId, texto, correta, ordem);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AlternativaEntity &&
          other.id == this.id &&
          other.questaoId == this.questaoId &&
          other.texto == this.texto &&
          other.correta == this.correta &&
          other.ordem == this.ordem);
}

class AlternativasCompanion extends UpdateCompanion<AlternativaEntity> {
  final Value<int> id;
  final Value<int> questaoId;
  final Value<String> texto;
  final Value<bool> correta;
  final Value<int> ordem;
  const AlternativasCompanion({
    this.id = const Value.absent(),
    this.questaoId = const Value.absent(),
    this.texto = const Value.absent(),
    this.correta = const Value.absent(),
    this.ordem = const Value.absent(),
  });
  AlternativasCompanion.insert({
    this.id = const Value.absent(),
    required int questaoId,
    required String texto,
    required bool correta,
    required int ordem,
  }) : questaoId = Value(questaoId),
       texto = Value(texto),
       correta = Value(correta),
       ordem = Value(ordem);
  static Insertable<AlternativaEntity> custom({
    Expression<int>? id,
    Expression<int>? questaoId,
    Expression<String>? texto,
    Expression<bool>? correta,
    Expression<int>? ordem,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (questaoId != null) 'questaoId': questaoId,
      if (texto != null) 'texto': texto,
      if (correta != null) 'correta': correta,
      if (ordem != null) 'ordem': ordem,
    });
  }

  AlternativasCompanion copyWith({
    Value<int>? id,
    Value<int>? questaoId,
    Value<String>? texto,
    Value<bool>? correta,
    Value<int>? ordem,
  }) {
    return AlternativasCompanion(
      id: id ?? this.id,
      questaoId: questaoId ?? this.questaoId,
      texto: texto ?? this.texto,
      correta: correta ?? this.correta,
      ordem: ordem ?? this.ordem,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (questaoId.present) {
      map['questaoId'] = Variable<int>(questaoId.value);
    }
    if (texto.present) {
      map['texto'] = Variable<String>(texto.value);
    }
    if (correta.present) {
      map['correta'] = Variable<bool>(correta.value);
    }
    if (ordem.present) {
      map['ordem'] = Variable<int>(ordem.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlternativasCompanion(')
          ..write('id: $id, ')
          ..write('questaoId: $questaoId, ')
          ..write('texto: $texto, ')
          ..write('correta: $correta, ')
          ..write('ordem: $ordem')
          ..write(')'))
        .toString();
  }
}

class $AlunosTable extends Alunos with TableInfo<$AlunosTable, AlunoEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlunosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _turmaMeta = const VerificationMeta('turma');
  @override
  late final GeneratedColumn<String> turma = GeneratedColumn<String>(
    'turma',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _matriculaMeta = const VerificationMeta(
    'matricula',
  );
  @override
  late final GeneratedColumn<String> matricula = GeneratedColumn<String>(
    'matricula',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'COLLATE NOCASE',
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nome, turma, matricula, email];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alunos';
  @override
  VerificationContext validateIntegrity(
    Insertable<AlunoEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('turma')) {
      context.handle(
        _turmaMeta,
        turma.isAcceptableOrUnknown(data['turma']!, _turmaMeta),
      );
    }
    if (data.containsKey('matricula')) {
      context.handle(
        _matriculaMeta,
        matricula.isAcceptableOrUnknown(data['matricula']!, _matriculaMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AlunoEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AlunoEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      turma: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}turma'],
      )!,
      matricula: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}matricula'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
    );
  }

  @override
  $AlunosTable createAlias(String alias) {
    return $AlunosTable(attachedDatabase, alias);
  }
}

class AlunoEntity extends DataClass implements Insertable<AlunoEntity> {
  final int id;
  final String nome;
  final String turma;
  final String? matricula;
  final String? email;
  const AlunoEntity({
    required this.id,
    required this.nome,
    required this.turma,
    this.matricula,
    this.email,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['turma'] = Variable<String>(turma);
    if (!nullToAbsent || matricula != null) {
      map['matricula'] = Variable<String>(matricula);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    return map;
  }

  AlunosCompanion toCompanion(bool nullToAbsent) {
    return AlunosCompanion(
      id: Value(id),
      nome: Value(nome),
      turma: Value(turma),
      matricula: matricula == null && nullToAbsent
          ? const Value.absent()
          : Value(matricula),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
    );
  }

  factory AlunoEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AlunoEntity(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      turma: serializer.fromJson<String>(json['turma']),
      matricula: serializer.fromJson<String?>(json['matricula']),
      email: serializer.fromJson<String?>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'turma': serializer.toJson<String>(turma),
      'matricula': serializer.toJson<String?>(matricula),
      'email': serializer.toJson<String?>(email),
    };
  }

  AlunoEntity copyWith({
    int? id,
    String? nome,
    String? turma,
    Value<String?> matricula = const Value.absent(),
    Value<String?> email = const Value.absent(),
  }) => AlunoEntity(
    id: id ?? this.id,
    nome: nome ?? this.nome,
    turma: turma ?? this.turma,
    matricula: matricula.present ? matricula.value : this.matricula,
    email: email.present ? email.value : this.email,
  );
  AlunoEntity copyWithCompanion(AlunosCompanion data) {
    return AlunoEntity(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      turma: data.turma.present ? data.turma.value : this.turma,
      matricula: data.matricula.present ? data.matricula.value : this.matricula,
      email: data.email.present ? data.email.value : this.email,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AlunoEntity(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('turma: $turma, ')
          ..write('matricula: $matricula, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, turma, matricula, email);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AlunoEntity &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.turma == this.turma &&
          other.matricula == this.matricula &&
          other.email == this.email);
}

class AlunosCompanion extends UpdateCompanion<AlunoEntity> {
  final Value<int> id;
  final Value<String> nome;
  final Value<String> turma;
  final Value<String?> matricula;
  final Value<String?> email;
  const AlunosCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.turma = const Value.absent(),
    this.matricula = const Value.absent(),
    this.email = const Value.absent(),
  });
  AlunosCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    this.turma = const Value.absent(),
    this.matricula = const Value.absent(),
    this.email = const Value.absent(),
  }) : nome = Value(nome);
  static Insertable<AlunoEntity> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<String>? turma,
    Expression<String>? matricula,
    Expression<String>? email,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (turma != null) 'turma': turma,
      if (matricula != null) 'matricula': matricula,
      if (email != null) 'email': email,
    });
  }

  AlunosCompanion copyWith({
    Value<int>? id,
    Value<String>? nome,
    Value<String>? turma,
    Value<String?>? matricula,
    Value<String?>? email,
  }) {
    return AlunosCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      turma: turma ?? this.turma,
      matricula: matricula ?? this.matricula,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (turma.present) {
      map['turma'] = Variable<String>(turma.value);
    }
    if (matricula.present) {
      map['matricula'] = Variable<String>(matricula.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlunosCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('turma: $turma, ')
          ..write('matricula: $matricula, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

class $ResultadosTable extends Resultados
    with TableInfo<$ResultadosTable, ResultadoEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResultadosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _provaIdMeta = const VerificationMeta(
    'provaId',
  );
  @override
  late final GeneratedColumn<int> provaId = GeneratedColumn<int>(
    'provaId',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES provas (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _alunoIdMeta = const VerificationMeta(
    'alunoId',
  );
  @override
  late final GeneratedColumn<int> alunoId = GeneratedColumn<int>(
    'alunoId',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES alunos (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _totalQuestoesMeta = const VerificationMeta(
    'totalQuestoes',
  );
  @override
  late final GeneratedColumn<int> totalQuestoes = GeneratedColumn<int>(
    'totalQuestoes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _acertosMeta = const VerificationMeta(
    'acertos',
  );
  @override
  late final GeneratedColumn<int> acertos = GeneratedColumn<int>(
    'acertos',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _errosMeta = const VerificationMeta('erros');
  @override
  late final GeneratedColumn<int> erros = GeneratedColumn<int>(
    'erros',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emBrancoMeta = const VerificationMeta(
    'emBranco',
  );
  @override
  late final GeneratedColumn<int> emBranco = GeneratedColumn<int>(
    'emBranco',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notaMeta = const VerificationMeta('nota');
  @override
  late final GeneratedColumn<double> nota = GeneratedColumn<double>(
    'nota',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notaMaximaMeta = const VerificationMeta(
    'notaMaxima',
  );
  @override
  late final GeneratedColumn<double> notaMaxima = GeneratedColumn<double>(
    'notaMaxima',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _corrigidoEmMeta = const VerificationMeta(
    'corrigidoEm',
  );
  @override
  late final GeneratedColumn<int> corrigidoEm = GeneratedColumn<int>(
    'corrigidoEm',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().millisecondsSinceEpoch,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    provaId,
    alunoId,
    totalQuestoes,
    acertos,
    erros,
    emBranco,
    nota,
    notaMaxima,
    corrigidoEm,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'resultados';
  @override
  VerificationContext validateIntegrity(
    Insertable<ResultadoEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('provaId')) {
      context.handle(
        _provaIdMeta,
        provaId.isAcceptableOrUnknown(data['provaId']!, _provaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_provaIdMeta);
    }
    if (data.containsKey('alunoId')) {
      context.handle(
        _alunoIdMeta,
        alunoId.isAcceptableOrUnknown(data['alunoId']!, _alunoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_alunoIdMeta);
    }
    if (data.containsKey('totalQuestoes')) {
      context.handle(
        _totalQuestoesMeta,
        totalQuestoes.isAcceptableOrUnknown(
          data['totalQuestoes']!,
          _totalQuestoesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalQuestoesMeta);
    }
    if (data.containsKey('acertos')) {
      context.handle(
        _acertosMeta,
        acertos.isAcceptableOrUnknown(data['acertos']!, _acertosMeta),
      );
    } else if (isInserting) {
      context.missing(_acertosMeta);
    }
    if (data.containsKey('erros')) {
      context.handle(
        _errosMeta,
        erros.isAcceptableOrUnknown(data['erros']!, _errosMeta),
      );
    } else if (isInserting) {
      context.missing(_errosMeta);
    }
    if (data.containsKey('emBranco')) {
      context.handle(
        _emBrancoMeta,
        emBranco.isAcceptableOrUnknown(data['emBranco']!, _emBrancoMeta),
      );
    } else if (isInserting) {
      context.missing(_emBrancoMeta);
    }
    if (data.containsKey('nota')) {
      context.handle(
        _notaMeta,
        nota.isAcceptableOrUnknown(data['nota']!, _notaMeta),
      );
    } else if (isInserting) {
      context.missing(_notaMeta);
    }
    if (data.containsKey('notaMaxima')) {
      context.handle(
        _notaMaximaMeta,
        notaMaxima.isAcceptableOrUnknown(data['notaMaxima']!, _notaMaximaMeta),
      );
    } else if (isInserting) {
      context.missing(_notaMaximaMeta);
    }
    if (data.containsKey('corrigidoEm')) {
      context.handle(
        _corrigidoEmMeta,
        corrigidoEm.isAcceptableOrUnknown(
          data['corrigidoEm']!,
          _corrigidoEmMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ResultadoEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ResultadoEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      provaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}provaId'],
      )!,
      alunoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}alunoId'],
      )!,
      totalQuestoes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}totalQuestoes'],
      )!,
      acertos: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}acertos'],
      )!,
      erros: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}erros'],
      )!,
      emBranco: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}emBranco'],
      )!,
      nota: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}nota'],
      )!,
      notaMaxima: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}notaMaxima'],
      )!,
      corrigidoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}corrigidoEm'],
      )!,
    );
  }

  @override
  $ResultadosTable createAlias(String alias) {
    return $ResultadosTable(attachedDatabase, alias);
  }
}

class ResultadoEntity extends DataClass implements Insertable<ResultadoEntity> {
  final int id;
  final int provaId;
  final int alunoId;
  final int totalQuestoes;
  final int acertos;

  /// Respostas erradas + marcações múltiplas (anuladas).
  final int erros;
  final int emBranco;
  final double nota;
  final double notaMaxima;
  final int corrigidoEm;
  const ResultadoEntity({
    required this.id,
    required this.provaId,
    required this.alunoId,
    required this.totalQuestoes,
    required this.acertos,
    required this.erros,
    required this.emBranco,
    required this.nota,
    required this.notaMaxima,
    required this.corrigidoEm,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['provaId'] = Variable<int>(provaId);
    map['alunoId'] = Variable<int>(alunoId);
    map['totalQuestoes'] = Variable<int>(totalQuestoes);
    map['acertos'] = Variable<int>(acertos);
    map['erros'] = Variable<int>(erros);
    map['emBranco'] = Variable<int>(emBranco);
    map['nota'] = Variable<double>(nota);
    map['notaMaxima'] = Variable<double>(notaMaxima);
    map['corrigidoEm'] = Variable<int>(corrigidoEm);
    return map;
  }

  ResultadosCompanion toCompanion(bool nullToAbsent) {
    return ResultadosCompanion(
      id: Value(id),
      provaId: Value(provaId),
      alunoId: Value(alunoId),
      totalQuestoes: Value(totalQuestoes),
      acertos: Value(acertos),
      erros: Value(erros),
      emBranco: Value(emBranco),
      nota: Value(nota),
      notaMaxima: Value(notaMaxima),
      corrigidoEm: Value(corrigidoEm),
    );
  }

  factory ResultadoEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ResultadoEntity(
      id: serializer.fromJson<int>(json['id']),
      provaId: serializer.fromJson<int>(json['provaId']),
      alunoId: serializer.fromJson<int>(json['alunoId']),
      totalQuestoes: serializer.fromJson<int>(json['totalQuestoes']),
      acertos: serializer.fromJson<int>(json['acertos']),
      erros: serializer.fromJson<int>(json['erros']),
      emBranco: serializer.fromJson<int>(json['emBranco']),
      nota: serializer.fromJson<double>(json['nota']),
      notaMaxima: serializer.fromJson<double>(json['notaMaxima']),
      corrigidoEm: serializer.fromJson<int>(json['corrigidoEm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'provaId': serializer.toJson<int>(provaId),
      'alunoId': serializer.toJson<int>(alunoId),
      'totalQuestoes': serializer.toJson<int>(totalQuestoes),
      'acertos': serializer.toJson<int>(acertos),
      'erros': serializer.toJson<int>(erros),
      'emBranco': serializer.toJson<int>(emBranco),
      'nota': serializer.toJson<double>(nota),
      'notaMaxima': serializer.toJson<double>(notaMaxima),
      'corrigidoEm': serializer.toJson<int>(corrigidoEm),
    };
  }

  ResultadoEntity copyWith({
    int? id,
    int? provaId,
    int? alunoId,
    int? totalQuestoes,
    int? acertos,
    int? erros,
    int? emBranco,
    double? nota,
    double? notaMaxima,
    int? corrigidoEm,
  }) => ResultadoEntity(
    id: id ?? this.id,
    provaId: provaId ?? this.provaId,
    alunoId: alunoId ?? this.alunoId,
    totalQuestoes: totalQuestoes ?? this.totalQuestoes,
    acertos: acertos ?? this.acertos,
    erros: erros ?? this.erros,
    emBranco: emBranco ?? this.emBranco,
    nota: nota ?? this.nota,
    notaMaxima: notaMaxima ?? this.notaMaxima,
    corrigidoEm: corrigidoEm ?? this.corrigidoEm,
  );
  ResultadoEntity copyWithCompanion(ResultadosCompanion data) {
    return ResultadoEntity(
      id: data.id.present ? data.id.value : this.id,
      provaId: data.provaId.present ? data.provaId.value : this.provaId,
      alunoId: data.alunoId.present ? data.alunoId.value : this.alunoId,
      totalQuestoes: data.totalQuestoes.present
          ? data.totalQuestoes.value
          : this.totalQuestoes,
      acertos: data.acertos.present ? data.acertos.value : this.acertos,
      erros: data.erros.present ? data.erros.value : this.erros,
      emBranco: data.emBranco.present ? data.emBranco.value : this.emBranco,
      nota: data.nota.present ? data.nota.value : this.nota,
      notaMaxima: data.notaMaxima.present
          ? data.notaMaxima.value
          : this.notaMaxima,
      corrigidoEm: data.corrigidoEm.present
          ? data.corrigidoEm.value
          : this.corrigidoEm,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ResultadoEntity(')
          ..write('id: $id, ')
          ..write('provaId: $provaId, ')
          ..write('alunoId: $alunoId, ')
          ..write('totalQuestoes: $totalQuestoes, ')
          ..write('acertos: $acertos, ')
          ..write('erros: $erros, ')
          ..write('emBranco: $emBranco, ')
          ..write('nota: $nota, ')
          ..write('notaMaxima: $notaMaxima, ')
          ..write('corrigidoEm: $corrigidoEm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    provaId,
    alunoId,
    totalQuestoes,
    acertos,
    erros,
    emBranco,
    nota,
    notaMaxima,
    corrigidoEm,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ResultadoEntity &&
          other.id == this.id &&
          other.provaId == this.provaId &&
          other.alunoId == this.alunoId &&
          other.totalQuestoes == this.totalQuestoes &&
          other.acertos == this.acertos &&
          other.erros == this.erros &&
          other.emBranco == this.emBranco &&
          other.nota == this.nota &&
          other.notaMaxima == this.notaMaxima &&
          other.corrigidoEm == this.corrigidoEm);
}

class ResultadosCompanion extends UpdateCompanion<ResultadoEntity> {
  final Value<int> id;
  final Value<int> provaId;
  final Value<int> alunoId;
  final Value<int> totalQuestoes;
  final Value<int> acertos;
  final Value<int> erros;
  final Value<int> emBranco;
  final Value<double> nota;
  final Value<double> notaMaxima;
  final Value<int> corrigidoEm;
  const ResultadosCompanion({
    this.id = const Value.absent(),
    this.provaId = const Value.absent(),
    this.alunoId = const Value.absent(),
    this.totalQuestoes = const Value.absent(),
    this.acertos = const Value.absent(),
    this.erros = const Value.absent(),
    this.emBranco = const Value.absent(),
    this.nota = const Value.absent(),
    this.notaMaxima = const Value.absent(),
    this.corrigidoEm = const Value.absent(),
  });
  ResultadosCompanion.insert({
    this.id = const Value.absent(),
    required int provaId,
    required int alunoId,
    required int totalQuestoes,
    required int acertos,
    required int erros,
    required int emBranco,
    required double nota,
    required double notaMaxima,
    this.corrigidoEm = const Value.absent(),
  }) : provaId = Value(provaId),
       alunoId = Value(alunoId),
       totalQuestoes = Value(totalQuestoes),
       acertos = Value(acertos),
       erros = Value(erros),
       emBranco = Value(emBranco),
       nota = Value(nota),
       notaMaxima = Value(notaMaxima);
  static Insertable<ResultadoEntity> custom({
    Expression<int>? id,
    Expression<int>? provaId,
    Expression<int>? alunoId,
    Expression<int>? totalQuestoes,
    Expression<int>? acertos,
    Expression<int>? erros,
    Expression<int>? emBranco,
    Expression<double>? nota,
    Expression<double>? notaMaxima,
    Expression<int>? corrigidoEm,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (provaId != null) 'provaId': provaId,
      if (alunoId != null) 'alunoId': alunoId,
      if (totalQuestoes != null) 'totalQuestoes': totalQuestoes,
      if (acertos != null) 'acertos': acertos,
      if (erros != null) 'erros': erros,
      if (emBranco != null) 'emBranco': emBranco,
      if (nota != null) 'nota': nota,
      if (notaMaxima != null) 'notaMaxima': notaMaxima,
      if (corrigidoEm != null) 'corrigidoEm': corrigidoEm,
    });
  }

  ResultadosCompanion copyWith({
    Value<int>? id,
    Value<int>? provaId,
    Value<int>? alunoId,
    Value<int>? totalQuestoes,
    Value<int>? acertos,
    Value<int>? erros,
    Value<int>? emBranco,
    Value<double>? nota,
    Value<double>? notaMaxima,
    Value<int>? corrigidoEm,
  }) {
    return ResultadosCompanion(
      id: id ?? this.id,
      provaId: provaId ?? this.provaId,
      alunoId: alunoId ?? this.alunoId,
      totalQuestoes: totalQuestoes ?? this.totalQuestoes,
      acertos: acertos ?? this.acertos,
      erros: erros ?? this.erros,
      emBranco: emBranco ?? this.emBranco,
      nota: nota ?? this.nota,
      notaMaxima: notaMaxima ?? this.notaMaxima,
      corrigidoEm: corrigidoEm ?? this.corrigidoEm,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (provaId.present) {
      map['provaId'] = Variable<int>(provaId.value);
    }
    if (alunoId.present) {
      map['alunoId'] = Variable<int>(alunoId.value);
    }
    if (totalQuestoes.present) {
      map['totalQuestoes'] = Variable<int>(totalQuestoes.value);
    }
    if (acertos.present) {
      map['acertos'] = Variable<int>(acertos.value);
    }
    if (erros.present) {
      map['erros'] = Variable<int>(erros.value);
    }
    if (emBranco.present) {
      map['emBranco'] = Variable<int>(emBranco.value);
    }
    if (nota.present) {
      map['nota'] = Variable<double>(nota.value);
    }
    if (notaMaxima.present) {
      map['notaMaxima'] = Variable<double>(notaMaxima.value);
    }
    if (corrigidoEm.present) {
      map['corrigidoEm'] = Variable<int>(corrigidoEm.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResultadosCompanion(')
          ..write('id: $id, ')
          ..write('provaId: $provaId, ')
          ..write('alunoId: $alunoId, ')
          ..write('totalQuestoes: $totalQuestoes, ')
          ..write('acertos: $acertos, ')
          ..write('erros: $erros, ')
          ..write('emBranco: $emBranco, ')
          ..write('nota: $nota, ')
          ..write('notaMaxima: $notaMaxima, ')
          ..write('corrigidoEm: $corrigidoEm')
          ..write(')'))
        .toString();
  }
}

class $RespostasAlunoTable extends RespostasAluno
    with TableInfo<$RespostasAlunoTable, RespostaAlunoEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RespostasAlunoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _resultadoIdMeta = const VerificationMeta(
    'resultadoId',
  );
  @override
  late final GeneratedColumn<int> resultadoId = GeneratedColumn<int>(
    'resultadoId',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES resultados (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _questaoIdMeta = const VerificationMeta(
    'questaoId',
  );
  @override
  late final GeneratedColumn<int> questaoId = GeneratedColumn<int>(
    'questaoId',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES questoes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _numeroQuestaoMeta = const VerificationMeta(
    'numeroQuestao',
  );
  @override
  late final GeneratedColumn<int> numeroQuestao = GeneratedColumn<int>(
    'numeroQuestao',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _letrasMarcadasMeta = const VerificationMeta(
    'letrasMarcadas',
  );
  @override
  late final GeneratedColumn<String> letrasMarcadas = GeneratedColumn<String>(
    'letrasMarcadas',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _letraCorretaMeta = const VerificationMeta(
    'letraCorreta',
  );
  @override
  late final GeneratedColumn<String> letraCorreta = GeneratedColumn<String>(
    'letraCorreta',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SituacaoQuestao, String>
  situacao = GeneratedColumn<String>(
    'situacao',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<SituacaoQuestao>($RespostasAlunoTable.$convertersituacao);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    resultadoId,
    questaoId,
    numeroQuestao,
    letrasMarcadas,
    letraCorreta,
    situacao,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'respostas_aluno';
  @override
  VerificationContext validateIntegrity(
    Insertable<RespostaAlunoEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('resultadoId')) {
      context.handle(
        _resultadoIdMeta,
        resultadoId.isAcceptableOrUnknown(
          data['resultadoId']!,
          _resultadoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_resultadoIdMeta);
    }
    if (data.containsKey('questaoId')) {
      context.handle(
        _questaoIdMeta,
        questaoId.isAcceptableOrUnknown(data['questaoId']!, _questaoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_questaoIdMeta);
    }
    if (data.containsKey('numeroQuestao')) {
      context.handle(
        _numeroQuestaoMeta,
        numeroQuestao.isAcceptableOrUnknown(
          data['numeroQuestao']!,
          _numeroQuestaoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_numeroQuestaoMeta);
    }
    if (data.containsKey('letrasMarcadas')) {
      context.handle(
        _letrasMarcadasMeta,
        letrasMarcadas.isAcceptableOrUnknown(
          data['letrasMarcadas']!,
          _letrasMarcadasMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_letrasMarcadasMeta);
    }
    if (data.containsKey('letraCorreta')) {
      context.handle(
        _letraCorretaMeta,
        letraCorreta.isAcceptableOrUnknown(
          data['letraCorreta']!,
          _letraCorretaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_letraCorretaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RespostaAlunoEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RespostaAlunoEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      resultadoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}resultadoId'],
      )!,
      questaoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}questaoId'],
      )!,
      numeroQuestao: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}numeroQuestao'],
      )!,
      letrasMarcadas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}letrasMarcadas'],
      )!,
      letraCorreta: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}letraCorreta'],
      )!,
      situacao: $RespostasAlunoTable.$convertersituacao.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}situacao'],
        )!,
      ),
    );
  }

  @override
  $RespostasAlunoTable createAlias(String alias) {
    return $RespostasAlunoTable(attachedDatabase, alias);
  }

  static TypeConverter<SituacaoQuestao, String> $convertersituacao =
      const SituacaoQuestaoConverter();
}

class RespostaAlunoEntity extends DataClass
    implements Insertable<RespostaAlunoEntity> {
  final int id;
  final int resultadoId;
  final int questaoId;
  final int numeroQuestao;

  /// Letras marcadas pelo aluno, ex.: "B". Vazio = em branco; "BD" = marcou mais de uma.
  final String letrasMarcadas;

  /// Letra correta no gabarito no momento da correção, ex.: "C".
  final String letraCorreta;
  final SituacaoQuestao situacao;
  const RespostaAlunoEntity({
    required this.id,
    required this.resultadoId,
    required this.questaoId,
    required this.numeroQuestao,
    required this.letrasMarcadas,
    required this.letraCorreta,
    required this.situacao,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['resultadoId'] = Variable<int>(resultadoId);
    map['questaoId'] = Variable<int>(questaoId);
    map['numeroQuestao'] = Variable<int>(numeroQuestao);
    map['letrasMarcadas'] = Variable<String>(letrasMarcadas);
    map['letraCorreta'] = Variable<String>(letraCorreta);
    {
      map['situacao'] = Variable<String>(
        $RespostasAlunoTable.$convertersituacao.toSql(situacao),
      );
    }
    return map;
  }

  RespostasAlunoCompanion toCompanion(bool nullToAbsent) {
    return RespostasAlunoCompanion(
      id: Value(id),
      resultadoId: Value(resultadoId),
      questaoId: Value(questaoId),
      numeroQuestao: Value(numeroQuestao),
      letrasMarcadas: Value(letrasMarcadas),
      letraCorreta: Value(letraCorreta),
      situacao: Value(situacao),
    );
  }

  factory RespostaAlunoEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RespostaAlunoEntity(
      id: serializer.fromJson<int>(json['id']),
      resultadoId: serializer.fromJson<int>(json['resultadoId']),
      questaoId: serializer.fromJson<int>(json['questaoId']),
      numeroQuestao: serializer.fromJson<int>(json['numeroQuestao']),
      letrasMarcadas: serializer.fromJson<String>(json['letrasMarcadas']),
      letraCorreta: serializer.fromJson<String>(json['letraCorreta']),
      situacao: serializer.fromJson<SituacaoQuestao>(json['situacao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'resultadoId': serializer.toJson<int>(resultadoId),
      'questaoId': serializer.toJson<int>(questaoId),
      'numeroQuestao': serializer.toJson<int>(numeroQuestao),
      'letrasMarcadas': serializer.toJson<String>(letrasMarcadas),
      'letraCorreta': serializer.toJson<String>(letraCorreta),
      'situacao': serializer.toJson<SituacaoQuestao>(situacao),
    };
  }

  RespostaAlunoEntity copyWith({
    int? id,
    int? resultadoId,
    int? questaoId,
    int? numeroQuestao,
    String? letrasMarcadas,
    String? letraCorreta,
    SituacaoQuestao? situacao,
  }) => RespostaAlunoEntity(
    id: id ?? this.id,
    resultadoId: resultadoId ?? this.resultadoId,
    questaoId: questaoId ?? this.questaoId,
    numeroQuestao: numeroQuestao ?? this.numeroQuestao,
    letrasMarcadas: letrasMarcadas ?? this.letrasMarcadas,
    letraCorreta: letraCorreta ?? this.letraCorreta,
    situacao: situacao ?? this.situacao,
  );
  RespostaAlunoEntity copyWithCompanion(RespostasAlunoCompanion data) {
    return RespostaAlunoEntity(
      id: data.id.present ? data.id.value : this.id,
      resultadoId: data.resultadoId.present
          ? data.resultadoId.value
          : this.resultadoId,
      questaoId: data.questaoId.present ? data.questaoId.value : this.questaoId,
      numeroQuestao: data.numeroQuestao.present
          ? data.numeroQuestao.value
          : this.numeroQuestao,
      letrasMarcadas: data.letrasMarcadas.present
          ? data.letrasMarcadas.value
          : this.letrasMarcadas,
      letraCorreta: data.letraCorreta.present
          ? data.letraCorreta.value
          : this.letraCorreta,
      situacao: data.situacao.present ? data.situacao.value : this.situacao,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RespostaAlunoEntity(')
          ..write('id: $id, ')
          ..write('resultadoId: $resultadoId, ')
          ..write('questaoId: $questaoId, ')
          ..write('numeroQuestao: $numeroQuestao, ')
          ..write('letrasMarcadas: $letrasMarcadas, ')
          ..write('letraCorreta: $letraCorreta, ')
          ..write('situacao: $situacao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    resultadoId,
    questaoId,
    numeroQuestao,
    letrasMarcadas,
    letraCorreta,
    situacao,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RespostaAlunoEntity &&
          other.id == this.id &&
          other.resultadoId == this.resultadoId &&
          other.questaoId == this.questaoId &&
          other.numeroQuestao == this.numeroQuestao &&
          other.letrasMarcadas == this.letrasMarcadas &&
          other.letraCorreta == this.letraCorreta &&
          other.situacao == this.situacao);
}

class RespostasAlunoCompanion extends UpdateCompanion<RespostaAlunoEntity> {
  final Value<int> id;
  final Value<int> resultadoId;
  final Value<int> questaoId;
  final Value<int> numeroQuestao;
  final Value<String> letrasMarcadas;
  final Value<String> letraCorreta;
  final Value<SituacaoQuestao> situacao;
  const RespostasAlunoCompanion({
    this.id = const Value.absent(),
    this.resultadoId = const Value.absent(),
    this.questaoId = const Value.absent(),
    this.numeroQuestao = const Value.absent(),
    this.letrasMarcadas = const Value.absent(),
    this.letraCorreta = const Value.absent(),
    this.situacao = const Value.absent(),
  });
  RespostasAlunoCompanion.insert({
    this.id = const Value.absent(),
    required int resultadoId,
    required int questaoId,
    required int numeroQuestao,
    required String letrasMarcadas,
    required String letraCorreta,
    required SituacaoQuestao situacao,
  }) : resultadoId = Value(resultadoId),
       questaoId = Value(questaoId),
       numeroQuestao = Value(numeroQuestao),
       letrasMarcadas = Value(letrasMarcadas),
       letraCorreta = Value(letraCorreta),
       situacao = Value(situacao);
  static Insertable<RespostaAlunoEntity> custom({
    Expression<int>? id,
    Expression<int>? resultadoId,
    Expression<int>? questaoId,
    Expression<int>? numeroQuestao,
    Expression<String>? letrasMarcadas,
    Expression<String>? letraCorreta,
    Expression<String>? situacao,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (resultadoId != null) 'resultadoId': resultadoId,
      if (questaoId != null) 'questaoId': questaoId,
      if (numeroQuestao != null) 'numeroQuestao': numeroQuestao,
      if (letrasMarcadas != null) 'letrasMarcadas': letrasMarcadas,
      if (letraCorreta != null) 'letraCorreta': letraCorreta,
      if (situacao != null) 'situacao': situacao,
    });
  }

  RespostasAlunoCompanion copyWith({
    Value<int>? id,
    Value<int>? resultadoId,
    Value<int>? questaoId,
    Value<int>? numeroQuestao,
    Value<String>? letrasMarcadas,
    Value<String>? letraCorreta,
    Value<SituacaoQuestao>? situacao,
  }) {
    return RespostasAlunoCompanion(
      id: id ?? this.id,
      resultadoId: resultadoId ?? this.resultadoId,
      questaoId: questaoId ?? this.questaoId,
      numeroQuestao: numeroQuestao ?? this.numeroQuestao,
      letrasMarcadas: letrasMarcadas ?? this.letrasMarcadas,
      letraCorreta: letraCorreta ?? this.letraCorreta,
      situacao: situacao ?? this.situacao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (resultadoId.present) {
      map['resultadoId'] = Variable<int>(resultadoId.value);
    }
    if (questaoId.present) {
      map['questaoId'] = Variable<int>(questaoId.value);
    }
    if (numeroQuestao.present) {
      map['numeroQuestao'] = Variable<int>(numeroQuestao.value);
    }
    if (letrasMarcadas.present) {
      map['letrasMarcadas'] = Variable<String>(letrasMarcadas.value);
    }
    if (letraCorreta.present) {
      map['letraCorreta'] = Variable<String>(letraCorreta.value);
    }
    if (situacao.present) {
      map['situacao'] = Variable<String>(
        $RespostasAlunoTable.$convertersituacao.toSql(situacao.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RespostasAlunoCompanion(')
          ..write('id: $id, ')
          ..write('resultadoId: $resultadoId, ')
          ..write('questaoId: $questaoId, ')
          ..write('numeroQuestao: $numeroQuestao, ')
          ..write('letrasMarcadas: $letrasMarcadas, ')
          ..write('letraCorreta: $letraCorreta, ')
          ..write('situacao: $situacao')
          ..write(')'))
        .toString();
  }
}

class $TurmasTable extends Turmas with TableInfo<$TurmasTable, TurmaEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TurmasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE COLLATE NOCASE',
  );
  static const VerificationMeta _criadaEmMeta = const VerificationMeta(
    'criadaEm',
  );
  @override
  late final GeneratedColumn<int> criadaEm = GeneratedColumn<int>(
    'criadaEm',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().millisecondsSinceEpoch,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nome, criadaEm];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'turmas';
  @override
  VerificationContext validateIntegrity(
    Insertable<TurmaEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('criadaEm')) {
      context.handle(
        _criadaEmMeta,
        criadaEm.isAcceptableOrUnknown(data['criadaEm']!, _criadaEmMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TurmaEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TurmaEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      criadaEm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}criadaEm'],
      )!,
    );
  }

  @override
  $TurmasTable createAlias(String alias) {
    return $TurmasTable(attachedDatabase, alias);
  }
}

class TurmaEntity extends DataClass implements Insertable<TurmaEntity> {
  final int id;
  final String nome;
  final int criadaEm;
  const TurmaEntity({
    required this.id,
    required this.nome,
    required this.criadaEm,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['criadaEm'] = Variable<int>(criadaEm);
    return map;
  }

  TurmasCompanion toCompanion(bool nullToAbsent) {
    return TurmasCompanion(
      id: Value(id),
      nome: Value(nome),
      criadaEm: Value(criadaEm),
    );
  }

  factory TurmaEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TurmaEntity(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      criadaEm: serializer.fromJson<int>(json['criadaEm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'criadaEm': serializer.toJson<int>(criadaEm),
    };
  }

  TurmaEntity copyWith({int? id, String? nome, int? criadaEm}) => TurmaEntity(
    id: id ?? this.id,
    nome: nome ?? this.nome,
    criadaEm: criadaEm ?? this.criadaEm,
  );
  TurmaEntity copyWithCompanion(TurmasCompanion data) {
    return TurmaEntity(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      criadaEm: data.criadaEm.present ? data.criadaEm.value : this.criadaEm,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TurmaEntity(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('criadaEm: $criadaEm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, criadaEm);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TurmaEntity &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.criadaEm == this.criadaEm);
}

class TurmasCompanion extends UpdateCompanion<TurmaEntity> {
  final Value<int> id;
  final Value<String> nome;
  final Value<int> criadaEm;
  const TurmasCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.criadaEm = const Value.absent(),
  });
  TurmasCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    this.criadaEm = const Value.absent(),
  }) : nome = Value(nome);
  static Insertable<TurmaEntity> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<int>? criadaEm,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (criadaEm != null) 'criadaEm': criadaEm,
    });
  }

  TurmasCompanion copyWith({
    Value<int>? id,
    Value<String>? nome,
    Value<int>? criadaEm,
  }) {
    return TurmasCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      criadaEm: criadaEm ?? this.criadaEm,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (criadaEm.present) {
      map['criadaEm'] = Variable<int>(criadaEm.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TurmasCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('criadaEm: $criadaEm')
          ..write(')'))
        .toString();
  }
}

class $DisciplinasTable extends Disciplinas
    with TableInfo<$DisciplinasTable, DisciplinaEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DisciplinasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL UNIQUE COLLATE NOCASE',
  );
  static const VerificationMeta _criadaEmMeta = const VerificationMeta(
    'criadaEm',
  );
  @override
  late final GeneratedColumn<int> criadaEm = GeneratedColumn<int>(
    'criadaEm',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().millisecondsSinceEpoch,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nome, criadaEm];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'disciplinas';
  @override
  VerificationContext validateIntegrity(
    Insertable<DisciplinaEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('criadaEm')) {
      context.handle(
        _criadaEmMeta,
        criadaEm.isAcceptableOrUnknown(data['criadaEm']!, _criadaEmMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DisciplinaEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DisciplinaEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      criadaEm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}criadaEm'],
      )!,
    );
  }

  @override
  $DisciplinasTable createAlias(String alias) {
    return $DisciplinasTable(attachedDatabase, alias);
  }
}

class DisciplinaEntity extends DataClass
    implements Insertable<DisciplinaEntity> {
  final int id;
  final String nome;
  final int criadaEm;
  const DisciplinaEntity({
    required this.id,
    required this.nome,
    required this.criadaEm,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['criadaEm'] = Variable<int>(criadaEm);
    return map;
  }

  DisciplinasCompanion toCompanion(bool nullToAbsent) {
    return DisciplinasCompanion(
      id: Value(id),
      nome: Value(nome),
      criadaEm: Value(criadaEm),
    );
  }

  factory DisciplinaEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DisciplinaEntity(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      criadaEm: serializer.fromJson<int>(json['criadaEm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'criadaEm': serializer.toJson<int>(criadaEm),
    };
  }

  DisciplinaEntity copyWith({int? id, String? nome, int? criadaEm}) =>
      DisciplinaEntity(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        criadaEm: criadaEm ?? this.criadaEm,
      );
  DisciplinaEntity copyWithCompanion(DisciplinasCompanion data) {
    return DisciplinaEntity(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      criadaEm: data.criadaEm.present ? data.criadaEm.value : this.criadaEm,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DisciplinaEntity(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('criadaEm: $criadaEm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, criadaEm);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DisciplinaEntity &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.criadaEm == this.criadaEm);
}

class DisciplinasCompanion extends UpdateCompanion<DisciplinaEntity> {
  final Value<int> id;
  final Value<String> nome;
  final Value<int> criadaEm;
  const DisciplinasCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.criadaEm = const Value.absent(),
  });
  DisciplinasCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    this.criadaEm = const Value.absent(),
  }) : nome = Value(nome);
  static Insertable<DisciplinaEntity> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<int>? criadaEm,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (criadaEm != null) 'criadaEm': criadaEm,
    });
  }

  DisciplinasCompanion copyWith({
    Value<int>? id,
    Value<String>? nome,
    Value<int>? criadaEm,
  }) {
    return DisciplinasCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      criadaEm: criadaEm ?? this.criadaEm,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (criadaEm.present) {
      map['criadaEm'] = Variable<int>(criadaEm.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DisciplinasCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('criadaEm: $criadaEm')
          ..write(')'))
        .toString();
  }
}

class $BancoQuestoesTable extends BancoQuestoes
    with TableInfo<$BancoQuestoesTable, BancoQuestaoEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BancoQuestoesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _disciplinaMeta = const VerificationMeta(
    'disciplina',
  );
  @override
  late final GeneratedColumn<String> disciplina = GeneratedColumn<String>(
    'disciplina',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enunciadoMeta = const VerificationMeta(
    'enunciado',
  );
  @override
  late final GeneratedColumn<String> enunciado = GeneratedColumn<String>(
    'enunciado',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _criadaEmMeta = const VerificationMeta(
    'criadaEm',
  );
  @override
  late final GeneratedColumn<int> criadaEm = GeneratedColumn<int>(
    'criadaEm',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().millisecondsSinceEpoch,
  );
  @override
  List<GeneratedColumn> get $columns => [id, disciplina, enunciado, criadaEm];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'banco_questoes';
  @override
  VerificationContext validateIntegrity(
    Insertable<BancoQuestaoEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('disciplina')) {
      context.handle(
        _disciplinaMeta,
        disciplina.isAcceptableOrUnknown(data['disciplina']!, _disciplinaMeta),
      );
    } else if (isInserting) {
      context.missing(_disciplinaMeta);
    }
    if (data.containsKey('enunciado')) {
      context.handle(
        _enunciadoMeta,
        enunciado.isAcceptableOrUnknown(data['enunciado']!, _enunciadoMeta),
      );
    } else if (isInserting) {
      context.missing(_enunciadoMeta);
    }
    if (data.containsKey('criadaEm')) {
      context.handle(
        _criadaEmMeta,
        criadaEm.isAcceptableOrUnknown(data['criadaEm']!, _criadaEmMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BancoQuestaoEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BancoQuestaoEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      disciplina: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}disciplina'],
      )!,
      enunciado: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}enunciado'],
      )!,
      criadaEm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}criadaEm'],
      )!,
    );
  }

  @override
  $BancoQuestoesTable createAlias(String alias) {
    return $BancoQuestoesTable(attachedDatabase, alias);
  }
}

class BancoQuestaoEntity extends DataClass
    implements Insertable<BancoQuestaoEntity> {
  final int id;
  final String disciplina;
  final String enunciado;
  final int criadaEm;
  const BancoQuestaoEntity({
    required this.id,
    required this.disciplina,
    required this.enunciado,
    required this.criadaEm,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['disciplina'] = Variable<String>(disciplina);
    map['enunciado'] = Variable<String>(enunciado);
    map['criadaEm'] = Variable<int>(criadaEm);
    return map;
  }

  BancoQuestoesCompanion toCompanion(bool nullToAbsent) {
    return BancoQuestoesCompanion(
      id: Value(id),
      disciplina: Value(disciplina),
      enunciado: Value(enunciado),
      criadaEm: Value(criadaEm),
    );
  }

  factory BancoQuestaoEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BancoQuestaoEntity(
      id: serializer.fromJson<int>(json['id']),
      disciplina: serializer.fromJson<String>(json['disciplina']),
      enunciado: serializer.fromJson<String>(json['enunciado']),
      criadaEm: serializer.fromJson<int>(json['criadaEm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'disciplina': serializer.toJson<String>(disciplina),
      'enunciado': serializer.toJson<String>(enunciado),
      'criadaEm': serializer.toJson<int>(criadaEm),
    };
  }

  BancoQuestaoEntity copyWith({
    int? id,
    String? disciplina,
    String? enunciado,
    int? criadaEm,
  }) => BancoQuestaoEntity(
    id: id ?? this.id,
    disciplina: disciplina ?? this.disciplina,
    enunciado: enunciado ?? this.enunciado,
    criadaEm: criadaEm ?? this.criadaEm,
  );
  BancoQuestaoEntity copyWithCompanion(BancoQuestoesCompanion data) {
    return BancoQuestaoEntity(
      id: data.id.present ? data.id.value : this.id,
      disciplina: data.disciplina.present
          ? data.disciplina.value
          : this.disciplina,
      enunciado: data.enunciado.present ? data.enunciado.value : this.enunciado,
      criadaEm: data.criadaEm.present ? data.criadaEm.value : this.criadaEm,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BancoQuestaoEntity(')
          ..write('id: $id, ')
          ..write('disciplina: $disciplina, ')
          ..write('enunciado: $enunciado, ')
          ..write('criadaEm: $criadaEm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, disciplina, enunciado, criadaEm);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BancoQuestaoEntity &&
          other.id == this.id &&
          other.disciplina == this.disciplina &&
          other.enunciado == this.enunciado &&
          other.criadaEm == this.criadaEm);
}

class BancoQuestoesCompanion extends UpdateCompanion<BancoQuestaoEntity> {
  final Value<int> id;
  final Value<String> disciplina;
  final Value<String> enunciado;
  final Value<int> criadaEm;
  const BancoQuestoesCompanion({
    this.id = const Value.absent(),
    this.disciplina = const Value.absent(),
    this.enunciado = const Value.absent(),
    this.criadaEm = const Value.absent(),
  });
  BancoQuestoesCompanion.insert({
    this.id = const Value.absent(),
    required String disciplina,
    required String enunciado,
    this.criadaEm = const Value.absent(),
  }) : disciplina = Value(disciplina),
       enunciado = Value(enunciado);
  static Insertable<BancoQuestaoEntity> custom({
    Expression<int>? id,
    Expression<String>? disciplina,
    Expression<String>? enunciado,
    Expression<int>? criadaEm,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (disciplina != null) 'disciplina': disciplina,
      if (enunciado != null) 'enunciado': enunciado,
      if (criadaEm != null) 'criadaEm': criadaEm,
    });
  }

  BancoQuestoesCompanion copyWith({
    Value<int>? id,
    Value<String>? disciplina,
    Value<String>? enunciado,
    Value<int>? criadaEm,
  }) {
    return BancoQuestoesCompanion(
      id: id ?? this.id,
      disciplina: disciplina ?? this.disciplina,
      enunciado: enunciado ?? this.enunciado,
      criadaEm: criadaEm ?? this.criadaEm,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (disciplina.present) {
      map['disciplina'] = Variable<String>(disciplina.value);
    }
    if (enunciado.present) {
      map['enunciado'] = Variable<String>(enunciado.value);
    }
    if (criadaEm.present) {
      map['criadaEm'] = Variable<int>(criadaEm.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BancoQuestoesCompanion(')
          ..write('id: $id, ')
          ..write('disciplina: $disciplina, ')
          ..write('enunciado: $enunciado, ')
          ..write('criadaEm: $criadaEm')
          ..write(')'))
        .toString();
  }
}

class $BancoAlternativasTable extends BancoAlternativas
    with TableInfo<$BancoAlternativasTable, BancoAlternativaEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BancoAlternativasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _bancoQuestaoIdMeta = const VerificationMeta(
    'bancoQuestaoId',
  );
  @override
  late final GeneratedColumn<int> bancoQuestaoId = GeneratedColumn<int>(
    'bancoQuestaoId',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES banco_questoes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _textoMeta = const VerificationMeta('texto');
  @override
  late final GeneratedColumn<String> texto = GeneratedColumn<String>(
    'texto',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _corretaMeta = const VerificationMeta(
    'correta',
  );
  @override
  late final GeneratedColumn<bool> correta = GeneratedColumn<bool>(
    'correta',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("correta" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _ordemMeta = const VerificationMeta('ordem');
  @override
  late final GeneratedColumn<int> ordem = GeneratedColumn<int>(
    'ordem',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    bancoQuestaoId,
    texto,
    correta,
    ordem,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'banco_alternativas';
  @override
  VerificationContext validateIntegrity(
    Insertable<BancoAlternativaEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bancoQuestaoId')) {
      context.handle(
        _bancoQuestaoIdMeta,
        bancoQuestaoId.isAcceptableOrUnknown(
          data['bancoQuestaoId']!,
          _bancoQuestaoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_bancoQuestaoIdMeta);
    }
    if (data.containsKey('texto')) {
      context.handle(
        _textoMeta,
        texto.isAcceptableOrUnknown(data['texto']!, _textoMeta),
      );
    } else if (isInserting) {
      context.missing(_textoMeta);
    }
    if (data.containsKey('correta')) {
      context.handle(
        _corretaMeta,
        correta.isAcceptableOrUnknown(data['correta']!, _corretaMeta),
      );
    }
    if (data.containsKey('ordem')) {
      context.handle(
        _ordemMeta,
        ordem.isAcceptableOrUnknown(data['ordem']!, _ordemMeta),
      );
    } else if (isInserting) {
      context.missing(_ordemMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BancoAlternativaEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BancoAlternativaEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      bancoQuestaoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bancoQuestaoId'],
      )!,
      texto: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}texto'],
      )!,
      correta: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}correta'],
      )!,
      ordem: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ordem'],
      )!,
    );
  }

  @override
  $BancoAlternativasTable createAlias(String alias) {
    return $BancoAlternativasTable(attachedDatabase, alias);
  }
}

class BancoAlternativaEntity extends DataClass
    implements Insertable<BancoAlternativaEntity> {
  final int id;
  final int bancoQuestaoId;
  final String texto;
  final bool correta;
  final int ordem;
  const BancoAlternativaEntity({
    required this.id,
    required this.bancoQuestaoId,
    required this.texto,
    required this.correta,
    required this.ordem,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bancoQuestaoId'] = Variable<int>(bancoQuestaoId);
    map['texto'] = Variable<String>(texto);
    map['correta'] = Variable<bool>(correta);
    map['ordem'] = Variable<int>(ordem);
    return map;
  }

  BancoAlternativasCompanion toCompanion(bool nullToAbsent) {
    return BancoAlternativasCompanion(
      id: Value(id),
      bancoQuestaoId: Value(bancoQuestaoId),
      texto: Value(texto),
      correta: Value(correta),
      ordem: Value(ordem),
    );
  }

  factory BancoAlternativaEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BancoAlternativaEntity(
      id: serializer.fromJson<int>(json['id']),
      bancoQuestaoId: serializer.fromJson<int>(json['bancoQuestaoId']),
      texto: serializer.fromJson<String>(json['texto']),
      correta: serializer.fromJson<bool>(json['correta']),
      ordem: serializer.fromJson<int>(json['ordem']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bancoQuestaoId': serializer.toJson<int>(bancoQuestaoId),
      'texto': serializer.toJson<String>(texto),
      'correta': serializer.toJson<bool>(correta),
      'ordem': serializer.toJson<int>(ordem),
    };
  }

  BancoAlternativaEntity copyWith({
    int? id,
    int? bancoQuestaoId,
    String? texto,
    bool? correta,
    int? ordem,
  }) => BancoAlternativaEntity(
    id: id ?? this.id,
    bancoQuestaoId: bancoQuestaoId ?? this.bancoQuestaoId,
    texto: texto ?? this.texto,
    correta: correta ?? this.correta,
    ordem: ordem ?? this.ordem,
  );
  BancoAlternativaEntity copyWithCompanion(BancoAlternativasCompanion data) {
    return BancoAlternativaEntity(
      id: data.id.present ? data.id.value : this.id,
      bancoQuestaoId: data.bancoQuestaoId.present
          ? data.bancoQuestaoId.value
          : this.bancoQuestaoId,
      texto: data.texto.present ? data.texto.value : this.texto,
      correta: data.correta.present ? data.correta.value : this.correta,
      ordem: data.ordem.present ? data.ordem.value : this.ordem,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BancoAlternativaEntity(')
          ..write('id: $id, ')
          ..write('bancoQuestaoId: $bancoQuestaoId, ')
          ..write('texto: $texto, ')
          ..write('correta: $correta, ')
          ..write('ordem: $ordem')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, bancoQuestaoId, texto, correta, ordem);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BancoAlternativaEntity &&
          other.id == this.id &&
          other.bancoQuestaoId == this.bancoQuestaoId &&
          other.texto == this.texto &&
          other.correta == this.correta &&
          other.ordem == this.ordem);
}

class BancoAlternativasCompanion
    extends UpdateCompanion<BancoAlternativaEntity> {
  final Value<int> id;
  final Value<int> bancoQuestaoId;
  final Value<String> texto;
  final Value<bool> correta;
  final Value<int> ordem;
  const BancoAlternativasCompanion({
    this.id = const Value.absent(),
    this.bancoQuestaoId = const Value.absent(),
    this.texto = const Value.absent(),
    this.correta = const Value.absent(),
    this.ordem = const Value.absent(),
  });
  BancoAlternativasCompanion.insert({
    this.id = const Value.absent(),
    required int bancoQuestaoId,
    required String texto,
    this.correta = const Value.absent(),
    required int ordem,
  }) : bancoQuestaoId = Value(bancoQuestaoId),
       texto = Value(texto),
       ordem = Value(ordem);
  static Insertable<BancoAlternativaEntity> custom({
    Expression<int>? id,
    Expression<int>? bancoQuestaoId,
    Expression<String>? texto,
    Expression<bool>? correta,
    Expression<int>? ordem,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bancoQuestaoId != null) 'bancoQuestaoId': bancoQuestaoId,
      if (texto != null) 'texto': texto,
      if (correta != null) 'correta': correta,
      if (ordem != null) 'ordem': ordem,
    });
  }

  BancoAlternativasCompanion copyWith({
    Value<int>? id,
    Value<int>? bancoQuestaoId,
    Value<String>? texto,
    Value<bool>? correta,
    Value<int>? ordem,
  }) {
    return BancoAlternativasCompanion(
      id: id ?? this.id,
      bancoQuestaoId: bancoQuestaoId ?? this.bancoQuestaoId,
      texto: texto ?? this.texto,
      correta: correta ?? this.correta,
      ordem: ordem ?? this.ordem,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bancoQuestaoId.present) {
      map['bancoQuestaoId'] = Variable<int>(bancoQuestaoId.value);
    }
    if (texto.present) {
      map['texto'] = Variable<String>(texto.value);
    }
    if (correta.present) {
      map['correta'] = Variable<bool>(correta.value);
    }
    if (ordem.present) {
      map['ordem'] = Variable<int>(ordem.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BancoAlternativasCompanion(')
          ..write('id: $id, ')
          ..write('bancoQuestaoId: $bancoQuestaoId, ')
          ..write('texto: $texto, ')
          ..write('correta: $correta, ')
          ..write('ordem: $ordem')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProvasTable provas = $ProvasTable(this);
  late final $QuestoesTable questoes = $QuestoesTable(this);
  late final $AlternativasTable alternativas = $AlternativasTable(this);
  late final $AlunosTable alunos = $AlunosTable(this);
  late final $ResultadosTable resultados = $ResultadosTable(this);
  late final $RespostasAlunoTable respostasAluno = $RespostasAlunoTable(this);
  late final $TurmasTable turmas = $TurmasTable(this);
  late final $DisciplinasTable disciplinas = $DisciplinasTable(this);
  late final $BancoQuestoesTable bancoQuestoes = $BancoQuestoesTable(this);
  late final $BancoAlternativasTable bancoAlternativas =
      $BancoAlternativasTable(this);
  late final Index indexQuestoesProvaId = Index(
    'index_questoes_provaId',
    'CREATE INDEX index_questoes_provaId ON questoes (provaId)',
  );
  late final Index indexAlternativasQuestaoId = Index(
    'index_alternativas_questaoId',
    'CREATE INDEX index_alternativas_questaoId ON alternativas (questaoId)',
  );
  late final Index indexAlunosNomeTurma = Index(
    'index_alunos_nome_turma',
    'CREATE UNIQUE INDEX index_alunos_nome_turma ON alunos (nome, turma)',
  );
  late final Index indexAlunosMatricula = Index(
    'index_alunos_matricula',
    'CREATE UNIQUE INDEX index_alunos_matricula ON alunos (matricula)',
  );
  late final Index indexResultadosProvaIdAlunoId = Index(
    'index_resultados_provaId_alunoId',
    'CREATE UNIQUE INDEX index_resultados_provaId_alunoId ON resultados (provaId, alunoId)',
  );
  late final Index indexResultadosAlunoId = Index(
    'index_resultados_alunoId',
    'CREATE INDEX index_resultados_alunoId ON resultados (alunoId)',
  );
  late final Index indexRespostasAlunoResultadoId = Index(
    'index_respostas_aluno_resultadoId',
    'CREATE INDEX index_respostas_aluno_resultadoId ON respostas_aluno (resultadoId)',
  );
  late final Index indexRespostasAlunoQuestaoId = Index(
    'index_respostas_aluno_questaoId',
    'CREATE INDEX index_respostas_aluno_questaoId ON respostas_aluno (questaoId)',
  );
  late final Index idxBancoAlternativasQuestao = Index(
    'idx_banco_alternativas_questao',
    'CREATE INDEX idx_banco_alternativas_questao ON banco_alternativas (bancoQuestaoId)',
  );
  late final ProvaDao provaDao = ProvaDao(this as AppDatabase);
  late final ResultadoDao resultadoDao = ResultadoDao(this as AppDatabase);
  late final AlunoDao alunoDao = AlunoDao(this as AppDatabase);
  late final HistoricoDao historicoDao = HistoricoDao(this as AppDatabase);
  late final TurmaDao turmaDao = TurmaDao(this as AppDatabase);
  late final DisciplinaDao disciplinaDao = DisciplinaDao(this as AppDatabase);
  late final BancoQuestaoDao bancoQuestaoDao = BancoQuestaoDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    provas,
    questoes,
    alternativas,
    alunos,
    resultados,
    respostasAluno,
    turmas,
    disciplinas,
    bancoQuestoes,
    bancoAlternativas,
    indexQuestoesProvaId,
    indexAlternativasQuestaoId,
    indexAlunosNomeTurma,
    indexAlunosMatricula,
    indexResultadosProvaIdAlunoId,
    indexResultadosAlunoId,
    indexRespostasAlunoResultadoId,
    indexRespostasAlunoQuestaoId,
    idxBancoAlternativasQuestao,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'provas',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('questoes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'questoes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('alternativas', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'provas',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('resultados', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'alunos',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('resultados', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'resultados',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('respostas_aluno', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'questoes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('respostas_aluno', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'banco_questoes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('banco_alternativas', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$ProvasTableCreateCompanionBuilder = ProvasCompanion Function({
  Value<int> id,
  required String titulo,
  required String disciplina,
  Value<String> descricao,
  Value<int> criadaEm,
  Value<String> turma,
});
typedef $$ProvasTableUpdateCompanionBuilder = ProvasCompanion Function({
  Value<int> id,
  Value<String> titulo,
  Value<String> disciplina,
  Value<String> descricao,
  Value<int> criadaEm,
  Value<String> turma,
});

final class $$ProvasTableReferences
    extends BaseReferences<_$AppDatabase, $ProvasTable, ProvaEntity> {
  $$ProvasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$QuestoesTable, List<QuestaoEntity>>
  _questoesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.questoes,
    aliasName: 'provas__id__questoes__provaId',
  );

  $$QuestoesTableProcessedTableManager get questoesRefs {
    final manager = $$QuestoesTableTableManager(
      $_db,
      $_db.questoes,
    ).filter((f) => f.provaId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_questoesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ResultadosTable, List<ResultadoEntity>>
  _resultadosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.resultados,
    aliasName: 'provas__id__resultados__provaId',
  );

  $$ResultadosTableProcessedTableManager get resultadosRefs {
    final manager = $$ResultadosTableTableManager(
      $_db,
      $_db.resultados,
    ).filter((f) => f.provaId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_resultadosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProvasTableFilterComposer
    extends Composer<_$AppDatabase, $ProvasTable> {
  $$ProvasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titulo => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get disciplina => $composableBuilder(
    column: $table.disciplina,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descricao => $composableBuilder(
    column: $table.descricao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get criadaEm => $composableBuilder(
    column: $table.criadaEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get turma => $composableBuilder(
    column: $table.turma,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> questoesRefs(
    Expression<bool> Function($$QuestoesTableFilterComposer f) f,
  ) {
    final $$QuestoesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.questoes,
      getReferencedColumn: (t) => t.provaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestoesTableFilterComposer(
            $db: $db,
            $table: $db.questoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> resultadosRefs(
    Expression<bool> Function($$ResultadosTableFilterComposer f) f,
  ) {
    final $$ResultadosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.resultados,
      getReferencedColumn: (t) => t.provaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultadosTableFilterComposer(
            $db: $db,
            $table: $db.resultados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProvasTableOrderingComposer
    extends Composer<_$AppDatabase, $ProvasTable> {
  $$ProvasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titulo => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get disciplina => $composableBuilder(
    column: $table.disciplina,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descricao => $composableBuilder(
    column: $table.descricao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get criadaEm => $composableBuilder(
    column: $table.criadaEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get turma => $composableBuilder(
    column: $table.turma,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProvasTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProvasTable> {
  $$ProvasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get titulo =>
      $composableBuilder(column: $table.titulo, builder: (column) => column);

  GeneratedColumn<String> get disciplina => $composableBuilder(
    column: $table.disciplina,
    builder: (column) => column,
  );

  GeneratedColumn<String> get descricao =>
      $composableBuilder(column: $table.descricao, builder: (column) => column);

  GeneratedColumn<int> get criadaEm =>
      $composableBuilder(column: $table.criadaEm, builder: (column) => column);

  GeneratedColumn<String> get turma =>
      $composableBuilder(column: $table.turma, builder: (column) => column);

  Expression<T> questoesRefs<T extends Object>(
    Expression<T> Function($$QuestoesTableAnnotationComposer a) f,
  ) {
    final $$QuestoesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.questoes,
      getReferencedColumn: (t) => t.provaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestoesTableAnnotationComposer(
            $db: $db,
            $table: $db.questoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> resultadosRefs<T extends Object>(
    Expression<T> Function($$ResultadosTableAnnotationComposer a) f,
  ) {
    final $$ResultadosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.resultados,
      getReferencedColumn: (t) => t.provaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultadosTableAnnotationComposer(
            $db: $db,
            $table: $db.resultados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProvasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProvasTable,
          ProvaEntity,
          $$ProvasTableFilterComposer,
          $$ProvasTableOrderingComposer,
          $$ProvasTableAnnotationComposer,
          $$ProvasTableCreateCompanionBuilder,
          $$ProvasTableUpdateCompanionBuilder,
          (ProvaEntity, $$ProvasTableReferences),
          ProvaEntity,
          PrefetchHooks Function({bool questoesRefs, bool resultadosRefs})
        > {
  $$ProvasTableTableManager(_$AppDatabase db, $ProvasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProvasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProvasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProvasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> titulo = const Value.absent(),
                Value<String> disciplina = const Value.absent(),
                Value<String> descricao = const Value.absent(),
                Value<int> criadaEm = const Value.absent(),
                Value<String> turma = const Value.absent(),
              }) => ProvasCompanion(
                id: id,
                titulo: titulo,
                disciplina: disciplina,
                descricao: descricao,
                criadaEm: criadaEm,
                turma: turma,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String titulo,
                required String disciplina,
                Value<String> descricao = const Value.absent(),
                Value<int> criadaEm = const Value.absent(),
                Value<String> turma = const Value.absent(),
              }) => ProvasCompanion.insert(
                id: id,
                titulo: titulo,
                disciplina: disciplina,
                descricao: descricao,
                criadaEm: criadaEm,
                turma: turma,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProvasTable, ProvaEntity>(table),
                  $$ProvasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({questoesRefs = false, resultadosRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (questoesRefs) db.questoes,
                    if (resultadosRefs) db.resultados,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (questoesRefs)
                        await $_getPrefetchedDataByColumns<
                          ProvaEntity,
                          $ProvasTable,
                          QuestaoEntity,
                          $QuestoesTable
                        >(
                          currentTable: table,
                          referencedTable: $$ProvasTableReferences
                              ._questoesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProvasTableReferences(
                                db,
                                table,
                                p0,
                              ).questoesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'provaId',
                          typedResults: items,
                        ),
                      if (resultadosRefs)
                        await $_getPrefetchedDataByColumns<
                          ProvaEntity,
                          $ProvasTable,
                          ResultadoEntity,
                          $ResultadosTable
                        >(
                          currentTable: table,
                          referencedTable: $$ProvasTableReferences
                              ._resultadosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProvasTableReferences(
                                db,
                                table,
                                p0,
                              ).resultadosRefs,
                          currentColumn: 'id',
                          referencedColumn: 'provaId',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProvasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProvasTable,
      ProvaEntity,
      $$ProvasTableFilterComposer,
      $$ProvasTableOrderingComposer,
      $$ProvasTableAnnotationComposer,
      $$ProvasTableCreateCompanionBuilder,
      $$ProvasTableUpdateCompanionBuilder,
      (ProvaEntity, $$ProvasTableReferences),
      ProvaEntity,
      PrefetchHooks Function({bool questoesRefs, bool resultadosRefs})
    >;
typedef $$QuestoesTableCreateCompanionBuilder = QuestoesCompanion Function({
  Value<int> id,
  required int provaId,
  required String enunciado,
  required int ordem,
});
typedef $$QuestoesTableUpdateCompanionBuilder = QuestoesCompanion Function({
  Value<int> id,
  Value<int> provaId,
  Value<String> enunciado,
  Value<int> ordem,
});

final class $$QuestoesTableReferences
    extends BaseReferences<_$AppDatabase, $QuestoesTable, QuestaoEntity> {
  $$QuestoesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProvasTable _provaIdTable(_$AppDatabase db) =>
      db.provas.createAlias('questoes__provaId__provas__id');

  $$ProvasTableProcessedTableManager get provaId {
    final $_column = $_itemColumn<int>('provaId')!;

    final manager = $$ProvasTableTableManager(
      $_db,
      $_db.provas,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_provaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AlternativasTable, List<AlternativaEntity>>
  _alternativasRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.alternativas,
    aliasName: 'questoes__id__alternativas__questaoId',
  );

  $$AlternativasTableProcessedTableManager get alternativasRefs {
    final manager = $$AlternativasTableTableManager(
      $_db,
      $_db.alternativas,
    ).filter((f) => f.questaoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_alternativasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RespostasAlunoTable, List<RespostaAlunoEntity>>
  _respostasAlunoRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.respostasAluno,
    aliasName: 'questoes__id__respostas_aluno__questaoId',
  );

  $$RespostasAlunoTableProcessedTableManager get respostasAlunoRefs {
    final manager = $$RespostasAlunoTableTableManager(
      $_db,
      $_db.respostasAluno,
    ).filter((f) => f.questaoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_respostasAlunoRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$QuestoesTableFilterComposer
    extends Composer<_$AppDatabase, $QuestoesTable> {
  $$QuestoesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get enunciado => $composableBuilder(
    column: $table.enunciado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ordem => $composableBuilder(
    column: $table.ordem,
    builder: (column) => ColumnFilters(column),
  );

  $$ProvasTableFilterComposer get provaId {
    final $$ProvasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.provaId,
      referencedTable: $db.provas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProvasTableFilterComposer(
            $db: $db,
            $table: $db.provas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> alternativasRefs(
    Expression<bool> Function($$AlternativasTableFilterComposer f) f,
  ) {
    final $$AlternativasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.alternativas,
      getReferencedColumn: (t) => t.questaoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlternativasTableFilterComposer(
            $db: $db,
            $table: $db.alternativas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> respostasAlunoRefs(
    Expression<bool> Function($$RespostasAlunoTableFilterComposer f) f,
  ) {
    final $$RespostasAlunoTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.respostasAluno,
      getReferencedColumn: (t) => t.questaoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RespostasAlunoTableFilterComposer(
            $db: $db,
            $table: $db.respostasAluno,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuestoesTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestoesTable> {
  $$QuestoesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get enunciado => $composableBuilder(
    column: $table.enunciado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ordem => $composableBuilder(
    column: $table.ordem,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProvasTableOrderingComposer get provaId {
    final $$ProvasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.provaId,
      referencedTable: $db.provas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProvasTableOrderingComposer(
            $db: $db,
            $table: $db.provas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuestoesTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestoesTable> {
  $$QuestoesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get enunciado =>
      $composableBuilder(column: $table.enunciado, builder: (column) => column);

  GeneratedColumn<int> get ordem =>
      $composableBuilder(column: $table.ordem, builder: (column) => column);

  $$ProvasTableAnnotationComposer get provaId {
    final $$ProvasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.provaId,
      referencedTable: $db.provas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProvasTableAnnotationComposer(
            $db: $db,
            $table: $db.provas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> alternativasRefs<T extends Object>(
    Expression<T> Function($$AlternativasTableAnnotationComposer a) f,
  ) {
    final $$AlternativasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.alternativas,
      getReferencedColumn: (t) => t.questaoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlternativasTableAnnotationComposer(
            $db: $db,
            $table: $db.alternativas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> respostasAlunoRefs<T extends Object>(
    Expression<T> Function($$RespostasAlunoTableAnnotationComposer a) f,
  ) {
    final $$RespostasAlunoTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.respostasAluno,
      getReferencedColumn: (t) => t.questaoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RespostasAlunoTableAnnotationComposer(
            $db: $db,
            $table: $db.respostasAluno,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuestoesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuestoesTable,
          QuestaoEntity,
          $$QuestoesTableFilterComposer,
          $$QuestoesTableOrderingComposer,
          $$QuestoesTableAnnotationComposer,
          $$QuestoesTableCreateCompanionBuilder,
          $$QuestoesTableUpdateCompanionBuilder,
          (QuestaoEntity, $$QuestoesTableReferences),
          QuestaoEntity,
          PrefetchHooks Function({
            bool provaId,
            bool alternativasRefs,
            bool respostasAlunoRefs,
          })
        > {
  $$QuestoesTableTableManager(_$AppDatabase db, $QuestoesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestoesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestoesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestoesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> provaId = const Value.absent(),
                Value<String> enunciado = const Value.absent(),
                Value<int> ordem = const Value.absent(),
              }) => QuestoesCompanion(
                id: id,
                provaId: provaId,
                enunciado: enunciado,
                ordem: ordem,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int provaId,
                required String enunciado,
                required int ordem,
              }) => QuestoesCompanion.insert(
                id: id,
                provaId: provaId,
                enunciado: enunciado,
                ordem: ordem,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$QuestoesTable, QuestaoEntity>(table),
                  $$QuestoesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                provaId = false,
                alternativasRefs = false,
                respostasAlunoRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (alternativasRefs) db.alternativas,
                    if (respostasAlunoRefs) db.respostasAluno,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (provaId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.provaId,
                            referencedTable: $$QuestoesTableReferences
                                ._provaIdTable(db),
                            referencedColumn: $$QuestoesTableReferences
                                ._provaIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (alternativasRefs)
                        await $_getPrefetchedDataByColumns<
                          QuestaoEntity,
                          $QuestoesTable,
                          AlternativaEntity,
                          $AlternativasTable
                        >(
                          currentTable: table,
                          referencedTable: $$QuestoesTableReferences
                              ._alternativasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$QuestoesTableReferences(
                                db,
                                table,
                                p0,
                              ).alternativasRefs,
                          currentColumn: 'id',
                          referencedColumn: 'questaoId',
                          typedResults: items,
                        ),
                      if (respostasAlunoRefs)
                        await $_getPrefetchedDataByColumns<
                          QuestaoEntity,
                          $QuestoesTable,
                          RespostaAlunoEntity,
                          $RespostasAlunoTable
                        >(
                          currentTable: table,
                          referencedTable: $$QuestoesTableReferences
                              ._respostasAlunoRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$QuestoesTableReferences(
                                db,
                                table,
                                p0,
                              ).respostasAlunoRefs,
                          currentColumn: 'id',
                          referencedColumn: 'questaoId',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$QuestoesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuestoesTable,
      QuestaoEntity,
      $$QuestoesTableFilterComposer,
      $$QuestoesTableOrderingComposer,
      $$QuestoesTableAnnotationComposer,
      $$QuestoesTableCreateCompanionBuilder,
      $$QuestoesTableUpdateCompanionBuilder,
      (QuestaoEntity, $$QuestoesTableReferences),
      QuestaoEntity,
      PrefetchHooks Function({
        bool provaId,
        bool alternativasRefs,
        bool respostasAlunoRefs,
      })
    >;
typedef $$AlternativasTableCreateCompanionBuilder =
    AlternativasCompanion Function({
      Value<int> id,
      required int questaoId,
      required String texto,
      required bool correta,
      required int ordem,
    });
typedef $$AlternativasTableUpdateCompanionBuilder =
    AlternativasCompanion Function({
      Value<int> id,
      Value<int> questaoId,
      Value<String> texto,
      Value<bool> correta,
      Value<int> ordem,
    });

final class $$AlternativasTableReferences
    extends
        BaseReferences<_$AppDatabase, $AlternativasTable, AlternativaEntity> {
  $$AlternativasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $QuestoesTable _questaoIdTable(_$AppDatabase db) =>
      db.questoes.createAlias('alternativas__questaoId__questoes__id');

  $$QuestoesTableProcessedTableManager get questaoId {
    final $_column = $_itemColumn<int>('questaoId')!;

    final manager = $$QuestoesTableTableManager(
      $_db,
      $_db.questoes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_questaoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AlternativasTableFilterComposer
    extends Composer<_$AppDatabase, $AlternativasTable> {
  $$AlternativasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get texto => $composableBuilder(
    column: $table.texto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get correta => $composableBuilder(
    column: $table.correta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ordem => $composableBuilder(
    column: $table.ordem,
    builder: (column) => ColumnFilters(column),
  );

  $$QuestoesTableFilterComposer get questaoId {
    final $$QuestoesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questaoId,
      referencedTable: $db.questoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestoesTableFilterComposer(
            $db: $db,
            $table: $db.questoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlternativasTableOrderingComposer
    extends Composer<_$AppDatabase, $AlternativasTable> {
  $$AlternativasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get texto => $composableBuilder(
    column: $table.texto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get correta => $composableBuilder(
    column: $table.correta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ordem => $composableBuilder(
    column: $table.ordem,
    builder: (column) => ColumnOrderings(column),
  );

  $$QuestoesTableOrderingComposer get questaoId {
    final $$QuestoesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questaoId,
      referencedTable: $db.questoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestoesTableOrderingComposer(
            $db: $db,
            $table: $db.questoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlternativasTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlternativasTable> {
  $$AlternativasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get texto =>
      $composableBuilder(column: $table.texto, builder: (column) => column);

  GeneratedColumn<bool> get correta =>
      $composableBuilder(column: $table.correta, builder: (column) => column);

  GeneratedColumn<int> get ordem =>
      $composableBuilder(column: $table.ordem, builder: (column) => column);

  $$QuestoesTableAnnotationComposer get questaoId {
    final $$QuestoesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questaoId,
      referencedTable: $db.questoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestoesTableAnnotationComposer(
            $db: $db,
            $table: $db.questoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlternativasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AlternativasTable,
          AlternativaEntity,
          $$AlternativasTableFilterComposer,
          $$AlternativasTableOrderingComposer,
          $$AlternativasTableAnnotationComposer,
          $$AlternativasTableCreateCompanionBuilder,
          $$AlternativasTableUpdateCompanionBuilder,
          (AlternativaEntity, $$AlternativasTableReferences),
          AlternativaEntity,
          PrefetchHooks Function({bool questaoId})
        > {
  $$AlternativasTableTableManager(_$AppDatabase db, $AlternativasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlternativasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlternativasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlternativasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> questaoId = const Value.absent(),
                Value<String> texto = const Value.absent(),
                Value<bool> correta = const Value.absent(),
                Value<int> ordem = const Value.absent(),
              }) => AlternativasCompanion(
                id: id,
                questaoId: questaoId,
                texto: texto,
                correta: correta,
                ordem: ordem,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int questaoId,
                required String texto,
                required bool correta,
                required int ordem,
              }) => AlternativasCompanion.insert(
                id: id,
                questaoId: questaoId,
                texto: texto,
                correta: correta,
                ordem: ordem,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AlternativasTable, AlternativaEntity>(table),
                  $$AlternativasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({questaoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (questaoId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.questaoId,
                        referencedTable: $$AlternativasTableReferences
                            ._questaoIdTable(db),
                        referencedColumn: $$AlternativasTableReferences
                            ._questaoIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AlternativasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AlternativasTable,
      AlternativaEntity,
      $$AlternativasTableFilterComposer,
      $$AlternativasTableOrderingComposer,
      $$AlternativasTableAnnotationComposer,
      $$AlternativasTableCreateCompanionBuilder,
      $$AlternativasTableUpdateCompanionBuilder,
      (AlternativaEntity, $$AlternativasTableReferences),
      AlternativaEntity,
      PrefetchHooks Function({bool questaoId})
    >;
typedef $$AlunosTableCreateCompanionBuilder = AlunosCompanion Function({
  Value<int> id,
  required String nome,
  Value<String> turma,
  Value<String?> matricula,
  Value<String?> email,
});
typedef $$AlunosTableUpdateCompanionBuilder = AlunosCompanion Function({
  Value<int> id,
  Value<String> nome,
  Value<String> turma,
  Value<String?> matricula,
  Value<String?> email,
});

final class $$AlunosTableReferences
    extends BaseReferences<_$AppDatabase, $AlunosTable, AlunoEntity> {
  $$AlunosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ResultadosTable, List<ResultadoEntity>>
  _resultadosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.resultados,
    aliasName: 'alunos__id__resultados__alunoId',
  );

  $$ResultadosTableProcessedTableManager get resultadosRefs {
    final manager = $$ResultadosTableTableManager(
      $_db,
      $_db.resultados,
    ).filter((f) => f.alunoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_resultadosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AlunosTableFilterComposer
    extends Composer<_$AppDatabase, $AlunosTable> {
  $$AlunosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get turma => $composableBuilder(
    column: $table.turma,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get matricula => $composableBuilder(
    column: $table.matricula,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> resultadosRefs(
    Expression<bool> Function($$ResultadosTableFilterComposer f) f,
  ) {
    final $$ResultadosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.resultados,
      getReferencedColumn: (t) => t.alunoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultadosTableFilterComposer(
            $db: $db,
            $table: $db.resultados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AlunosTableOrderingComposer
    extends Composer<_$AppDatabase, $AlunosTable> {
  $$AlunosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get turma => $composableBuilder(
    column: $table.turma,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get matricula => $composableBuilder(
    column: $table.matricula,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AlunosTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlunosTable> {
  $$AlunosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get turma =>
      $composableBuilder(column: $table.turma, builder: (column) => column);

  GeneratedColumn<String> get matricula =>
      $composableBuilder(column: $table.matricula, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  Expression<T> resultadosRefs<T extends Object>(
    Expression<T> Function($$ResultadosTableAnnotationComposer a) f,
  ) {
    final $$ResultadosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.resultados,
      getReferencedColumn: (t) => t.alunoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultadosTableAnnotationComposer(
            $db: $db,
            $table: $db.resultados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AlunosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AlunosTable,
          AlunoEntity,
          $$AlunosTableFilterComposer,
          $$AlunosTableOrderingComposer,
          $$AlunosTableAnnotationComposer,
          $$AlunosTableCreateCompanionBuilder,
          $$AlunosTableUpdateCompanionBuilder,
          (AlunoEntity, $$AlunosTableReferences),
          AlunoEntity,
          PrefetchHooks Function({bool resultadosRefs})
        > {
  $$AlunosTableTableManager(_$AppDatabase db, $AlunosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlunosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlunosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlunosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<String> turma = const Value.absent(),
                Value<String?> matricula = const Value.absent(),
                Value<String?> email = const Value.absent(),
              }) => AlunosCompanion(
                id: id,
                nome: nome,
                turma: turma,
                matricula: matricula,
                email: email,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nome,
                Value<String> turma = const Value.absent(),
                Value<String?> matricula = const Value.absent(),
                Value<String?> email = const Value.absent(),
              }) => AlunosCompanion.insert(
                id: id,
                nome: nome,
                turma: turma,
                matricula: matricula,
                email: email,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AlunosTable, AlunoEntity>(table),
                  $$AlunosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({resultadosRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (resultadosRefs) db.resultados],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (resultadosRefs)
                    await $_getPrefetchedDataByColumns<
                      AlunoEntity,
                      $AlunosTable,
                      ResultadoEntity,
                      $ResultadosTable
                    >(
                      currentTable: table,
                      referencedTable: $$AlunosTableReferences
                          ._resultadosRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AlunosTableReferences(db, table, p0).resultadosRefs,
                      currentColumn: 'id',
                      referencedColumn: 'alunoId',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AlunosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AlunosTable,
      AlunoEntity,
      $$AlunosTableFilterComposer,
      $$AlunosTableOrderingComposer,
      $$AlunosTableAnnotationComposer,
      $$AlunosTableCreateCompanionBuilder,
      $$AlunosTableUpdateCompanionBuilder,
      (AlunoEntity, $$AlunosTableReferences),
      AlunoEntity,
      PrefetchHooks Function({bool resultadosRefs})
    >;
typedef $$ResultadosTableCreateCompanionBuilder = ResultadosCompanion Function({
  Value<int> id,
  required int provaId,
  required int alunoId,
  required int totalQuestoes,
  required int acertos,
  required int erros,
  required int emBranco,
  required double nota,
  required double notaMaxima,
  Value<int> corrigidoEm,
});
typedef $$ResultadosTableUpdateCompanionBuilder = ResultadosCompanion Function({
  Value<int> id,
  Value<int> provaId,
  Value<int> alunoId,
  Value<int> totalQuestoes,
  Value<int> acertos,
  Value<int> erros,
  Value<int> emBranco,
  Value<double> nota,
  Value<double> notaMaxima,
  Value<int> corrigidoEm,
});

final class $$ResultadosTableReferences
    extends BaseReferences<_$AppDatabase, $ResultadosTable, ResultadoEntity> {
  $$ResultadosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProvasTable _provaIdTable(_$AppDatabase db) =>
      db.provas.createAlias('resultados__provaId__provas__id');

  $$ProvasTableProcessedTableManager get provaId {
    final $_column = $_itemColumn<int>('provaId')!;

    final manager = $$ProvasTableTableManager(
      $_db,
      $_db.provas,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_provaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AlunosTable _alunoIdTable(_$AppDatabase db) =>
      db.alunos.createAlias('resultados__alunoId__alunos__id');

  $$AlunosTableProcessedTableManager get alunoId {
    final $_column = $_itemColumn<int>('alunoId')!;

    final manager = $$AlunosTableTableManager(
      $_db,
      $_db.alunos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_alunoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RespostasAlunoTable, List<RespostaAlunoEntity>>
  _respostasAlunoRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.respostasAluno,
    aliasName: 'resultados__id__respostas_aluno__resultadoId',
  );

  $$RespostasAlunoTableProcessedTableManager get respostasAlunoRefs {
    final manager = $$RespostasAlunoTableTableManager(
      $_db,
      $_db.respostasAluno,
    ).filter((f) => f.resultadoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_respostasAlunoRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ResultadosTableFilterComposer
    extends Composer<_$AppDatabase, $ResultadosTable> {
  $$ResultadosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalQuestoes => $composableBuilder(
    column: $table.totalQuestoes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get acertos => $composableBuilder(
    column: $table.acertos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get erros => $composableBuilder(
    column: $table.erros,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get emBranco => $composableBuilder(
    column: $table.emBranco,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get nota => $composableBuilder(
    column: $table.nota,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get notaMaxima => $composableBuilder(
    column: $table.notaMaxima,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get corrigidoEm => $composableBuilder(
    column: $table.corrigidoEm,
    builder: (column) => ColumnFilters(column),
  );

  $$ProvasTableFilterComposer get provaId {
    final $$ProvasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.provaId,
      referencedTable: $db.provas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProvasTableFilterComposer(
            $db: $db,
            $table: $db.provas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AlunosTableFilterComposer get alunoId {
    final $$AlunosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.alunoId,
      referencedTable: $db.alunos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlunosTableFilterComposer(
            $db: $db,
            $table: $db.alunos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> respostasAlunoRefs(
    Expression<bool> Function($$RespostasAlunoTableFilterComposer f) f,
  ) {
    final $$RespostasAlunoTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.respostasAluno,
      getReferencedColumn: (t) => t.resultadoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RespostasAlunoTableFilterComposer(
            $db: $db,
            $table: $db.respostasAluno,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ResultadosTableOrderingComposer
    extends Composer<_$AppDatabase, $ResultadosTable> {
  $$ResultadosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalQuestoes => $composableBuilder(
    column: $table.totalQuestoes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get acertos => $composableBuilder(
    column: $table.acertos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get erros => $composableBuilder(
    column: $table.erros,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get emBranco => $composableBuilder(
    column: $table.emBranco,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get nota => $composableBuilder(
    column: $table.nota,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get notaMaxima => $composableBuilder(
    column: $table.notaMaxima,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get corrigidoEm => $composableBuilder(
    column: $table.corrigidoEm,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProvasTableOrderingComposer get provaId {
    final $$ProvasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.provaId,
      referencedTable: $db.provas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProvasTableOrderingComposer(
            $db: $db,
            $table: $db.provas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AlunosTableOrderingComposer get alunoId {
    final $$AlunosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.alunoId,
      referencedTable: $db.alunos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlunosTableOrderingComposer(
            $db: $db,
            $table: $db.alunos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResultadosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ResultadosTable> {
  $$ResultadosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get totalQuestoes => $composableBuilder(
    column: $table.totalQuestoes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get acertos =>
      $composableBuilder(column: $table.acertos, builder: (column) => column);

  GeneratedColumn<int> get erros =>
      $composableBuilder(column: $table.erros, builder: (column) => column);

  GeneratedColumn<int> get emBranco =>
      $composableBuilder(column: $table.emBranco, builder: (column) => column);

  GeneratedColumn<double> get nota =>
      $composableBuilder(column: $table.nota, builder: (column) => column);

  GeneratedColumn<double> get notaMaxima => $composableBuilder(
    column: $table.notaMaxima,
    builder: (column) => column,
  );

  GeneratedColumn<int> get corrigidoEm => $composableBuilder(
    column: $table.corrigidoEm,
    builder: (column) => column,
  );

  $$ProvasTableAnnotationComposer get provaId {
    final $$ProvasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.provaId,
      referencedTable: $db.provas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProvasTableAnnotationComposer(
            $db: $db,
            $table: $db.provas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AlunosTableAnnotationComposer get alunoId {
    final $$AlunosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.alunoId,
      referencedTable: $db.alunos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlunosTableAnnotationComposer(
            $db: $db,
            $table: $db.alunos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> respostasAlunoRefs<T extends Object>(
    Expression<T> Function($$RespostasAlunoTableAnnotationComposer a) f,
  ) {
    final $$RespostasAlunoTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.respostasAluno,
      getReferencedColumn: (t) => t.resultadoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RespostasAlunoTableAnnotationComposer(
            $db: $db,
            $table: $db.respostasAluno,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ResultadosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ResultadosTable,
          ResultadoEntity,
          $$ResultadosTableFilterComposer,
          $$ResultadosTableOrderingComposer,
          $$ResultadosTableAnnotationComposer,
          $$ResultadosTableCreateCompanionBuilder,
          $$ResultadosTableUpdateCompanionBuilder,
          (ResultadoEntity, $$ResultadosTableReferences),
          ResultadoEntity,
          PrefetchHooks Function({
            bool provaId,
            bool alunoId,
            bool respostasAlunoRefs,
          })
        > {
  $$ResultadosTableTableManager(_$AppDatabase db, $ResultadosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ResultadosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ResultadosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ResultadosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> provaId = const Value.absent(),
                Value<int> alunoId = const Value.absent(),
                Value<int> totalQuestoes = const Value.absent(),
                Value<int> acertos = const Value.absent(),
                Value<int> erros = const Value.absent(),
                Value<int> emBranco = const Value.absent(),
                Value<double> nota = const Value.absent(),
                Value<double> notaMaxima = const Value.absent(),
                Value<int> corrigidoEm = const Value.absent(),
              }) => ResultadosCompanion(
                id: id,
                provaId: provaId,
                alunoId: alunoId,
                totalQuestoes: totalQuestoes,
                acertos: acertos,
                erros: erros,
                emBranco: emBranco,
                nota: nota,
                notaMaxima: notaMaxima,
                corrigidoEm: corrigidoEm,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int provaId,
                required int alunoId,
                required int totalQuestoes,
                required int acertos,
                required int erros,
                required int emBranco,
                required double nota,
                required double notaMaxima,
                Value<int> corrigidoEm = const Value.absent(),
              }) => ResultadosCompanion.insert(
                id: id,
                provaId: provaId,
                alunoId: alunoId,
                totalQuestoes: totalQuestoes,
                acertos: acertos,
                erros: erros,
                emBranco: emBranco,
                nota: nota,
                notaMaxima: notaMaxima,
                corrigidoEm: corrigidoEm,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ResultadosTable, ResultadoEntity>(table),
                  $$ResultadosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({provaId = false, alunoId = false, respostasAlunoRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (respostasAlunoRefs) db.respostasAluno,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (provaId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.provaId,
                            referencedTable: $$ResultadosTableReferences
                                ._provaIdTable(db),
                            referencedColumn: $$ResultadosTableReferences
                                ._provaIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (alunoId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.alunoId,
                            referencedTable: $$ResultadosTableReferences
                                ._alunoIdTable(db),
                            referencedColumn: $$ResultadosTableReferences
                                ._alunoIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (respostasAlunoRefs)
                        await $_getPrefetchedDataByColumns<
                          ResultadoEntity,
                          $ResultadosTable,
                          RespostaAlunoEntity,
                          $RespostasAlunoTable
                        >(
                          currentTable: table,
                          referencedTable: $$ResultadosTableReferences
                              ._respostasAlunoRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ResultadosTableReferences(
                                db,
                                table,
                                p0,
                              ).respostasAlunoRefs,
                          currentColumn: 'id',
                          referencedColumn: 'resultadoId',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ResultadosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ResultadosTable,
      ResultadoEntity,
      $$ResultadosTableFilterComposer,
      $$ResultadosTableOrderingComposer,
      $$ResultadosTableAnnotationComposer,
      $$ResultadosTableCreateCompanionBuilder,
      $$ResultadosTableUpdateCompanionBuilder,
      (ResultadoEntity, $$ResultadosTableReferences),
      ResultadoEntity,
      PrefetchHooks Function({
        bool provaId,
        bool alunoId,
        bool respostasAlunoRefs,
      })
    >;
typedef $$RespostasAlunoTableCreateCompanionBuilder =
    RespostasAlunoCompanion Function({
      Value<int> id,
      required int resultadoId,
      required int questaoId,
      required int numeroQuestao,
      required String letrasMarcadas,
      required String letraCorreta,
      required SituacaoQuestao situacao,
    });
typedef $$RespostasAlunoTableUpdateCompanionBuilder =
    RespostasAlunoCompanion Function({
      Value<int> id,
      Value<int> resultadoId,
      Value<int> questaoId,
      Value<int> numeroQuestao,
      Value<String> letrasMarcadas,
      Value<String> letraCorreta,
      Value<SituacaoQuestao> situacao,
    });

final class $$RespostasAlunoTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RespostasAlunoTable,
          RespostaAlunoEntity
        > {
  $$RespostasAlunoTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ResultadosTable _resultadoIdTable(_$AppDatabase db) =>
      db.resultados.createAlias('respostas_aluno__resultadoId__resultados__id');

  $$ResultadosTableProcessedTableManager get resultadoId {
    final $_column = $_itemColumn<int>('resultadoId')!;

    final manager = $$ResultadosTableTableManager(
      $_db,
      $_db.resultados,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_resultadoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $QuestoesTable _questaoIdTable(_$AppDatabase db) =>
      db.questoes.createAlias('respostas_aluno__questaoId__questoes__id');

  $$QuestoesTableProcessedTableManager get questaoId {
    final $_column = $_itemColumn<int>('questaoId')!;

    final manager = $$QuestoesTableTableManager(
      $_db,
      $_db.questoes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_questaoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RespostasAlunoTableFilterComposer
    extends Composer<_$AppDatabase, $RespostasAlunoTable> {
  $$RespostasAlunoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numeroQuestao => $composableBuilder(
    column: $table.numeroQuestao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get letrasMarcadas => $composableBuilder(
    column: $table.letrasMarcadas,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get letraCorreta => $composableBuilder(
    column: $table.letraCorreta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SituacaoQuestao, SituacaoQuestao, String>
  get situacao => $composableBuilder(
    column: $table.situacao,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$ResultadosTableFilterComposer get resultadoId {
    final $$ResultadosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.resultadoId,
      referencedTable: $db.resultados,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultadosTableFilterComposer(
            $db: $db,
            $table: $db.resultados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$QuestoesTableFilterComposer get questaoId {
    final $$QuestoesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questaoId,
      referencedTable: $db.questoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestoesTableFilterComposer(
            $db: $db,
            $table: $db.questoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RespostasAlunoTableOrderingComposer
    extends Composer<_$AppDatabase, $RespostasAlunoTable> {
  $$RespostasAlunoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numeroQuestao => $composableBuilder(
    column: $table.numeroQuestao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get letrasMarcadas => $composableBuilder(
    column: $table.letrasMarcadas,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get letraCorreta => $composableBuilder(
    column: $table.letraCorreta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get situacao => $composableBuilder(
    column: $table.situacao,
    builder: (column) => ColumnOrderings(column),
  );

  $$ResultadosTableOrderingComposer get resultadoId {
    final $$ResultadosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.resultadoId,
      referencedTable: $db.resultados,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultadosTableOrderingComposer(
            $db: $db,
            $table: $db.resultados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$QuestoesTableOrderingComposer get questaoId {
    final $$QuestoesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questaoId,
      referencedTable: $db.questoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestoesTableOrderingComposer(
            $db: $db,
            $table: $db.questoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RespostasAlunoTableAnnotationComposer
    extends Composer<_$AppDatabase, $RespostasAlunoTable> {
  $$RespostasAlunoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get numeroQuestao => $composableBuilder(
    column: $table.numeroQuestao,
    builder: (column) => column,
  );

  GeneratedColumn<String> get letrasMarcadas => $composableBuilder(
    column: $table.letrasMarcadas,
    builder: (column) => column,
  );

  GeneratedColumn<String> get letraCorreta => $composableBuilder(
    column: $table.letraCorreta,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<SituacaoQuestao, String> get situacao =>
      $composableBuilder(column: $table.situacao, builder: (column) => column);

  $$ResultadosTableAnnotationComposer get resultadoId {
    final $$ResultadosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.resultadoId,
      referencedTable: $db.resultados,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultadosTableAnnotationComposer(
            $db: $db,
            $table: $db.resultados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$QuestoesTableAnnotationComposer get questaoId {
    final $$QuestoesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questaoId,
      referencedTable: $db.questoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestoesTableAnnotationComposer(
            $db: $db,
            $table: $db.questoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RespostasAlunoTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RespostasAlunoTable,
          RespostaAlunoEntity,
          $$RespostasAlunoTableFilterComposer,
          $$RespostasAlunoTableOrderingComposer,
          $$RespostasAlunoTableAnnotationComposer,
          $$RespostasAlunoTableCreateCompanionBuilder,
          $$RespostasAlunoTableUpdateCompanionBuilder,
          (RespostaAlunoEntity, $$RespostasAlunoTableReferences),
          RespostaAlunoEntity,
          PrefetchHooks Function({bool resultadoId, bool questaoId})
        > {
  $$RespostasAlunoTableTableManager(
    _$AppDatabase db,
    $RespostasAlunoTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RespostasAlunoTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RespostasAlunoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RespostasAlunoTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> resultadoId = const Value.absent(),
                Value<int> questaoId = const Value.absent(),
                Value<int> numeroQuestao = const Value.absent(),
                Value<String> letrasMarcadas = const Value.absent(),
                Value<String> letraCorreta = const Value.absent(),
                Value<SituacaoQuestao> situacao = const Value.absent(),
              }) => RespostasAlunoCompanion(
                id: id,
                resultadoId: resultadoId,
                questaoId: questaoId,
                numeroQuestao: numeroQuestao,
                letrasMarcadas: letrasMarcadas,
                letraCorreta: letraCorreta,
                situacao: situacao,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int resultadoId,
                required int questaoId,
                required int numeroQuestao,
                required String letrasMarcadas,
                required String letraCorreta,
                required SituacaoQuestao situacao,
              }) => RespostasAlunoCompanion.insert(
                id: id,
                resultadoId: resultadoId,
                questaoId: questaoId,
                numeroQuestao: numeroQuestao,
                letrasMarcadas: letrasMarcadas,
                letraCorreta: letraCorreta,
                situacao: situacao,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RespostasAlunoTable, RespostaAlunoEntity>(table),
                  $$RespostasAlunoTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({resultadoId = false, questaoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (resultadoId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.resultadoId,
                        referencedTable: $$RespostasAlunoTableReferences
                            ._resultadoIdTable(db),
                        referencedColumn: $$RespostasAlunoTableReferences
                            ._resultadoIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (questaoId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.questaoId,
                        referencedTable: $$RespostasAlunoTableReferences
                            ._questaoIdTable(db),
                        referencedColumn: $$RespostasAlunoTableReferences
                            ._questaoIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RespostasAlunoTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RespostasAlunoTable,
      RespostaAlunoEntity,
      $$RespostasAlunoTableFilterComposer,
      $$RespostasAlunoTableOrderingComposer,
      $$RespostasAlunoTableAnnotationComposer,
      $$RespostasAlunoTableCreateCompanionBuilder,
      $$RespostasAlunoTableUpdateCompanionBuilder,
      (RespostaAlunoEntity, $$RespostasAlunoTableReferences),
      RespostaAlunoEntity,
      PrefetchHooks Function({bool resultadoId, bool questaoId})
    >;
typedef $$TurmasTableCreateCompanionBuilder = TurmasCompanion Function({
  Value<int> id,
  required String nome,
  Value<int> criadaEm,
});
typedef $$TurmasTableUpdateCompanionBuilder = TurmasCompanion Function({
  Value<int> id,
  Value<String> nome,
  Value<int> criadaEm,
});

class $$TurmasTableFilterComposer
    extends Composer<_$AppDatabase, $TurmasTable> {
  $$TurmasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get criadaEm => $composableBuilder(
    column: $table.criadaEm,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TurmasTableOrderingComposer
    extends Composer<_$AppDatabase, $TurmasTable> {
  $$TurmasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get criadaEm => $composableBuilder(
    column: $table.criadaEm,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TurmasTableAnnotationComposer
    extends Composer<_$AppDatabase, $TurmasTable> {
  $$TurmasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<int> get criadaEm =>
      $composableBuilder(column: $table.criadaEm, builder: (column) => column);
}

class $$TurmasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TurmasTable,
          TurmaEntity,
          $$TurmasTableFilterComposer,
          $$TurmasTableOrderingComposer,
          $$TurmasTableAnnotationComposer,
          $$TurmasTableCreateCompanionBuilder,
          $$TurmasTableUpdateCompanionBuilder,
          (
            TurmaEntity,
            BaseReferences<_$AppDatabase, $TurmasTable, TurmaEntity>,
          ),
          TurmaEntity,
          PrefetchHooks Function()
        > {
  $$TurmasTableTableManager(_$AppDatabase db, $TurmasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TurmasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TurmasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TurmasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nome = const Value.absent(),
            Value<int> criadaEm = const Value.absent(),
          }) => TurmasCompanion(id: id, nome: nome, criadaEm: criadaEm),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nome,
            Value<int> criadaEm = const Value.absent(),
          }) => TurmasCompanion.insert(id: id, nome: nome, criadaEm: criadaEm),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TurmasTable, TurmaEntity>(table),
                  BaseReferences<_$AppDatabase, $TurmasTable, TurmaEntity>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TurmasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TurmasTable,
      TurmaEntity,
      $$TurmasTableFilterComposer,
      $$TurmasTableOrderingComposer,
      $$TurmasTableAnnotationComposer,
      $$TurmasTableCreateCompanionBuilder,
      $$TurmasTableUpdateCompanionBuilder,
      (TurmaEntity, BaseReferences<_$AppDatabase, $TurmasTable, TurmaEntity>),
      TurmaEntity,
      PrefetchHooks Function()
    >;
typedef $$DisciplinasTableCreateCompanionBuilder =
    DisciplinasCompanion Function({
      Value<int> id,
      required String nome,
      Value<int> criadaEm,
    });
typedef $$DisciplinasTableUpdateCompanionBuilder =
    DisciplinasCompanion Function({
      Value<int> id,
      Value<String> nome,
      Value<int> criadaEm,
    });

class $$DisciplinasTableFilterComposer
    extends Composer<_$AppDatabase, $DisciplinasTable> {
  $$DisciplinasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get criadaEm => $composableBuilder(
    column: $table.criadaEm,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DisciplinasTableOrderingComposer
    extends Composer<_$AppDatabase, $DisciplinasTable> {
  $$DisciplinasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get criadaEm => $composableBuilder(
    column: $table.criadaEm,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DisciplinasTableAnnotationComposer
    extends Composer<_$AppDatabase, $DisciplinasTable> {
  $$DisciplinasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<int> get criadaEm =>
      $composableBuilder(column: $table.criadaEm, builder: (column) => column);
}

class $$DisciplinasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DisciplinasTable,
          DisciplinaEntity,
          $$DisciplinasTableFilterComposer,
          $$DisciplinasTableOrderingComposer,
          $$DisciplinasTableAnnotationComposer,
          $$DisciplinasTableCreateCompanionBuilder,
          $$DisciplinasTableUpdateCompanionBuilder,
          (
            DisciplinaEntity,
            BaseReferences<_$AppDatabase, $DisciplinasTable, DisciplinaEntity>,
          ),
          DisciplinaEntity,
          PrefetchHooks Function()
        > {
  $$DisciplinasTableTableManager(_$AppDatabase db, $DisciplinasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DisciplinasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DisciplinasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DisciplinasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nome = const Value.absent(),
            Value<int> criadaEm = const Value.absent(),
          }) => DisciplinasCompanion(id: id, nome: nome, criadaEm: criadaEm),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nome,
                Value<int> criadaEm = const Value.absent(),
              }) => DisciplinasCompanion.insert(
                id: id,
                nome: nome,
                criadaEm: criadaEm,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DisciplinasTable, DisciplinaEntity>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $DisciplinasTable,
                    DisciplinaEntity
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DisciplinasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DisciplinasTable,
      DisciplinaEntity,
      $$DisciplinasTableFilterComposer,
      $$DisciplinasTableOrderingComposer,
      $$DisciplinasTableAnnotationComposer,
      $$DisciplinasTableCreateCompanionBuilder,
      $$DisciplinasTableUpdateCompanionBuilder,
      (
        DisciplinaEntity,
        BaseReferences<_$AppDatabase, $DisciplinasTable, DisciplinaEntity>,
      ),
      DisciplinaEntity,
      PrefetchHooks Function()
    >;
typedef $$BancoQuestoesTableCreateCompanionBuilder =
    BancoQuestoesCompanion Function({
      Value<int> id,
      required String disciplina,
      required String enunciado,
      Value<int> criadaEm,
    });
typedef $$BancoQuestoesTableUpdateCompanionBuilder =
    BancoQuestoesCompanion Function({
      Value<int> id,
      Value<String> disciplina,
      Value<String> enunciado,
      Value<int> criadaEm,
    });

final class $$BancoQuestoesTableReferences
    extends
        BaseReferences<_$AppDatabase, $BancoQuestoesTable, BancoQuestaoEntity> {
  $$BancoQuestoesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $BancoAlternativasTable,
    List<BancoAlternativaEntity>
  >
  _bancoAlternativasRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.bancoAlternativas,
        aliasName: 'banco_questoes__id__banco_alternativas__bancoQuestaoId',
      );

  $$BancoAlternativasTableProcessedTableManager get bancoAlternativasRefs {
    final manager = $$BancoAlternativasTableTableManager(
      $_db,
      $_db.bancoAlternativas,
    ).filter((f) => f.bancoQuestaoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _bancoAlternativasRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BancoQuestoesTableFilterComposer
    extends Composer<_$AppDatabase, $BancoQuestoesTable> {
  $$BancoQuestoesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get disciplina => $composableBuilder(
    column: $table.disciplina,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get enunciado => $composableBuilder(
    column: $table.enunciado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get criadaEm => $composableBuilder(
    column: $table.criadaEm,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> bancoAlternativasRefs(
    Expression<bool> Function($$BancoAlternativasTableFilterComposer f) f,
  ) {
    final $$BancoAlternativasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bancoAlternativas,
      getReferencedColumn: (t) => t.bancoQuestaoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BancoAlternativasTableFilterComposer(
            $db: $db,
            $table: $db.bancoAlternativas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BancoQuestoesTableOrderingComposer
    extends Composer<_$AppDatabase, $BancoQuestoesTable> {
  $$BancoQuestoesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get disciplina => $composableBuilder(
    column: $table.disciplina,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get enunciado => $composableBuilder(
    column: $table.enunciado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get criadaEm => $composableBuilder(
    column: $table.criadaEm,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BancoQuestoesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BancoQuestoesTable> {
  $$BancoQuestoesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get disciplina => $composableBuilder(
    column: $table.disciplina,
    builder: (column) => column,
  );

  GeneratedColumn<String> get enunciado =>
      $composableBuilder(column: $table.enunciado, builder: (column) => column);

  GeneratedColumn<int> get criadaEm =>
      $composableBuilder(column: $table.criadaEm, builder: (column) => column);

  Expression<T> bancoAlternativasRefs<T extends Object>(
    Expression<T> Function($$BancoAlternativasTableAnnotationComposer a) f,
  ) {
    final $$BancoAlternativasTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.bancoAlternativas,
          getReferencedColumn: (t) => t.bancoQuestaoId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$BancoAlternativasTableAnnotationComposer(
                $db: $db,
                $table: $db.bancoAlternativas,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$BancoQuestoesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BancoQuestoesTable,
          BancoQuestaoEntity,
          $$BancoQuestoesTableFilterComposer,
          $$BancoQuestoesTableOrderingComposer,
          $$BancoQuestoesTableAnnotationComposer,
          $$BancoQuestoesTableCreateCompanionBuilder,
          $$BancoQuestoesTableUpdateCompanionBuilder,
          (BancoQuestaoEntity, $$BancoQuestoesTableReferences),
          BancoQuestaoEntity,
          PrefetchHooks Function({bool bancoAlternativasRefs})
        > {
  $$BancoQuestoesTableTableManager(_$AppDatabase db, $BancoQuestoesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BancoQuestoesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BancoQuestoesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BancoQuestoesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> disciplina = const Value.absent(),
                Value<String> enunciado = const Value.absent(),
                Value<int> criadaEm = const Value.absent(),
              }) => BancoQuestoesCompanion(
                id: id,
                disciplina: disciplina,
                enunciado: enunciado,
                criadaEm: criadaEm,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String disciplina,
                required String enunciado,
                Value<int> criadaEm = const Value.absent(),
              }) => BancoQuestoesCompanion.insert(
                id: id,
                disciplina: disciplina,
                enunciado: enunciado,
                criadaEm: criadaEm,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BancoQuestoesTable, BancoQuestaoEntity>(table),
                  $$BancoQuestoesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({bancoAlternativasRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (bancoAlternativasRefs) db.bancoAlternativas,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (bancoAlternativasRefs)
                    await $_getPrefetchedDataByColumns<
                      BancoQuestaoEntity,
                      $BancoQuestoesTable,
                      BancoAlternativaEntity,
                      $BancoAlternativasTable
                    >(
                      currentTable: table,
                      referencedTable: $$BancoQuestoesTableReferences
                          ._bancoAlternativasRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$BancoQuestoesTableReferences(
                            db,
                            table,
                            p0,
                          ).bancoAlternativasRefs,
                      currentColumn: 'id',
                      referencedColumn: 'bancoQuestaoId',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BancoQuestoesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BancoQuestoesTable,
      BancoQuestaoEntity,
      $$BancoQuestoesTableFilterComposer,
      $$BancoQuestoesTableOrderingComposer,
      $$BancoQuestoesTableAnnotationComposer,
      $$BancoQuestoesTableCreateCompanionBuilder,
      $$BancoQuestoesTableUpdateCompanionBuilder,
      (BancoQuestaoEntity, $$BancoQuestoesTableReferences),
      BancoQuestaoEntity,
      PrefetchHooks Function({bool bancoAlternativasRefs})
    >;
typedef $$BancoAlternativasTableCreateCompanionBuilder =
    BancoAlternativasCompanion Function({
      Value<int> id,
      required int bancoQuestaoId,
      required String texto,
      Value<bool> correta,
      required int ordem,
    });
typedef $$BancoAlternativasTableUpdateCompanionBuilder =
    BancoAlternativasCompanion Function({
      Value<int> id,
      Value<int> bancoQuestaoId,
      Value<String> texto,
      Value<bool> correta,
      Value<int> ordem,
    });

final class $$BancoAlternativasTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $BancoAlternativasTable,
          BancoAlternativaEntity
        > {
  $$BancoAlternativasTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BancoQuestoesTable _bancoQuestaoIdTable(_$AppDatabase db) => db
      .bancoQuestoes
      .createAlias('banco_alternativas__bancoQuestaoId__banco_questoes__id');

  $$BancoQuestoesTableProcessedTableManager get bancoQuestaoId {
    final $_column = $_itemColumn<int>('bancoQuestaoId')!;

    final manager = $$BancoQuestoesTableTableManager(
      $_db,
      $_db.bancoQuestoes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bancoQuestaoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BancoAlternativasTableFilterComposer
    extends Composer<_$AppDatabase, $BancoAlternativasTable> {
  $$BancoAlternativasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get texto => $composableBuilder(
    column: $table.texto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get correta => $composableBuilder(
    column: $table.correta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ordem => $composableBuilder(
    column: $table.ordem,
    builder: (column) => ColumnFilters(column),
  );

  $$BancoQuestoesTableFilterComposer get bancoQuestaoId {
    final $$BancoQuestoesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bancoQuestaoId,
      referencedTable: $db.bancoQuestoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BancoQuestoesTableFilterComposer(
            $db: $db,
            $table: $db.bancoQuestoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BancoAlternativasTableOrderingComposer
    extends Composer<_$AppDatabase, $BancoAlternativasTable> {
  $$BancoAlternativasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get texto => $composableBuilder(
    column: $table.texto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get correta => $composableBuilder(
    column: $table.correta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ordem => $composableBuilder(
    column: $table.ordem,
    builder: (column) => ColumnOrderings(column),
  );

  $$BancoQuestoesTableOrderingComposer get bancoQuestaoId {
    final $$BancoQuestoesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bancoQuestaoId,
      referencedTable: $db.bancoQuestoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BancoQuestoesTableOrderingComposer(
            $db: $db,
            $table: $db.bancoQuestoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BancoAlternativasTableAnnotationComposer
    extends Composer<_$AppDatabase, $BancoAlternativasTable> {
  $$BancoAlternativasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get texto =>
      $composableBuilder(column: $table.texto, builder: (column) => column);

  GeneratedColumn<bool> get correta =>
      $composableBuilder(column: $table.correta, builder: (column) => column);

  GeneratedColumn<int> get ordem =>
      $composableBuilder(column: $table.ordem, builder: (column) => column);

  $$BancoQuestoesTableAnnotationComposer get bancoQuestaoId {
    final $$BancoQuestoesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bancoQuestaoId,
      referencedTable: $db.bancoQuestoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BancoQuestoesTableAnnotationComposer(
            $db: $db,
            $table: $db.bancoQuestoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BancoAlternativasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BancoAlternativasTable,
          BancoAlternativaEntity,
          $$BancoAlternativasTableFilterComposer,
          $$BancoAlternativasTableOrderingComposer,
          $$BancoAlternativasTableAnnotationComposer,
          $$BancoAlternativasTableCreateCompanionBuilder,
          $$BancoAlternativasTableUpdateCompanionBuilder,
          (BancoAlternativaEntity, $$BancoAlternativasTableReferences),
          BancoAlternativaEntity,
          PrefetchHooks Function({bool bancoQuestaoId})
        > {
  $$BancoAlternativasTableTableManager(
    _$AppDatabase db,
    $BancoAlternativasTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BancoAlternativasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BancoAlternativasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BancoAlternativasTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> bancoQuestaoId = const Value.absent(),
                Value<String> texto = const Value.absent(),
                Value<bool> correta = const Value.absent(),
                Value<int> ordem = const Value.absent(),
              }) => BancoAlternativasCompanion(
                id: id,
                bancoQuestaoId: bancoQuestaoId,
                texto: texto,
                correta: correta,
                ordem: ordem,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int bancoQuestaoId,
                required String texto,
                Value<bool> correta = const Value.absent(),
                required int ordem,
              }) => BancoAlternativasCompanion.insert(
                id: id,
                bancoQuestaoId: bancoQuestaoId,
                texto: texto,
                correta: correta,
                ordem: ordem,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BancoAlternativasTable, BancoAlternativaEntity>(
                    table,
                  ),
                  $$BancoAlternativasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({bancoQuestaoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (bancoQuestaoId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.bancoQuestaoId,
                        referencedTable: $$BancoAlternativasTableReferences
                            ._bancoQuestaoIdTable(db),
                        referencedColumn: $$BancoAlternativasTableReferences
                            ._bancoQuestaoIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BancoAlternativasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BancoAlternativasTable,
      BancoAlternativaEntity,
      $$BancoAlternativasTableFilterComposer,
      $$BancoAlternativasTableOrderingComposer,
      $$BancoAlternativasTableAnnotationComposer,
      $$BancoAlternativasTableCreateCompanionBuilder,
      $$BancoAlternativasTableUpdateCompanionBuilder,
      (BancoAlternativaEntity, $$BancoAlternativasTableReferences),
      BancoAlternativaEntity,
      PrefetchHooks Function({bool bancoQuestaoId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProvasTableTableManager get provas =>
      $$ProvasTableTableManager(_db, _db.provas);
  $$QuestoesTableTableManager get questoes =>
      $$QuestoesTableTableManager(_db, _db.questoes);
  $$AlternativasTableTableManager get alternativas =>
      $$AlternativasTableTableManager(_db, _db.alternativas);
  $$AlunosTableTableManager get alunos =>
      $$AlunosTableTableManager(_db, _db.alunos);
  $$ResultadosTableTableManager get resultados =>
      $$ResultadosTableTableManager(_db, _db.resultados);
  $$RespostasAlunoTableTableManager get respostasAluno =>
      $$RespostasAlunoTableTableManager(_db, _db.respostasAluno);
  $$TurmasTableTableManager get turmas =>
      $$TurmasTableTableManager(_db, _db.turmas);
  $$DisciplinasTableTableManager get disciplinas =>
      $$DisciplinasTableTableManager(_db, _db.disciplinas);
  $$BancoQuestoesTableTableManager get bancoQuestoes =>
      $$BancoQuestoesTableTableManager(_db, _db.bancoQuestoes);
  $$BancoAlternativasTableTableManager get bancoAlternativas =>
      $$BancoAlternativasTableTableManager(_db, _db.bancoAlternativas);
}
