part of 'habits_bloc.dart';

@immutable
sealed class HabitsState {}

final class HabitsInitial extends HabitsState {}

class LoadingHabitsState extends HabitsState {}

class ToggleHabitsState extends HabitsState {}

class LoadedHabitsState extends HabitsState {
  final List<Habit> habits;

  LoadedHabitsState(this.habits);
}

class ErrorHabitsState extends HabitsState {
  final String message;

  ErrorHabitsState(this.message);
}
