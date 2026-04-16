import 'package:habit_tracker/domain/entities/habit.dart';

abstract class HabitRepository {
  Future<void> create(String name, HabitFrequency frequency);

  Future<void> edit(Habit habit);

  Future<void> delete(String id);

  Future<List<Habit>> getAll();

  Future<Habit?> getById(String id);
}
