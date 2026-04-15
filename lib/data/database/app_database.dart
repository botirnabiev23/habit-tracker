import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:habit_tracker/data/database/habits_completions_dao.dart';
import 'package:habit_tracker/data/database/habits_dao.dart';
import 'package:habit_tracker/data/database/tables/tables.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'app_database.g.dart';

@DriftDatabase(tables: [Habits, HabitCompletions], daos: [HabitsDao, HabitCompletionsDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'habits.db'));
    return NativeDatabase(file);
  });
}
