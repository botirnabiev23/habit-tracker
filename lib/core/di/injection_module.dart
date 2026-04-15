import 'package:habit_tracker/data/database/app_database.dart';
import 'package:habit_tracker/data/database/habits_completions_dao.dart';
import 'package:habit_tracker/data/database/habits_dao.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  AppDatabase get database => AppDatabase();

  @singleton
  HabitsDao habitsDao(AppDatabase db) => HabitsDao(db);

  @singleton
  HabitCompletionsDao habitCompletionsDao(AppDatabase db) => HabitCompletionsDao(db);
}
