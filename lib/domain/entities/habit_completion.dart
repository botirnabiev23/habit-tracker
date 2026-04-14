import 'package:equatable/equatable.dart';

class HabitCompletion extends Equatable {
  final String habitId;
  final String id;
  final DateTime completedDate;

  const HabitCompletion({required this.habitId, required this.id, required this.completedDate});

  @override
  List<Object?> get props => [habitId, id, completedDate];

  HabitCompletion copyWith({
    String? id,
    String? habitId,
    DateTime? completedDate,
  }) {
    return HabitCompletion(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      completedDate: completedDate ?? this.completedDate,
    );
  }
}
