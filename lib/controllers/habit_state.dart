part of 'habit_cubit.dart';

@immutable
sealed class HabitState {}

final class HabitInitialState extends HabitState {}

final class HabitAddState extends HabitState {}

final class HabitUpdateState extends HabitState {}

final class HabitToggleIsCompletedHabitState extends HabitState {}

final class HabitDeleteState extends HabitState {}

final class HabitDeleteAllState extends HabitState {}
