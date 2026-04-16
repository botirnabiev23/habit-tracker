part of 'habit_details_cubit.dart';

@immutable
sealed class HabitDetailsState {}

final class HabitDetailsInitial extends HabitDetailsState {}

final class HabitDetailsLoading extends HabitDetailsState {}

final class HabitDetailsError extends HabitDetailsState {
  final String message;

  HabitDetailsError(this.message);
}

final class HabitDetailsLoaded extends HabitDetailsState {
  final Habit habit;
  final List<HabitCompletion> completions;

  HabitDetailsLoaded({required this.habit, required this.completions});
}
