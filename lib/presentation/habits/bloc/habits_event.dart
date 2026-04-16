part of 'habits_bloc.dart';

@immutable
sealed class HabitsEvent {}

class FetchHabitsEvent extends HabitsEvent {}

class ToggleCompletionEvent extends HabitsEvent {
  final String habitId;
  final DateTime date;

  ToggleCompletionEvent({required this.habitId, required this.date});
}
