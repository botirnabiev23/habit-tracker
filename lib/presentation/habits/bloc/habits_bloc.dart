import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/domain/entities/habit.dart';
import 'package:habit_tracker/domain/use_cases/get_all_habits_use_case.dart';
import 'package:habit_tracker/domain/use_cases/toggle_habit_completion_use_case.dart';
import 'package:meta/meta.dart';

part 'habits_event.dart';

part 'habits_state.dart';

class HabitsBloc extends Bloc<HabitsEvent, HabitsState> {
  final GetAllHabitsUseCase _getAllHabitsUseCase;
  final ToggleHabitCompletionUseCase _toggleHabitCompletionUseCase;

  HabitsBloc(this._getAllHabitsUseCase, this._toggleHabitCompletionUseCase)
    : super(HabitsInitial()) {
    on<FetchHabitsEvent>(_onFetchHabits);
    on<ToggleCompletionEvent>(_onToggleCompletion);
  }

  Future<void> _onFetchHabits(FetchHabitsEvent event, Emitter<HabitsState> emit) async {
    emit(LoadingHabitsState());
    try {
      final habits = await _getAllHabitsUseCase();
      emit(LoadedHabitsState(habits));
    } catch (e) {
      emit(ErrorHabitsState(e.toString()));
    }
  }

  Future<void> _onToggleCompletion(ToggleCompletionEvent event, Emitter<HabitsState> emit) async {
    try {
      await _toggleHabitCompletionUseCase(event.habitId, event.date);
      final habits = await _getAllHabitsUseCase();
      emit(LoadedHabitsState(habits));
    } catch (e) {
      emit(ErrorHabitsState(e.toString()));
    }
  }
}
