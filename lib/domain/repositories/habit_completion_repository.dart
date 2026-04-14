import 'package:habit_tracker/domain/entities/habit_completion.dart';

abstract class HabitCompletionRepository {
  Future<void> addCompletion(String habitId, DateTime completedDate);

  Future<void> deleteCompletion(String id);

  Future<List<HabitCompletion>> getCompletions(String habitId);
}
