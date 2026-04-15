import 'package:habit_tracker/domain/entities/habit.dart';
import 'package:habit_tracker/domain/repositories/habit_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllHabitsUseCase {
  final HabitRepository _repository;

  const GetAllHabitsUseCase(this._repository);

  Future<List<Habit>> call() => _repository.getAll();
}
