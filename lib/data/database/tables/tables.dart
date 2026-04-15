import 'package:drift/drift.dart';

class Habits extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get frequency => text()();

  DateTimeColumn get createdAt => dateTime()();
}

class HabitCompletions extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get habitId => integer().references(Habits, #id)();

  DateTimeColumn get completedDate => dateTime()();
}
