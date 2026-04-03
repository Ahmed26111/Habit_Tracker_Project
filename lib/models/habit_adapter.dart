import 'package:habit_tracker_project/models/habit_model.dart';
import 'package:hive/hive.dart';

class HabitAdapter extends TypeAdapter<HabitModel>{


  @override
  HabitModel read(BinaryReader reader) {
    return HabitModel(
        habitTitle: reader.readString(),
        isCompletedHabit: reader.readBool(),
        currentDate: reader.read() as DateTime,//! Explicit Casting from Dynamic to DateTime
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, HabitModel obj) {
    writer.writeString(obj.habitTitle);
    writer.writeBool(obj.isCompletedHabit);
    writer.write(obj.currentDate);//! Implicit Casting from Dynamic to DateTime
  }


}