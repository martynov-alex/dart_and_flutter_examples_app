import 'package:dart_and_flutter_examples_app/src/drift_database_example/data/source/database/connection/connection.dart'
    as impl;
import 'package:dart_and_flutter_examples_app/src/drift_database_example/data/source/database/notes_database.dart';
import 'package:dart_and_flutter_examples_app/src/drift_database_example/data/source/database/tables.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'notes_database_impl.g.dart';

@DriftDatabase(tables: [NoteEntries, Categories])
class NotesDatabaseImpl extends _$NotesDatabaseImpl implements NotesDatabase {
  NotesDatabaseImpl() : super(impl.connect());

  @override
  int get schemaVersion => 1;

  NotesDatabaseImpl.forTesting(DatabaseConnection super.connection);

  static final StateProvider<NotesDatabaseImpl> provider = StateProvider((ref) {
    final database = NotesDatabaseImpl();
    ref.onDispose(database.close);

    return database;
  });
}
