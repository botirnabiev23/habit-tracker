import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/presentation/habit_details/cubit/habit_details_cubit.dart';
import '../../../domain/entities/habit_completion.dart';

class HabitDetailPage extends StatelessWidget {
  final String habitId;

  const HabitDetailPage({super.key, required this.habitId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HabitDetailsCubit, HabitDetailsState>(
        builder: (context, state) {
          if (state is HabitDetailsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is HabitDetailsLoaded) {
            final streak = calculateStreak(state.completions);
            return Column(
              children: [
                Text(state.habit.name),
                Text(state.habit.frequency.name),
                Text('Стрик: $streak дней'),
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}

int calculateStreak(List<HabitCompletion> completions) {
  if (completions.isEmpty) return 0;
  final sorted = completions.map((c) => c.completedDate).toList()..sort((a, b) => b.compareTo(a));

  int streak = 0;
  DateTime check = DateTime.now();

  for (final date in sorted) {
    if (date.year == check.year && date.month == check.month && date.day == check.day) {
      streak++;
      check = check.subtract(Duration(days: 1));
    } else {
      break;
    }
  }
  return streak;
}
