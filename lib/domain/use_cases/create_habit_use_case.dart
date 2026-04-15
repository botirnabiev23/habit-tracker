import 'package:habit_tracker/domain/entities/habit.dart';
import 'package:habit_tracker/domain/repositories/habit_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateHabitUseCase {
  final HabitRepository _repository;

  const CreateHabitUseCase(this._repository);

  Future<void> call(String name, HabitFrequency frequency) => _repository.create(name, frequency);
}
