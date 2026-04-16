import 'package:bloc/bloc.dart';
import 'package:habit_tracker/domain/entities/habit.dart';
import 'package:habit_tracker/domain/use_cases/create_habit_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'create_habit_state.dart';

@lazySingleton
class CreateHabitCubit extends Cubit<CreateHabitState> {
  final CreateHabitUseCase _createHabitUseCase;

  CreateHabitCubit(this._createHabitUseCase) : super(CreateHabitInitial());

  Future<void> createHabit(String name, HabitFrequency frequency) async {
    emit(CreateHabitLoading());
    try {
      await _createHabitUseCase(name, frequency);
      emit(CreateHabitSuccess());
    } catch (e) {
      emit(CreateHabitError(e.toString()));
    }
  }
}
