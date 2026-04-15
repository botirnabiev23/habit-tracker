import 'package:drift/drift.dart';
import 'package:habit_tracker/data/database/app_database.dart' as db;
import 'package:habit_tracker/data/database/habits_dao.dart';
import 'package:habit_tracker/domain/entities/habit.dart' as domain;
import 'package:habit_tracker/domain/repositories/habit_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HabitRepository)
class HabitRepositoryImpl implements HabitRepository {
  final HabitsDao _dao;

  HabitRepositoryImpl(this._dao);

  @override
  Future<void> create(String name, domain.HabitFrequency frequency) async {
    await _dao.insertHabit(_toCompanion(name, frequency));
  }

  @override
  Future<void> delete(String id) async {
    await _dao.deleteHabit(int.parse(id));
  }

  @override
  Future<void> edit(domain.Habit habit) async {
    await _dao.updateHabit(
      db.HabitsCompanion(
        id: Value(int.parse(habit.id)),
        name: Value(habit.name),
        frequency: Value(habit.frequency.name),
        createdAt: Value(habit.createdAt),
      ),
    );
  }

  @override
  Future<List<domain.Habit>> getAll() async {
    final list = await _dao.getAllHabits();
    return list.map((e) => _toDomain(e)).toList();
  }

  domain.Habit _toDomain(db.Habit data) {
    return domain.Habit(
      id: data.id.toString(),
      name: data.name,
      frequency: domain.HabitFrequency.values.byName(data.frequency),
      createdAt: data.createdAt,
    );
  }

  db.HabitsCompanion _toCompanion(String name, domain.HabitFrequency frequency) {
    return db.HabitsCompanion(
      name: Value(name),
      frequency: Value(frequency.name),
      createdAt: Value(DateTime.now()),
    );
  }
}
