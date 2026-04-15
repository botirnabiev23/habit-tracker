import 'package:habit_tracker/domain/repositories/habit_completion_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/habit_completion.dart';

@lazySingleton
class GetCompletionUseCase {
  final HabitCompletionRepository _repository;

  const GetCompletionUseCase(this._repository);

  Future<List<HabitCompletion>> call(String habitId) =>
      _repository.getCompletions(habitId);}
