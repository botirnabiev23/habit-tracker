import 'package:habit_tracker/domain/repositories/habit_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/habit.dart';

@lazySingleton
class GetHabitByIdUseCase {
  final HabitRepository _repository;

  const GetHabitByIdUseCase(this._repository);

  Future<Habit?> call(String id) => _repository.getById(id);}
