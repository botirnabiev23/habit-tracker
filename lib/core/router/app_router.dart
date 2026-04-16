import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/di/injection.dart';
import 'package:habit_tracker/core/router/route_paths.dart';
import 'package:habit_tracker/presentation/create_habit/pages/create_habit_page.dart';
import 'package:habit_tracker/presentation/habits/bloc/habits_bloc.dart';
import 'package:habit_tracker/presentation/habits/pages/habit_detail_page.dart';
import 'package:habit_tracker/presentation/habits/pages/habits_page.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.habits,
      builder: (context, state) => BlocProvider(
        create: (_) => sl<HabitsBloc>()..add(FetchHabitsEvent()),
        child: HabitsPage(),
      ),
    ),
    GoRoute(
      path: RoutePaths.create,
      builder: (context, state) => CreateHabitPage(),
    ),
    GoRoute(
      path: RoutePaths.habitDetail,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return HabitDetailPage(habitId: id);
      },
    ),
  ],
);
