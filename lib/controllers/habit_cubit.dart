import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_project/models/habit_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'habit_state.dart';

class HabitCubit extends Cubit<HabitState> {
  Box habitBox = Hive.box("HabitBox");

  HabitCubit() : super(HabitInitialState());

  static HabitCubit get (context) => BlocProvider.of(context);


  late List<HabitModel> habitList = habitBox.values.cast<HabitModel>().toList() ;

  void addHabit(String habitTitle){
    habitBox.add(HabitModel(habitTitle: habitTitle, isCompletedHabit: false , currentDate: DateTime.now()));
    habitList.add(HabitModel(habitTitle: habitTitle, isCompletedHabit: false, currentDate: DateTime.now()));
    emit(HabitAddState());
  }

  void updateHabit(String newHabitTitle , int habitIndex){
    habitBox.putAt(habitIndex, HabitModel(habitTitle: newHabitTitle, isCompletedHabit: false, currentDate:  habitList[habitIndex].currentDate));
    habitList[habitIndex].habitTitle = newHabitTitle;
    emit(HabitUpdateState());
  }

  void toggleIsCompletedHabit(int habitIndex , bool value){
    habitBox.putAt(habitIndex, HabitModel(habitTitle: habitList[habitIndex].habitTitle, isCompletedHabit: value, currentDate:  habitList[habitIndex].currentDate));
    habitList[habitIndex].isCompletedHabit = value;
    emit(HabitToggleIsCompletedHabitState());
  }

  void deleteHabit(int habitIndex){
    habitBox.deleteAt(habitIndex);
    habitList.removeAt(habitIndex);
    emit(HabitDeleteState());
  }

  void deleteAllHabit(){
    habitBox.clear();
    habitList.clear();
    emit(HabitDeleteAllState());
  }

}
