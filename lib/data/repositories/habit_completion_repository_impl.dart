import 'package:drift/drift.dart';
import 'package:habit_tracker/data/database/habits_completions_dao.dart';
import 'package:habit_tracker/domain/repositories/habit_completion_repository.dart';
import 'package:habit_tracker/data/database/app_database.dart' as db;
import 'package:habit_tracker/domain/entities/habit_completion.dart' as domain;

class HabitCompletionRepositoryImpl implements HabitCompletionRepository {
  final HabitCompletionsDao _dao;

  const HabitCompletionRepositoryImpl(this._dao);

  @override
  Future<void> addCompletion(String habitId, DateTime completedDate) async {
    await _dao.addCompletion(
      db.HabitCompletionsCompanion(
        habitId: Value(int.parse(habitId)),
        completedDate: Value(completedDate),
      ),
    );
  }

  @override
  Future<void> deleteCompletion(String id) async {
    await _dao.deleteCompletion(int.parse(id));
  }

  @override
  Future<List<domain.HabitCompletion>> getCompletions(String habitId) async {
    final list = await _dao.getCompletions(int.parse(habitId));
    return list.map((e) => _toDomain(e)).toList();
  }

  domain.HabitCompletion _toDomain(db.HabitCompletion data) {
    return domain.HabitCompletion(
      id: data.id.toString(),
      habitId: data.habitId.toString(),
      completedDate: data.completedDate,
    );
  }
}
