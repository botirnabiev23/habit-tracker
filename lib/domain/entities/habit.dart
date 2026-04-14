import 'package:equatable/equatable.dart';

enum HabitFrequency { daily, weekly }

class Habit extends Equatable {
  final String id;
  final String name;
  final HabitFrequency frequency;
  final DateTime createdAt;

  const Habit({
    required this.id,
    required this.name,
    required this.frequency,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, frequency, createdAt];

  Habit copyWith({
    String? id,
    String? name,
    HabitFrequency? frequency,
    DateTime? createdAt,
  }) {
    return Habit(
      id: id ?? this.id,
      name: name ?? this.name,
      frequency: frequency ?? this.frequency,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
