import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/domain/entities/habit.dart';
import 'package:habit_tracker/domain/entities/habit_completion.dart';
import 'package:habit_tracker/domain/use_cases/get_completion_use_case.dart';
import 'package:habit_tracker/domain/use_cases/get_habits_by_id_use_cases.dart';
import 'package:meta/meta.dart';

part 'habit_details_state.dart';

class HabitDetailsCubit extends Cubit<HabitDetailsState> {
  final GetHabitByIdUseCase _getHabitByIdUseCase;
  final GetCompletionUseCase _getCompletionUseCase;

  HabitDetailsCubit(this._getHabitByIdUseCase, this._getCompletionUseCase)
    : super(HabitDetailsInitial());

  Future<void> getHabitById(String id) async {
    emit(HabitDetailsLoading());
    try {
      final habit = await _getHabitByIdUseCase(id);
      if (habit == null) {
        emit(HabitDetailsError('Привычка не найдена'));
        return;
      }
      final completions = await _getCompletionUseCase(id);
      emit(HabitDetailsLoaded(habit: habit, completions: completions));
    } catch (e) {
      emit(HabitDetailsError(e.toString()));
    }
  }
}
