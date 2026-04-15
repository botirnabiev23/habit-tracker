import 'package:habit_tracker/domain/repositories/habit_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteHabitUseCase {
  final HabitRepository _repository;

  const DeleteHabitUseCase(this._repository);

  Future<void> call(String id) => _repository.delete(id);
}
