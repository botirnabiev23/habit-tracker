import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/presentation/habits/bloc/habits_bloc.dart';

class HabitsPage extends StatelessWidget {
  const HabitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HabitsBloc, HabitsState>(
        builder: (context, state) {
          if (state is LoadingHabitsState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is LoadedHabitsState) {
            return ListView.builder(
              itemCount: state.habits.length,
              itemBuilder: (context, index) {
                final habit = state.habits[index];
                return ListTile(title: Text(habit.name));
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
