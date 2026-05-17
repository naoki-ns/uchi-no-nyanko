// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CatsTable extends Cats with TableInfo<$CatsTable, CatRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _coatColorMeta = const VerificationMeta(
    'coatColor',
  );
  @override
  late final GeneratedColumn<String> coatColor = GeneratedColumn<String>(
    'coat_color',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eyeColorMeta = const VerificationMeta(
    'eyeColor',
  );
  @override
  late final GeneratedColumn<String> eyeColor = GeneratedColumn<String>(
    'eye_color',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sociabilityMeta = const VerificationMeta(
    'sociability',
  );
  @override
  late final GeneratedColumn<double> sociability = GeneratedColumn<double>(
    'sociability',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _energyMeta = const VerificationMeta('energy');
  @override
  late final GeneratedColumn<double> energy = GeneratedColumn<double>(
    'energy',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _affectionMeta = const VerificationMeta(
    'affection',
  );
  @override
  late final GeneratedColumn<double> affection = GeneratedColumn<double>(
    'affection',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _curiosityMeta = const VerificationMeta(
    'curiosity',
  );
  @override
  late final GeneratedColumn<double> curiosity = GeneratedColumn<double>(
    'curiosity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  @override
  late final GeneratedColumn<double> mood = GeneratedColumn<double>(
    'mood',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.5),
  );
  static const VerificationMeta _healthMeta = const VerificationMeta('health');
  @override
  late final GeneratedColumn<double> health = GeneratedColumn<double>(
    'health',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _bondMeta = const VerificationMeta('bond');
  @override
  late final GeneratedColumn<int> bond = GeneratedColumn<int>(
    'bond',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _birthDateMeta = const VerificationMeta(
    'birthDate',
  );
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
    'birth_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parentIdsMeta = const VerificationMeta(
    'parentIds',
  );
  @override
  late final GeneratedColumn<String> parentIds = GeneratedColumn<String>(
    'parent_ids',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    coatColor,
    eyeColor,
    sociability,
    energy,
    affection,
    curiosity,
    mood,
    health,
    bond,
    birthDate,
    parentIds,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cats';
  @override
  VerificationContext validateIntegrity(
    Insertable<CatRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('coat_color')) {
      context.handle(
        _coatColorMeta,
        coatColor.isAcceptableOrUnknown(data['coat_color']!, _coatColorMeta),
      );
    } else if (isInserting) {
      context.missing(_coatColorMeta);
    }
    if (data.containsKey('eye_color')) {
      context.handle(
        _eyeColorMeta,
        eyeColor.isAcceptableOrUnknown(data['eye_color']!, _eyeColorMeta),
      );
    } else if (isInserting) {
      context.missing(_eyeColorMeta);
    }
    if (data.containsKey('sociability')) {
      context.handle(
        _sociabilityMeta,
        sociability.isAcceptableOrUnknown(
          data['sociability']!,
          _sociabilityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sociabilityMeta);
    }
    if (data.containsKey('energy')) {
      context.handle(
        _energyMeta,
        energy.isAcceptableOrUnknown(data['energy']!, _energyMeta),
      );
    } else if (isInserting) {
      context.missing(_energyMeta);
    }
    if (data.containsKey('affection')) {
      context.handle(
        _affectionMeta,
        affection.isAcceptableOrUnknown(data['affection']!, _affectionMeta),
      );
    } else if (isInserting) {
      context.missing(_affectionMeta);
    }
    if (data.containsKey('curiosity')) {
      context.handle(
        _curiosityMeta,
        curiosity.isAcceptableOrUnknown(data['curiosity']!, _curiosityMeta),
      );
    } else if (isInserting) {
      context.missing(_curiosityMeta);
    }
    if (data.containsKey('mood')) {
      context.handle(
        _moodMeta,
        mood.isAcceptableOrUnknown(data['mood']!, _moodMeta),
      );
    }
    if (data.containsKey('health')) {
      context.handle(
        _healthMeta,
        health.isAcceptableOrUnknown(data['health']!, _healthMeta),
      );
    }
    if (data.containsKey('bond')) {
      context.handle(
        _bondMeta,
        bond.isAcceptableOrUnknown(data['bond']!, _bondMeta),
      );
    }
    if (data.containsKey('birth_date')) {
      context.handle(
        _birthDateMeta,
        birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta),
      );
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    if (data.containsKey('parent_ids')) {
      context.handle(
        _parentIdsMeta,
        parentIds.isAcceptableOrUnknown(data['parent_ids']!, _parentIdsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CatRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CatRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      coatColor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}coat_color'],
      )!,
      eyeColor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}eye_color'],
      )!,
      sociability: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sociability'],
      )!,
      energy: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}energy'],
      )!,
      affection: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}affection'],
      )!,
      curiosity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}curiosity'],
      )!,
      mood: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mood'],
      )!,
      health: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}health'],
      )!,
      bond: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bond'],
      )!,
      birthDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birth_date'],
      )!,
      parentIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_ids'],
      ),
    );
  }

  @override
  $CatsTable createAlias(String alias) {
    return $CatsTable(attachedDatabase, alias);
  }
}

