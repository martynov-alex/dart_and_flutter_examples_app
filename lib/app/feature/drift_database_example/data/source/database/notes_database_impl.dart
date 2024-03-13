import 'package:dart_and_flutter_examples_app/app/common/data/source/database/connection/connection.dart'
    as impl;
import 'package:dart_and_flutter_examples_app/app/feature/drift_database_example/data/source/database/notes_database.dart';
import 'package:dart_and_flutter_examples_app/app/feature/drift_database_example/data/source/database/notes_tables.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'notes_database_impl.g.dart';

@DriftDatabase(tables: [NoteEntries, Categories])
class NotesDatabaseImpl extends _$NotesDatabaseImpl implements NotesDatabase {
  NotesDatabaseImpl({
    required this.dbName,
    required this.inMemory,
    required this.logStatements,
  }) : super(
          impl.connect(
            dbName,
            inMemory: inMemory,
            logStatements: logStatements,
          ),
        );

  final String dbName;
  final bool inMemory;
  final bool logStatements;

  @override
  int get schemaVersion => 1;

  NotesDatabaseImpl.forTesting(
    DatabaseConnection super.connection, {
    required this.dbName,
    required this.inMemory,
    required this.logStatements,
  });

  static final StateProvider<NotesDatabaseImpl> provider = StateProvider((ref) {
    final database = NotesDatabaseImpl(
      dbName: 'notes.db',
      inMemory: false,
      logStatements: true,
    );
    ref.onDispose(database.close);

    return database;
  });
}
