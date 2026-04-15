import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../database/tables/tables.dart';

part 'habits_dao.g.dart';

@DriftAccessor(tables: [Habits])
class HabitsDao extends DatabaseAccessor<AppDatabase> with _$HabitsDaoMixin {
  HabitsDao(super.db);

  Future<List<Habit>> getAllHabits() => select(habits).get();

  Future<void> insertHabit(HabitsCompanion habit) => into(habits).insert(habit);

  Future<void> deleteHabit(int id) => (delete(habits)..where((t) => t.id.equals(id))).go();

  Future<void> updateHabit(HabitsCompanion habit) => update(habits).replace(habit);
}
