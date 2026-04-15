import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../database/tables/tables.dart';

part 'habits_completions_dao.g.dart';

@DriftAccessor(tables: [HabitCompletions])
class HabitCompletionsDao extends DatabaseAccessor<AppDatabase>
    with _$HabitCompletionsDaoMixin {
  HabitCompletionsDao(super.db);

  Future<List<HabitCompletion>> getCompletions(int habitId) => (select(habitCompletions)..where((t) => t.habitId.equals(habitId))).get();

  Future<void> addCompletion(HabitCompletionsCompanion completion) => into(habitCompletions).insert(completion);

  Future<void> deleteCompletion(int id) => (delete(habitCompletions)..where((t) => t.id.equals(id))).go();
}