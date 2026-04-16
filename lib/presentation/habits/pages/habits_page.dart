import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/router/route_paths.dart';
import 'package:habit_tracker/presentation/habits/bloc/habits_bloc.dart';

class HabitsPage extends StatelessWidget {
  const HabitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(RoutePaths.create),
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<HabitsBloc, HabitsState>(
        builder: (context, state) {
          if (state is LoadingHabitsState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is LoadedHabitsState) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.habits.length,
              itemBuilder: (context, index) {
                final habit = state.habits[index];
                return ListTile(
                  title: Text(habit.name),
                  trailing: IconButton(
                    icon: Icon(Icons.check_circle_outline),
                    onPressed: () => context.read<HabitsBloc>().add(
                      ToggleCompletionEvent(
                        habitId: habit.id,
                        date: DateTime.now(),
                      ),
                    ),
                  ),
                  onTap: () => context.push('/habits/${habit.id}'),
                );
              },
            );
          }
          if (state is ErrorHabitsState) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