class CatRow extends DataClass implements Insertable<CatRow> {
  final String id;
  final String name;
  final String coatColor;
  final String eyeColor;
  final double sociability;
  final double energy;
  final double affection;
  final double curiosity;
  final double mood;
  final double health;
  final int bond;
  final DateTime birthDate;
  final String? parentIds;
  const CatRow({
    required this.id,
    required this.name,
    required this.coatColor,
    required this.eyeColor,
    required this.sociability,
    required this.energy,
    required this.affection,
    required this.curiosity,
    required this.mood,
    required this.health,
    required this.bond,
    required this.birthDate,
    this.parentIds,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['coat_color'] = Variable<String>(coatColor);
    map['eye_color'] = Variable<String>(eyeColor);
    map['sociability'] = Variable<double>(sociability);
    map['energy'] = Variable<double>(energy);
    map['affection'] = Variable<double>(affection);
    map['curiosity'] = Variable<double>(curiosity);
    map['mood'] = Variable<double>(mood);
    map['health'] = Variable<double>(health);
    map['bond'] = Variable<int>(bond);
    map['birth_date'] = Variable<DateTime>(birthDate);
    if (!nullToAbsent || parentIds != null) {
      map['parent_ids'] = Variable<String>(parentIds);
    }
    return map;
  }

  CatsCompanion toCompanion(bool nullToAbsent) {
    return CatsCompanion(
      id: Value(id),
      name: Value(name),
      coatColor: Value(coatColor),
      eyeColor: Value(eyeColor),
      sociability: Value(sociability),
      energy: Value(energy),
      affection: Value(affection),
      curiosity: Value(curiosity),
      mood: Value(mood),
      health: Value(health),
      bond: Value(bond),
      birthDate: Value(birthDate),
      parentIds: parentIds == null && nullToAbsent
          ? const Value.absent()
          : Value(parentIds),
    );
  }

  factory CatRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CatRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      coatColor: serializer.fromJson<String>(json['coatColor']),
      eyeColor: serializer.fromJson<String>(json['eyeColor']),
      sociability: serializer.fromJson<double>(json['sociability']),
      energy: serializer.fromJson<double>(json['energy']),
      affection: serializer.fromJson<double>(json['affection']),
      curiosity: serializer.fromJson<double>(json['curiosity']),
      mood: serializer.fromJson<double>(json['mood']),
      health: serializer.fromJson<double>(json['health']),
      bond: serializer.fromJson<int>(json['bond']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
      parentIds: serializer.fromJson<String?>(json['parentIds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'coatColor': serializer.toJson<String>(coatColor),
      'eyeColor': serializer.toJson<String>(eyeColor),
      'sociability': serializer.toJson<double>(sociability),
      'energy': serializer.toJson<double>(energy),
      'affection': serializer.toJson<double>(affection),
      'curiosity': serializer.toJson<double>(curiosity),
      'mood': serializer.toJson<double>(mood),
      'health': serializer.toJson<double>(health),
      'bond': serializer.toJson<int>(bond),
      'birthDate': serializer.toJson<DateTime>(birthDate),
      'parentIds': serializer.toJson<String?>(parentIds),
    };
  }

  CatRow copyWith({
    String? id,
    String? name,
    String? coatColor,
    String? eyeColor,
    double? sociability,
    double? energy,
    double? affection,
    double? curiosity,
    double? mood,
    double? health,
    int? bond,
    DateTime? birthDate,
    Value<String?> parentIds = const Value.absent(),
  }) => CatRow(
    id: id ?? this.id,
    name: name ?? this.name,
    coatColor: coatColor ?? this.coatColor,
    eyeColor: eyeColor ?? this.eyeColor,
    sociability: sociability ?? this.sociability,
    energy: energy ?? this.energy,
    affection: affection ?? this.affection,
    curiosity: curiosity ?? this.curiosity,
    mood: mood ?? this.mood,
    health: health ?? this.health,
    bond: bond ?? this.bond,
    birthDate: birthDate ?? this.birthDate,
    parentIds: parentIds.present ? parentIds.value : this.parentIds,
  );
  CatRow copyWithCompanion(CatsCompanion data) {
    return CatRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      coatColor: data.coatColor.present ? data.coatColor.value : this.coatColor,
      eyeColor: data.eyeColor.present ? data.eyeColor.value : this.eyeColor,
      sociability: data.sociability.present
          ? data.sociability.value
          : this.sociability,
      energy: data.energy.present ? data.energy.value : this.energy,
      affection: data.affection.present ? data.affection.value : this.affection,
      curiosity: data.curiosity.present ? data.curiosity.value : this.curiosity,
      mood: data.mood.present ? data.mood.value : this.mood,
      health: data.health.present ? data.health.value : this.health,
      bond: data.bond.present ? data.bond.value : this.bond,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      parentIds: data.parentIds.present ? data.parentIds.value : this.parentIds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CatRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('coatColor: $coatColor, ')
          ..write('eyeColor: $eyeColor, ')
          ..write('sociability: $sociability, ')
          ..write('energy: $energy, ')
          ..write('affection: $affection, ')
          ..write('curiosity: $curiosity, ')
          ..write('mood: $mood, ')
          ..write('health: $health, ')
          ..write('bond: $bond, ')
          ..write('birthDate: $birthDate, ')
          ..write('parentIds: $parentIds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    coatColor,
    eyeColor,
    sociability,
    energy,
    affection,
    curiosity,
    mood,
    health,
    bond,
    birthDate,
    parentIds,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CatRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.coatColor == this.coatColor &&
          other.eyeColor == this.eyeColor &&
          other.sociability == this.sociability &&
          other.energy == this.energy &&
          other.affection == this.affection &&
          other.curiosity == this.curiosity &&
          other.mood == this.mood &&
          other.health == this.health &&
          other.bond == this.bond &&
          other.birthDate == this.birthDate &&
          other.parentIds == this.parentIds);
}

class CatsCompanion extends UpdateCompanion<CatRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> coatColor;
  final Value<String> eyeColor;
  final Value<double> sociability;
  final Value<double> energy;
  final Value<double> affection;
  final Value<double> curiosity;
  final Value<double> mood;
  final Value<double> health;
  final Value<int> bond;
  final Value<DateTime> birthDate;
  final Value<String?> parentIds;
  final Value<int> rowid;
  const CatsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.coatColor = const Value.absent(),
    this.eyeColor = const Value.absent(),
    this.sociability = const Value.absent(),
    this.energy = const Value.absent(),
    this.affection = const Value.absent(),
    this.curiosity = const Value.absent(),
    this.mood = const Value.absent(),
    this.health = const Value.absent(),
    this.bond = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.parentIds = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CatsCompanion.insert({
    required String id,
    required String name,
    required String coatColor,
    required String eyeColor,
    required double sociability,
    required double energy,
    required double affection,
    required double curiosity,
    this.mood = const Value.absent(),
    this.health = const Value.absent(),
    this.bond = const Value.absent(),
    required DateTime birthDate,
    this.parentIds = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       coatColor = Value(coatColor),
       eyeColor = Value(eyeColor),
       sociability = Value(sociability),
       energy = Value(energy),
       affection = Value(affection),
       curiosity = Value(curiosity),
       birthDate = Value(birthDate);
  static Insertable<CatRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? coatColor,
    Expression<String>? eyeColor,
    Expression<double>? sociability,
    Expression<double>? energy,
    Expression<double>? affection,
    Expression<double>? curiosity,
    Expression<double>? mood,
    Expression<double>? health,
    Expression<int>? bond,
    Expression<DateTime>? birthDate,
    Expression<String>? parentIds,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (coatColor != null) 'coat_color': coatColor,
      if (eyeColor != null) 'eye_color': eyeColor,
      if (sociability != null) 'sociability': sociability,
      if (energy != null) 'energy': energy,
      if (affection != null) 'affection': affection,
      if (curiosity != null) 'curiosity': curiosity,
      if (mood != null) 'mood': mood,
      if (health != null) 'health': health,
      if (bond != null) 'bond': bond,
      if (birthDate != null) 'birth_date': birthDate,
      if (parentIds != null) 'parent_ids': parentIds,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CatsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? coatColor,
    Value<String>? eyeColor,
    Value<double>? sociability,
    Value<double>? energy,
    Value<double>? affection,
    Value<double>? curiosity,
    Value<double>? mood,
    Value<double>? health,
    Value<int>? bond,
    Value<DateTime>? birthDate,
    Value<String?>? parentIds,
    Value<int>? rowid,
  }) {
    return CatsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      coatColor: coatColor ?? this.coatColor,
      eyeColor: eyeColor ?? this.eyeColor,
      sociability: sociability ?? this.sociability,
      energy: energy ?? this.energy,
      affection: affection ?? this.affection,
      curiosity: curiosity ?? this.curiosity,
      mood: mood ?? this.mood,
      health: health ?? this.health,
      bond: bond ?? this.bond,
      birthDate: birthDate ?? this.birthDate,
      parentIds: parentIds ?? this.parentIds,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (coatColor.present) {
      map['coat_color'] = Variable<String>(coatColor.value);
    }
    if (eyeColor.present) {
      map['eye_color'] = Variable<String>(eyeColor.value);
    }
    if (sociability.present) {
      map['sociability'] = Variable<double>(sociability.value);
    }
    if (energy.present) {
      map['energy'] = Variable<double>(energy.value);
    }
    if (affection.present) {
      map['affection'] = Variable<double>(affection.value);
    }
    if (curiosity.present) {
      map['curiosity'] = Variable<double>(curiosity.value);
    }
    if (mood.present) {
      map['mood'] = Variable<double>(mood.value);
    }
    if (health.present) {
      map['health'] = Variable<double>(health.value);
    }
    if (bond.present) {
      map['bond'] = Variable<int>(bond.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (parentIds.present) {
      map['parent_ids'] = Variable<String>(parentIds.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CatsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('coatColor: $coatColor, ')
          ..write('eyeColor: $eyeColor, ')
          ..write('sociability: $sociability, ')
          ..write('energy: $energy, ')
          ..write('affection: $affection, ')
          ..write('curiosity: $curiosity, ')
          ..write('mood: $mood, ')
          ..write('health: $health, ')
          ..write('bond: $bond, ')
          ..write('birthDate: $birthDate, ')
          ..write('parentIds: $parentIds, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InteractionsTable extends Interactions
    with TableInfo<$InteractionsTable, InteractionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InteractionsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _catIdMeta = const VerificationMeta('catId');
  @override
  late final GeneratedColumn<String> catId = GeneratedColumn<String>(
    'cat_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cats (id)',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, catId, type, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'interactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<InteractionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cat_id')) {
      context.handle(
        _catIdMeta,
        catId.isAcceptableOrUnknown(data['cat_id']!, _catIdMeta),
      );
    } else if (isInserting) {
      context.missing(_catIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InteractionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InteractionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      catId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cat_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $InteractionsTable createAlias(String alias) {
    return $InteractionsTable(attachedDatabase, alias);
  }
}

class InteractionRow extends DataClass implements Insertable<InteractionRow> {
  final int id;
  final String catId;
  final String type;
  final DateTime timestamp;
  const InteractionRow({
    required this.id,
    required this.catId,
    required this.type,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cat_id'] = Variable<String>(catId);
    map['type'] = Variable<String>(type);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  InteractionsCompanion toCompanion(bool nullToAbsent) {
    return InteractionsCompanion(
      id: Value(id),
      catId: Value(catId),
      type: Value(type),
      timestamp: Value(timestamp),
    );
  }

  factory InteractionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InteractionRow(
      id: serializer.fromJson<int>(json['id']),
      catId: serializer.fromJson<String>(json['catId']),
      type: serializer.fromJson<String>(json['type']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'catId': serializer.toJson<String>(catId),
      'type': serializer.toJson<String>(type),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  InteractionRow copyWith({
    int? id,
    String? catId,
    String? type,
    DateTime? timestamp,
  }) => InteractionRow(
    id: id ?? this.id,
    catId: catId ?? this.catId,
    type: type ?? this.type,
    timestamp: timestamp ?? this.timestamp,
  );
  InteractionRow copyWithCompanion(InteractionsCompanion data) {
    return InteractionRow(
      id: data.id.present ? data.id.value : this.id,
      catId: data.catId.present ? data.catId.value : this.catId,
      type: data.type.present ? data.type.value : this.type,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InteractionRow(')
          ..write('id: $id, ')
          ..write('catId: $catId, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, catId, type, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InteractionRow &&
          other.id == this.id &&
          other.catId == this.catId &&
          other.type == this.type &&
          other.timestamp == this.timestamp);
}

class InteractionsCompanion extends UpdateCompanion<InteractionRow> {
  final Value<int> id;
  final Value<String> catId;
  final Value<String> type;
  final Value<DateTime> timestamp;
  const InteractionsCompanion({
    this.id = const Value.absent(),
    this.catId = const Value.absent(),
    this.type = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  InteractionsCompanion.insert({
    this.id = const Value.absent(),
    required String catId,
    required String type,
    required DateTime timestamp,
  }) : catId = Value(catId),
       type = Value(type),
       timestamp = Value(timestamp);
  static Insertable<InteractionRow> custom({
    Expression<int>? id,
    Expression<String>? catId,
    Expression<String>? type,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (catId != null) 'cat_id': catId,
      if (type != null) 'type': type,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  InteractionsCompanion copyWith({
    Value<int>? id,
    Value<String>? catId,
    Value<String>? type,
    Value<DateTime>? timestamp,
  }) {
    return InteractionsCompanion(
      id: id ?? this.id,
      catId: catId ?? this.catId,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (catId.present) {
      map['cat_id'] = Variable<String>(catId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InteractionsCompanion(')
          ..write('id: $id, ')
          ..write('catId: $catId, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $RoomItemsTable extends RoomItems
    with TableInfo<$RoomItemsTable, RoomItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _itemTypeMeta = const VerificationMeta(
    'itemType',
  );
  @override
  late final GeneratedColumn<String> itemType = GeneratedColumn<String>(
    'item_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _posXMeta = const VerificationMeta('posX');
  @override
  late final GeneratedColumn<double> posX = GeneratedColumn<double>(
    'pos_x',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _posYMeta = const VerificationMeta('posY');
  @override
  late final GeneratedColumn<double> posY = GeneratedColumn<double>(
    'pos_y',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isUnlockedMeta = const VerificationMeta(
    'isUnlocked',
  );
  @override
  late final GeneratedColumn<bool> isUnlocked = GeneratedColumn<bool>(
    'is_unlocked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_unlocked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, itemType, posX, posY, isUnlocked];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoomItemRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_type')) {
      context.handle(
        _itemTypeMeta,
        itemType.isAcceptableOrUnknown(data['item_type']!, _itemTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_itemTypeMeta);
    }
    if (data.containsKey('pos_x')) {
      context.handle(
        _posXMeta,
        posX.isAcceptableOrUnknown(data['pos_x']!, _posXMeta),
      );
    } else if (isInserting) {
      context.missing(_posXMeta);
    }
    if (data.containsKey('pos_y')) {
      context.handle(
        _posYMeta,
        posY.isAcceptableOrUnknown(data['pos_y']!, _posYMeta),
      );
    } else if (isInserting) {
      context.missing(_posYMeta);
    }
    if (data.containsKey('is_unlocked')) {
      context.handle(
        _isUnlockedMeta,
        isUnlocked.isAcceptableOrUnknown(data['is_unlocked']!, _isUnlockedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomItemRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      itemType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_type'],
      )!,
      posX: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pos_x'],
      )!,
      posY: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pos_y'],
      )!,
      isUnlocked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_unlocked'],
      )!,
    );
  }

  @override
  $RoomItemsTable createAlias(String alias) {
    return $RoomItemsTable(attachedDatabase, alias);
  }
}

class RoomItemRow extends DataClass implements Insertable<RoomItemRow> {
  final int id;
  final String itemType;
  final double posX;
  final double posY;
  final bool isUnlocked;
  const RoomItemRow({
    required this.id,
    required this.itemType,
    required this.posX,
    required this.posY,
    required this.isUnlocked,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_type'] = Variable<String>(itemType);
    map['pos_x'] = Variable<double>(posX);
    map['pos_y'] = Variable<double>(posY);
    map['is_unlocked'] = Variable<bool>(isUnlocked);
    return map;
  }

  RoomItemsCompanion toCompanion(bool nullToAbsent) {
    return RoomItemsCompanion(
      id: Value(id),
      itemType: Value(itemType),
      posX: Value(posX),
      posY: Value(posY),
      isUnlocked: Value(isUnlocked),
    );
  }

  factory RoomItemRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomItemRow(
      id: serializer.fromJson<int>(json['id']),
      itemType: serializer.fromJson<String>(json['itemType']),
      posX: serializer.fromJson<double>(json['posX']),
      posY: serializer.fromJson<double>(json['posY']),
      isUnlocked: serializer.fromJson<bool>(json['isUnlocked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemType': serializer.toJson<String>(itemType),
      'posX': serializer.toJson<double>(posX),
      'posY': serializer.toJson<double>(posY),
      'isUnlocked': serializer.toJson<bool>(isUnlocked),
    };
  }

  RoomItemRow copyWith({
    int? id,
    String? itemType,
    double? posX,
    double? posY,
    bool? isUnlocked,
  }) => RoomItemRow(
    id: id ?? this.id,
    itemType: itemType ?? this.itemType,
    posX: posX ?? this.posX,
    posY: posY ?? this.posY,
    isUnlocked: isUnlocked ?? this.isUnlocked,
  );
  RoomItemRow copyWithCompanion(RoomItemsCompanion data) {
    return RoomItemRow(
      id: data.id.present ? data.id.value : this.id,
      itemType: data.itemType.present ? data.itemType.value : this.itemType,
      posX: data.posX.present ? data.posX.value : this.posX,
      posY: data.posY.present ? data.posY.value : this.posY,
      isUnlocked: data.isUnlocked.present
          ? data.isUnlocked.value
          : this.isUnlocked,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomItemRow(')
          ..write('id: $id, ')
          ..write('itemType: $itemType, ')
          ..write('posX: $posX, ')
          ..write('posY: $posY, ')
          ..write('isUnlocked: $isUnlocked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemType, posX, posY, isUnlocked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomItemRow &&
          other.id == this.id &&
          other.itemType == this.itemType &&
          other.posX == this.posX &&
          other.posY == this.posY &&
          other.isUnlocked == this.isUnlocked);
}

class RoomItemsCompanion extends UpdateCompanion<RoomItemRow> {
  final Value<int> id;
  final Value<String> itemType;
  final Value<double> posX;
  final Value<double> posY;
  final Value<bool> isUnlocked;
  const RoomItemsCompanion({
    this.id = const Value.absent(),
    this.itemType = const Value.absent(),
    this.posX = const Value.absent(),
    this.posY = const Value.absent(),
    this.isUnlocked = const Value.absent(),
  });
  RoomItemsCompanion.insert({
    this.id = const Value.absent(),
    required String itemType,
    required double posX,
    required double posY,
    this.isUnlocked = const Value.absent(),
  }) : itemType = Value(itemType),
       posX = Value(posX),
       posY = Value(posY);
  static Insertable<RoomItemRow> custom({
    Expression<int>? id,
    Expression<String>? itemType,
    Expression<double>? posX,
    Expression<double>? posY,
    Expression<bool>? isUnlocked,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemType != null) 'item_type': itemType,
      if (posX != null) 'pos_x': posX,
      if (posY != null) 'pos_y': posY,
      if (isUnlocked != null) 'is_unlocked': isUnlocked,
    });
  }

  RoomItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? itemType,
    Value<double>? posX,
    Value<double>? posY,
    Value<bool>? isUnlocked,
  }) {
    return RoomItemsCompanion(
      id: id ?? this.id,
      itemType: itemType ?? this.itemType,
      posX: posX ?? this.posX,
      posY: posY ?? this.posY,
      isUnlocked: isUnlocked ?? this.isUnlocked,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemType.present) {
      map['item_type'] = Variable<String>(itemType.value);
    }
    if (posX.present) {
      map['pos_x'] = Variable<double>(posX.value);
    }
    if (posY.present) {
      map['pos_y'] = Variable<double>(posY.value);
    }
    if (isUnlocked.present) {
      map['is_unlocked'] = Variable<bool>(isUnlocked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomItemsCompanion(')
          ..write('id: $id, ')
          ..write('itemType: $itemType, ')
          ..write('posX: $posX, ')
          ..write('posY: $posY, ')
          ..write('isUnlocked: $isUnlocked')
          ..write(')'))
        .toString();
  }
}

class $PlayerStatsTable extends PlayerStats
    with TableInfo<$PlayerStatsTable, PlayerStatsRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayerStatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coinsMeta = const VerificationMeta('coins');
  @override
  late final GeneratedColumn<int> coins = GeneratedColumn<int>(
    'coins',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastLoginDateMeta = const VerificationMeta(
    'lastLoginDate',
  );
  @override
  late final GeneratedColumn<String> lastLoginDate = GeneratedColumn<String>(
    'last_login_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wallpaperIdMeta = const VerificationMeta(
    'wallpaperId',
  );
  @override
  late final GeneratedColumn<String> wallpaperId = GeneratedColumn<String>(
    'wallpaper_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, coins, lastLoginDate, wallpaperId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'player_stats';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlayerStatsRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('coins')) {
      context.handle(
        _coinsMeta,
        coins.isAcceptableOrUnknown(data['coins']!, _coinsMeta),
      );
    }
    if (data.containsKey('last_login_date')) {
      context.handle(
        _lastLoginDateMeta,
        lastLoginDate.isAcceptableOrUnknown(
          data['last_login_date']!,
          _lastLoginDateMeta,
        ),
      );
    }
    if (data.containsKey('wallpaper_id')) {
      context.handle(
        _wallpaperIdMeta,
        wallpaperId.isAcceptableOrUnknown(
          data['wallpaper_id']!,
          _wallpaperIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlayerStatsRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlayerStatsRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      coins: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}coins'],
      )!,
      lastLoginDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_login_date'],
      ),
      wallpaperId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wallpaper_id'],
      ),
    );
  }

  @override
  $PlayerStatsTable createAlias(String alias) {
    return $PlayerStatsTable(attachedDatabase, alias);
  }
}

class PlayerStatsRow extends DataClass implements Insertable<PlayerStatsRow> {
  final int id;
  final int coins;
  final String? lastLoginDate;
  final String? wallpaperId;
  const PlayerStatsRow({
    required this.id,
    required this.coins,
    this.lastLoginDate,
    this.wallpaperId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['coins'] = Variable<int>(coins);
    if (!nullToAbsent || lastLoginDate != null) {
      map['last_login_date'] = Variable<String>(lastLoginDate);
    }
    if (!nullToAbsent || wallpaperId != null) {
      map['wallpaper_id'] = Variable<String>(wallpaperId);
    }
    return map;
  }

  PlayerStatsCompanion toCompanion(bool nullToAbsent) {
    return PlayerStatsCompanion(
      id: Value(id),
      coins: Value(coins),
      lastLoginDate: lastLoginDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastLoginDate),
      wallpaperId: wallpaperId == null && nullToAbsent
          ? const Value.absent()
          : Value(wallpaperId),
    );
  }

  factory PlayerStatsRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayerStatsRow(
      id: serializer.fromJson<int>(json['id']),
      coins: serializer.fromJson<int>(json['coins']),
      lastLoginDate: serializer.fromJson<String?>(json['lastLoginDate']),
      wallpaperId: serializer.fromJson<String?>(json['wallpaperId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'coins': serializer.toJson<int>(coins),
      'lastLoginDate': serializer.toJson<String?>(lastLoginDate),
      'wallpaperId': serializer.toJson<String?>(wallpaperId),
    };
  }

  PlayerStatsRow copyWith({
    int? id,
    int? coins,
    Value<String?> lastLoginDate = const Value.absent(),
    Value<String?> wallpaperId = const Value.absent(),
  }) => PlayerStatsRow(
    id: id ?? this.id,
    coins: coins ?? this.coins,
    lastLoginDate: lastLoginDate.present
        ? lastLoginDate.value
        : this.lastLoginDate,
    wallpaperId: wallpaperId.present ? wallpaperId.value : this.wallpaperId,
  );
  PlayerStatsRow copyWithCompanion(PlayerStatsCompanion data) {
    return PlayerStatsRow(
      id: data.id.present ? data.id.value : this.id,
      coins: data.coins.present ? data.coins.value : this.coins,
      lastLoginDate: data.lastLoginDate.present
          ? data.lastLoginDate.value
          : this.lastLoginDate,
      wallpaperId: data.wallpaperId.present
          ? data.wallpaperId.value
          : this.wallpaperId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlayerStatsRow(')
          ..write('id: $id, ')
          ..write('coins: $coins, ')
          ..write('lastLoginDate: $lastLoginDate, ')
          ..write('wallpaperId: $wallpaperId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, coins, lastLoginDate, wallpaperId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerStatsRow &&
          other.id == this.id &&
          other.coins == this.coins &&
          other.lastLoginDate == this.lastLoginDate &&
          other.wallpaperId == this.wallpaperId);
}

class PlayerStatsCompanion extends UpdateCompanion<PlayerStatsRow> {
  final Value<int> id;
  final Value<int> coins;
  final Value<String?> lastLoginDate;
  final Value<String?> wallpaperId;
  const PlayerStatsCompanion({
    this.id = const Value.absent(),
    this.coins = const Value.absent(),
    this.lastLoginDate = const Value.absent(),
    this.wallpaperId = const Value.absent(),
  });
  PlayerStatsCompanion.insert({
    this.id = const Value.absent(),
    this.coins = const Value.absent(),
    this.lastLoginDate = const Value.absent(),
    this.wallpaperId = const Value.absent(),
  });
  static Insertable<PlayerStatsRow> custom({
    Expression<int>? id,
    Expression<int>? coins,
    Expression<String>? lastLoginDate,
    Expression<String>? wallpaperId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (coins != null) 'coins': coins,
      if (lastLoginDate != null) 'last_login_date': lastLoginDate,
      if (wallpaperId != null) 'wallpaper_id': wallpaperId,
    });
  }

  PlayerStatsCompanion copyWith({
    Value<int>? id,
    Value<int>? coins,
    Value<String?>? lastLoginDate,
    Value<String?>? wallpaperId,
  }) {
    return PlayerStatsCompanion(
      id: id ?? this.id,
      coins: coins ?? this.coins,
      lastLoginDate: lastLoginDate ?? this.lastLoginDate,
      wallpaperId: wallpaperId ?? this.wallpaperId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (coins.present) {
      map['coins'] = Variable<int>(coins.value);
    }
    if (lastLoginDate.present) {
      map['last_login_date'] = Variable<String>(lastLoginDate.value);
    }
    if (wallpaperId.present) {
      map['wallpaper_id'] = Variable<String>(wallpaperId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayerStatsCompanion(')
          ..write('id: $id, ')
          ..write('coins: $coins, ')
          ..write('lastLoginDate: $lastLoginDate, ')
          ..write('wallpaperId: $wallpaperId')
          ..write(')'))
        .toString();
  }
}

class $UnlockedFurnitureTable extends UnlockedFurniture
    with TableInfo<$UnlockedFurnitureTable, UnlockedFurnitureRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnlockedFurnitureTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _typeNameMeta = const VerificationMeta(
    'typeName',
  );
  @override
  late final GeneratedColumn<String> typeName = GeneratedColumn<String>(
    'type_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [typeName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unlocked_furniture';
  @override
  VerificationContext validateIntegrity(
    Insertable<UnlockedFurnitureRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('type_name')) {
      context.handle(
        _typeNameMeta,
        typeName.isAcceptableOrUnknown(data['type_name']!, _typeNameMeta),
      );
    } else if (isInserting) {
      context.missing(_typeNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {typeName};
  @override
  UnlockedFurnitureRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnlockedFurnitureRow(
      typeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type_name'],
      )!,
    );
  }

  @override
  $UnlockedFurnitureTable createAlias(String alias) {
    return $UnlockedFurnitureTable(attachedDatabase, alias);
  }
}

class UnlockedFurnitureRow extends DataClass
    implements Insertable<UnlockedFurnitureRow> {
  final String typeName;
  const UnlockedFurnitureRow({required this.typeName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['type_name'] = Variable<String>(typeName);
    return map;
  }

  UnlockedFurnitureCompanion toCompanion(bool nullToAbsent) {
    return UnlockedFurnitureCompanion(typeName: Value(typeName));
  }

  factory UnlockedFurnitureRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnlockedFurnitureRow(
      typeName: serializer.fromJson<String>(json['typeName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'typeName': serializer.toJson<String>(typeName)};
  }

  UnlockedFurnitureRow copyWith({String? typeName}) =>
      UnlockedFurnitureRow(typeName: typeName ?? this.typeName);
  UnlockedFurnitureRow copyWithCompanion(UnlockedFurnitureCompanion data) {
    return UnlockedFurnitureRow(
      typeName: data.typeName.present ? data.typeName.value : this.typeName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnlockedFurnitureRow(')
          ..write('typeName: $typeName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => typeName.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnlockedFurnitureRow && other.typeName == this.typeName);
}

class UnlockedFurnitureCompanion extends UpdateCompanion<UnlockedFurnitureRow> {
  final Value<String> typeName;
  final Value<int> rowid;
  const UnlockedFurnitureCompanion({
    this.typeName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UnlockedFurnitureCompanion.insert({
    required String typeName,
    this.rowid = const Value.absent(),
  }) : typeName = Value(typeName);
  static Insertable<UnlockedFurnitureRow> custom({
    Expression<String>? typeName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (typeName != null) 'type_name': typeName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UnlockedFurnitureCompanion copyWith({
    Value<String>? typeName,
    Value<int>? rowid,
  }) {
    return UnlockedFurnitureCompanion(
      typeName: typeName ?? this.typeName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (typeName.present) {
      map['type_name'] = Variable<String>(typeName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnlockedFurnitureCompanion(')
          ..write('typeName: $typeName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CatsTable cats = $CatsTable(this);
  late final $InteractionsTable interactions = $InteractionsTable(this);
  late final $RoomItemsTable roomItems = $RoomItemsTable(this);
  late final $PlayerStatsTable playerStats = $PlayerStatsTable(this);
  late final $UnlockedFurnitureTable unlockedFurniture =
      $UnlockedFurnitureTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cats,
    interactions,
    roomItems,
    playerStats,
    unlockedFurniture,
  ];
}

typedef $$CatsTableCreateCompanionBuilder =
    CatsCompanion Function({
      required String id,
      required String name,
      required String coatColor,
      required String eyeColor,
      required double sociability,
      required double energy,
      required double affection,
      required double curiosity,
      Value<double> mood,
      Value<double> health,
      Value<int> bond,
      required DateTime birthDate,
      Value<String?> parentIds,
      Value<int> rowid,
    });
typedef $$CatsTableUpdateCompanionBuilder =
    CatsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> coatColor,
      Value<String> eyeColor,
      Value<double> sociability,
      Value<double> energy,
      Value<double> affection,
      Value<double> curiosity,
      Value<double> mood,
      Value<double> health,
      Value<int> bond,
      Value<DateTime> birthDate,
      Value<String?> parentIds,
      Value<int> rowid,
    });

final class $$CatsTableReferences
    extends BaseReferences<_$AppDatabase, $CatsTable, CatRow> {
  $$CatsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$InteractionsTable, List<InteractionRow>>
  _interactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.interactions,
    aliasName: $_aliasNameGenerator(db.cats.id, db.interactions.catId),
  );

  $$InteractionsTableProcessedTableManager get interactionsRefs {
    final manager = $$InteractionsTableTableManager(
      $_db,
      $_db.interactions,
    ).filter((f) => f.catId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_interactionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CatsTableFilterComposer extends Composer<_$AppDatabase, $CatsTable> {
  $$CatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coatColor => $composableBuilder(
    column: $table.coatColor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eyeColor => $composableBuilder(
    column: $table.eyeColor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sociability => $composableBuilder(
    column: $table.sociability,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get energy => $composableBuilder(
    column: $table.energy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get affection => $composableBuilder(
    column: $table.affection,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get curiosity => $composableBuilder(
    column: $table.curiosity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get health => $composableBuilder(
    column: $table.health,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bond => $composableBuilder(
    column: $table.bond,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentIds => $composableBuilder(
    column: $table.parentIds,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> interactionsRefs(
    Expression<bool> Function($$InteractionsTableFilterComposer f) f,
  ) {
    final $$InteractionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.interactions,
      getReferencedColumn: (t) => t.catId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InteractionsTableFilterComposer(
            $db: $db,
            $table: $db.interactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CatsTableOrderingComposer extends Composer<_$AppDatabase, $CatsTable> {
  $$CatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coatColor => $composableBuilder(
    column: $table.coatColor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eyeColor => $composableBuilder(
    column: $table.eyeColor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sociability => $composableBuilder(
    column: $table.sociability,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get energy => $composableBuilder(
    column: $table.energy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get affection => $composableBuilder(
    column: $table.affection,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get curiosity => $composableBuilder(
    column: $table.curiosity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get health => $composableBuilder(
    column: $table.health,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bond => $composableBuilder(
    column: $table.bond,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentIds => $composableBuilder(
    column: $table.parentIds,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CatsTable> {
  $$CatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get coatColor =>
      $composableBuilder(column: $table.coatColor, builder: (column) => column);

  GeneratedColumn<String> get eyeColor =>
      $composableBuilder(column: $table.eyeColor, builder: (column) => column);

  GeneratedColumn<double> get sociability => $composableBuilder(
    column: $table.sociability,
    builder: (column) => column,
  );

  GeneratedColumn<double> get energy =>
      $composableBuilder(column: $table.energy, builder: (column) => column);

  GeneratedColumn<double> get affection =>
      $composableBuilder(column: $table.affection, builder: (column) => column);

  GeneratedColumn<double> get curiosity =>
      $composableBuilder(column: $table.curiosity, builder: (column) => column);

  GeneratedColumn<double> get mood =>
      $composableBuilder(column: $table.mood, builder: (column) => column);

  GeneratedColumn<double> get health =>
      $composableBuilder(column: $table.health, builder: (column) => column);

  GeneratedColumn<int> get bond =>
      $composableBuilder(column: $table.bond, builder: (column) => column);

  GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  GeneratedColumn<String> get parentIds =>
      $composableBuilder(column: $table.parentIds, builder: (column) => column);

  Expression<T> interactionsRefs<T extends Object>(
    Expression<T> Function($$InteractionsTableAnnotationComposer a) f,
  ) {
    final $$InteractionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.interactions,
      getReferencedColumn: (t) => t.catId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InteractionsTableAnnotationComposer(
            $db: $db,
            $table: $db.interactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CatsTable,
          CatRow,
          $$CatsTableFilterComposer,
          $$CatsTableOrderingComposer,
          $$CatsTableAnnotationComposer,
          $$CatsTableCreateCompanionBuilder,
          $$CatsTableUpdateCompanionBuilder,
          (CatRow, $$CatsTableReferences),
          CatRow,
          PrefetchHooks Function({bool interactionsRefs})
        > {
  $$CatsTableTableManager(_$AppDatabase db, $CatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> coatColor = const Value.absent(),
                Value<String> eyeColor = const Value.absent(),
                Value<double> sociability = const Value.absent(),
                Value<double> energy = const Value.absent(),
                Value<double> affection = const Value.absent(),
                Value<double> curiosity = const Value.absent(),
                Value<double> mood = const Value.absent(),
                Value<double> health = const Value.absent(),
                Value<int> bond = const Value.absent(),
                Value<DateTime> birthDate = const Value.absent(),
                Value<String?> parentIds = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CatsCompanion(
                id: id,
                name: name,
                coatColor: coatColor,
                eyeColor: eyeColor,
                sociability: sociability,
                energy: energy,
                affection: affection,
                curiosity: curiosity,
                mood: mood,
                health: health,
                bond: bond,
                birthDate: birthDate,
                parentIds: parentIds,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String coatColor,
                required String eyeColor,
                required double sociability,
                required double energy,
                required double affection,
                required double curiosity,
                Value<double> mood = const Value.absent(),
                Value<double> health = const Value.absent(),
                Value<int> bond = const Value.absent(),
                required DateTime birthDate,
                Value<String?> parentIds = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CatsCompanion.insert(
                id: id,
                name: name,
                coatColor: coatColor,
                eyeColor: eyeColor,
                sociability: sociability,
                energy: energy,
                affection: affection,
                curiosity: curiosity,
                mood: mood,
                health: health,
                bond: bond,
                birthDate: birthDate,
                parentIds: parentIds,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$CatsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({interactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (interactionsRefs) db.interactions],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (interactionsRefs)
                    await $_getPrefetchedData<
                      CatRow,
                      $CatsTable,
                      InteractionRow
                    >(
                      currentTable: table,
                      referencedTable: $$CatsTableReferences
                          ._interactionsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CatsTableReferences(db, table, p0).interactionsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.catId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CatsTable,
      CatRow,
      $$CatsTableFilterComposer,
      $$CatsTableOrderingComposer,
      $$CatsTableAnnotationComposer,
      $$CatsTableCreateCompanionBuilder,
      $$CatsTableUpdateCompanionBuilder,
      (CatRow, $$CatsTableReferences),
      CatRow,
      PrefetchHooks Function({bool interactionsRefs})
    >;
typedef $$InteractionsTableCreateCompanionBuilder =
    InteractionsCompanion Function({
      Value<int> id,
      required String catId,
      required String type,
      required DateTime timestamp,
    });
typedef $$InteractionsTableUpdateCompanionBuilder =
    InteractionsCompanion Function({
      Value<int> id,
      Value<String> catId,
      Value<String> type,
      Value<DateTime> timestamp,
    });

final class $$InteractionsTableReferences
    extends BaseReferences<_$AppDatabase, $InteractionsTable, InteractionRow> {
  $$InteractionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CatsTable _catIdTable(_$AppDatabase db) => db.cats.createAlias(
    $_aliasNameGenerator(db.interactions.catId, db.cats.id),
  );

  $$CatsTableProcessedTableManager get catId {
    final $_column = $_itemColumn<String>('cat_id')!;

    final manager = $$CatsTableTableManager(
      $_db,
      $_db.cats,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_catIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$InteractionsTableFilterComposer
    extends Composer<_$AppDatabase, $InteractionsTable> {
  $$InteractionsTableFilterComposer({
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

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  $$CatsTableFilterComposer get catId {
    final $$CatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catId,
      referencedTable: $db.cats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatsTableFilterComposer(
            $db: $db,
            $table: $db.cats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InteractionsTableOrderingComposer
    extends Composer<_$AppDatabase, $InteractionsTable> {
  $$InteractionsTableOrderingComposer({
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

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  $$CatsTableOrderingComposer get catId {
    final $$CatsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catId,
      referencedTable: $db.cats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatsTableOrderingComposer(
            $db: $db,
            $table: $db.cats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InteractionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InteractionsTable> {
  $$InteractionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  $$CatsTableAnnotationComposer get catId {
    final $$CatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catId,
      referencedTable: $db.cats,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatsTableAnnotationComposer(
            $db: $db,
            $table: $db.cats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InteractionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InteractionsTable,
          InteractionRow,
          $$InteractionsTableFilterComposer,
          $$InteractionsTableOrderingComposer,
          $$InteractionsTableAnnotationComposer,
          $$InteractionsTableCreateCompanionBuilder,
          $$InteractionsTableUpdateCompanionBuilder,
          (InteractionRow, $$InteractionsTableReferences),
          InteractionRow,
          PrefetchHooks Function({bool catId})
        > {
  $$InteractionsTableTableManager(_$AppDatabase db, $InteractionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InteractionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InteractionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InteractionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> catId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
              }) => InteractionsCompanion(
                id: id,
                catId: catId,
                type: type,
                timestamp: timestamp,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String catId,
                required String type,
                required DateTime timestamp,
              }) => InteractionsCompanion.insert(
                id: id,
                catId: catId,
                type: type,
                timestamp: timestamp,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InteractionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({catId = false}) {
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
                    if (catId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.catId,
                                referencedTable: $$InteractionsTableReferences
                                    ._catIdTable(db),
                                referencedColumn: $$InteractionsTableReferences
                                    ._catIdTable(db)
                                    .id,
                              )
                              as T;
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

typedef $$InteractionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InteractionsTable,
      InteractionRow,
      $$InteractionsTableFilterComposer,
      $$InteractionsTableOrderingComposer,
      $$InteractionsTableAnnotationComposer,
      $$InteractionsTableCreateCompanionBuilder,
      $$InteractionsTableUpdateCompanionBuilder,
      (InteractionRow, $$InteractionsTableReferences),
      InteractionRow,
      PrefetchHooks Function({bool catId})
    >;
typedef $$RoomItemsTableCreateCompanionBuilder =
    RoomItemsCompanion Function({
      Value<int> id,
      required String itemType,
      required double posX,
      required double posY,
      Value<bool> isUnlocked,
    });
typedef $$RoomItemsTableUpdateCompanionBuilder =
    RoomItemsCompanion Function({
      Value<int> id,
      Value<String> itemType,
      Value<double> posX,
      Value<double> posY,
      Value<bool> isUnlocked,
    });

class $$RoomItemsTableFilterComposer
    extends Composer<_$AppDatabase, $RoomItemsTable> {
  $$RoomItemsTableFilterComposer({
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

  ColumnFilters<String> get itemType => $composableBuilder(
    column: $table.itemType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get posX => $composableBuilder(
    column: $table.posX,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get posY => $composableBuilder(
    column: $table.posY,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isUnlocked => $composableBuilder(
    column: $table.isUnlocked,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RoomItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoomItemsTable> {
  $$RoomItemsTableOrderingComposer({
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

  ColumnOrderings<String> get itemType => $composableBuilder(
    column: $table.itemType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get posX => $composableBuilder(
    column: $table.posX,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get posY => $composableBuilder(
    column: $table.posY,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isUnlocked => $composableBuilder(
    column: $table.isUnlocked,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoomItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoomItemsTable> {
  $$RoomItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemType =>
      $composableBuilder(column: $table.itemType, builder: (column) => column);

  GeneratedColumn<double> get posX =>
      $composableBuilder(column: $table.posX, builder: (column) => column);

  GeneratedColumn<double> get posY =>
      $composableBuilder(column: $table.posY, builder: (column) => column);

  GeneratedColumn<bool> get isUnlocked => $composableBuilder(
    column: $table.isUnlocked,
    builder: (column) => column,
  );
}

class $$RoomItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoomItemsTable,
          RoomItemRow,
          $$RoomItemsTableFilterComposer,
          $$RoomItemsTableOrderingComposer,
          $$RoomItemsTableAnnotationComposer,
          $$RoomItemsTableCreateCompanionBuilder,
          $$RoomItemsTableUpdateCompanionBuilder,
          (
            RoomItemRow,
            BaseReferences<_$AppDatabase, $RoomItemsTable, RoomItemRow>,
          ),
          RoomItemRow,
          PrefetchHooks Function()
        > {
  $$RoomItemsTableTableManager(_$AppDatabase db, $RoomItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> itemType = const Value.absent(),
                Value<double> posX = const Value.absent(),
                Value<double> posY = const Value.absent(),
                Value<bool> isUnlocked = const Value.absent(),
              }) => RoomItemsCompanion(
                id: id,
                itemType: itemType,
                posX: posX,
                posY: posY,
                isUnlocked: isUnlocked,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String itemType,
                required double posX,
                required double posY,
                Value<bool> isUnlocked = const Value.absent(),
              }) => RoomItemsCompanion.insert(
                id: id,
                itemType: itemType,
                posX: posX,
                posY: posY,
                isUnlocked: isUnlocked,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RoomItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoomItemsTable,
      RoomItemRow,
      $$RoomItemsTableFilterComposer,
      $$RoomItemsTableOrderingComposer,
      $$RoomItemsTableAnnotationComposer,
      $$RoomItemsTableCreateCompanionBuilder,
      $$RoomItemsTableUpdateCompanionBuilder,
      (
        RoomItemRow,
        BaseReferences<_$AppDatabase, $RoomItemsTable, RoomItemRow>,
      ),
      RoomItemRow,
      PrefetchHooks Function()
    >;
typedef $$PlayerStatsTableCreateCompanionBuilder =
    PlayerStatsCompanion Function({
      Value<int> id,
      Value<int> coins,
      Value<String?> lastLoginDate,
      Value<String?> wallpaperId,
    });
typedef $$PlayerStatsTableUpdateCompanionBuilder =
    PlayerStatsCompanion Function({
      Value<int> id,
      Value<int> coins,
      Value<String?> lastLoginDate,
      Value<String?> wallpaperId,
    });

class $$PlayerStatsTableFilterComposer
    extends Composer<_$AppDatabase, $PlayerStatsTable> {
  $$PlayerStatsTableFilterComposer({
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

  ColumnFilters<int> get coins => $composableBuilder(
    column: $table.coins,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastLoginDate => $composableBuilder(
    column: $table.lastLoginDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wallpaperId => $composableBuilder(
    column: $table.wallpaperId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlayerStatsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayerStatsTable> {
  $$PlayerStatsTableOrderingComposer({
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

  ColumnOrderings<int> get coins => $composableBuilder(
    column: $table.coins,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastLoginDate => $composableBuilder(
    column: $table.lastLoginDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wallpaperId => $composableBuilder(
    column: $table.wallpaperId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlayerStatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayerStatsTable> {
  $$PlayerStatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get coins =>
      $composableBuilder(column: $table.coins, builder: (column) => column);

  GeneratedColumn<String> get lastLoginDate => $composableBuilder(
    column: $table.lastLoginDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get wallpaperId => $composableBuilder(
    column: $table.wallpaperId,
    builder: (column) => column,
  );
}

class $$PlayerStatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlayerStatsTable,
          PlayerStatsRow,
          $$PlayerStatsTableFilterComposer,
          $$PlayerStatsTableOrderingComposer,
          $$PlayerStatsTableAnnotationComposer,
          $$PlayerStatsTableCreateCompanionBuilder,
          $$PlayerStatsTableUpdateCompanionBuilder,
          (
            PlayerStatsRow,
            BaseReferences<_$AppDatabase, $PlayerStatsTable, PlayerStatsRow>,
          ),
          PlayerStatsRow,
          PrefetchHooks Function()
        > {
  $$PlayerStatsTableTableManager(_$AppDatabase db, $PlayerStatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayerStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayerStatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayerStatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> coins = const Value.absent(),
                Value<String?> lastLoginDate = const Value.absent(),
                Value<String?> wallpaperId = const Value.absent(),
              }) => PlayerStatsCompanion(
                id: id,
                coins: coins,
                lastLoginDate: lastLoginDate,
                wallpaperId: wallpaperId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> coins = const Value.absent(),
                Value<String?> lastLoginDate = const Value.absent(),
                Value<String?> wallpaperId = const Value.absent(),
              }) => PlayerStatsCompanion.insert(
                id: id,
                coins: coins,
                lastLoginDate: lastLoginDate,
                wallpaperId: wallpaperId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlayerStatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlayerStatsTable,
      PlayerStatsRow,
      $$PlayerStatsTableFilterComposer,
      $$PlayerStatsTableOrderingComposer,
      $$PlayerStatsTableAnnotationComposer,
      $$PlayerStatsTableCreateCompanionBuilder,
      $$PlayerStatsTableUpdateCompanionBuilder,
      (
        PlayerStatsRow,
        BaseReferences<_$AppDatabase, $PlayerStatsTable, PlayerStatsRow>,
      ),
      PlayerStatsRow,
      PrefetchHooks Function()
    >;
typedef $$UnlockedFurnitureTableCreateCompanionBuilder =
    UnlockedFurnitureCompanion Function({
      required String typeName,
      Value<int> rowid,
    });
typedef $$UnlockedFurnitureTableUpdateCompanionBuilder =
    UnlockedFurnitureCompanion Function({
      Value<String> typeName,
      Value<int> rowid,
    });

class $$UnlockedFurnitureTableFilterComposer
    extends Composer<_$AppDatabase, $UnlockedFurnitureTable> {
  $$UnlockedFurnitureTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get typeName => $composableBuilder(
    column: $table.typeName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UnlockedFurnitureTableOrderingComposer
    extends Composer<_$AppDatabase, $UnlockedFurnitureTable> {
  $$UnlockedFurnitureTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get typeName => $composableBuilder(
    column: $table.typeName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UnlockedFurnitureTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnlockedFurnitureTable> {
  $$UnlockedFurnitureTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get typeName =>
      $composableBuilder(column: $table.typeName, builder: (column) => column);
}

class $$UnlockedFurnitureTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UnlockedFurnitureTable,
          UnlockedFurnitureRow,
          $$UnlockedFurnitureTableFilterComposer,
          $$UnlockedFurnitureTableOrderingComposer,
          $$UnlockedFurnitureTableAnnotationComposer,
          $$UnlockedFurnitureTableCreateCompanionBuilder,
          $$UnlockedFurnitureTableUpdateCompanionBuilder,
          (
            UnlockedFurnitureRow,
            BaseReferences<
              _$AppDatabase,
              $UnlockedFurnitureTable,
              UnlockedFurnitureRow
            >,
          ),
          UnlockedFurnitureRow,
          PrefetchHooks Function()
        > {
  $$UnlockedFurnitureTableTableManager(
    _$AppDatabase db,
    $UnlockedFurnitureTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnlockedFurnitureTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnlockedFurnitureTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnlockedFurnitureTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> typeName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) =>
                  UnlockedFurnitureCompanion(typeName: typeName, rowid: rowid),
          createCompanionCallback:
              ({
                required String typeName,
                Value<int> rowid = const Value.absent(),
              }) => UnlockedFurnitureCompanion.insert(
                typeName: typeName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UnlockedFurnitureTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UnlockedFurnitureTable,
      UnlockedFurnitureRow,
      $$UnlockedFurnitureTableFilterComposer,
      $$UnlockedFurnitureTableOrderingComposer,
      $$UnlockedFurnitureTableAnnotationComposer,
      $$UnlockedFurnitureTableCreateCompanionBuilder,
      $$UnlockedFurnitureTableUpdateCompanionBuilder,
      (
        UnlockedFurnitureRow,
        BaseReferences<
          _$AppDatabase,
          $UnlockedFurnitureTable,
          UnlockedFurnitureRow
        >,
      ),
      UnlockedFurnitureRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CatsTableTableManager get cats => $$CatsTableTableManager(_db, _db.cats);
  $$InteractionsTableTableManager get interactions =>
      $$InteractionsTableTableManager(_db, _db.interactions);
  $$RoomItemsTableTableManager get roomItems =>
      $$RoomItemsTableTableManager(_db, _db.roomItems);
  $$PlayerStatsTableTableManager get playerStats =>
      $$PlayerStatsTableTableManager(_db, _db.playerStats);
  $$UnlockedFurnitureTableTableManager get unlockedFurniture =>
      $$UnlockedFurnitureTableTableManager(_db, _db.unlockedFurniture);
}
