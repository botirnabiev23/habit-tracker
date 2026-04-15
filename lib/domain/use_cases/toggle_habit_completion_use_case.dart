import 'package:habit_tracker/domain/entities/habit_completion.dart';
import 'package:habit_tracker/domain/repositories/habit_completion_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ToggleHabitCompletionUseCase {
  final HabitCompletionRepository _repository;

  const ToggleHabitCompletionUseCase(this._repository);

  Future<void> call(String habitId, DateTime date) async {
    final completions = await _repository.getCompletions(habitId);

    final existing = completions
        .where(
          (c) =>
              c.completedDate.year == date.year &&
              c.completedDate.month == date.month &&
              c.completedDate.day == date.day,
        )
        .firstOrNull;

    if (existing != null) {
      await _repository.deleteCompletion(existing.id);
    } else {
      await _repository.addCompletion(habitId, date);
    }
  }
}
