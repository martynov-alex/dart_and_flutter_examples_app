import 'dart:ui';

import 'package:drift/drift.dart';

export 'dart:ui' show Color;

@DataClassName('NoteDto')
class NoteEntries extends Table with AutoIncrementingPrimaryKey {
  TextColumn get note => text()();

  // Notes can optionally be in a category.
  IntColumn get category => integer().nullable().references(Categories, #id)();

  // Assume that this column didn't exist in the first version of the app, it
  // was added later.
  // After adding it, the `schemaVersion` in the database class was incremented
  // to 2 and a migration was written.
  //
  // With drift, database migrations can be unit-tested. See the readme of this
  // example for details.
  DateTimeColumn get creationDate => dateTime().nullable()();
}

@DataClassName('CategoryDto')
class Categories extends Table with AutoIncrementingPrimaryKey {
  TextColumn get name => text()();

  // We can use type converters to store custom classes in tables.
  // Here, we're storing colors as integers.
  IntColumn get color => integer().map(const ColorConverter())();
}

// Tables can mix-in common definitions if needed
mixin AutoIncrementingPrimaryKey on Table {
  IntColumn get id => integer().autoIncrement()();
}

class ColorConverter extends TypeConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromSql(int fromDb) => Color(fromDb);

  @override
  int toSql(Color value) => value.value;
}
