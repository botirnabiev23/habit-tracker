import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/router/route_paths.dart';
import 'package:habit_tracker/domain/entities/habit.dart';
import 'package:habit_tracker/presentation/create_habit/cubit/create_habit_cubit.dart';

class CreateHabitPage extends StatefulWidget {
  const CreateHabitPage({super.key});

  @override
  State<CreateHabitPage> createState() => _CreateHabitPageState();
}

class _CreateHabitPageState extends State<CreateHabitPage> {
  final textController = TextEditingController();
  HabitFrequency selectedFrequency = HabitFrequency.daily;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CreateHabitCubit, CreateHabitState>(
        listener: (context, state) {
          if (state is CreateHabitSuccess) {
            context.go(RoutePaths.habits);
          }
        },
        builder: (context, state) {
          final isLoading = state is CreateHabitLoading;
          return Column(
            children: [
              if (state is CreateHabitError)
                Text(state.message, style: TextStyle(color: Colors.red)),
              TextField(controller: textController),
              const SizedBox(height: 20),
              DropdownButton<HabitFrequency>(
                value: selectedFrequency,
                items: HabitFrequency.values
                    .map((f) => DropdownMenuItem(value: f, child: Text(f.name)))
                    .toList(),
                onChanged: (value) => setState(() => selectedFrequency = value!),
              ),
              const SizedBox(height: 20),
              isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        context.read<CreateHabitCubit>().createHabit(
                          textController.text,
                          selectedFrequency,
                        );
                      },
                      child: Text('Submit'),
                    ),
            ],
          );
        },
      ),
    );
  }
}
