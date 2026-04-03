import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker_project/shared/util/theme_manager.dart';
import 'package:hive_flutter/adapters.dart';

class HabitChangeNotifier extends ChangeNotifier{
    Box themeBox = Hive.box("ThemeBox");
    late bool isDarkTheme;

    HabitChangeNotifier(){
      _loadTheme();
    }

    void _loadTheme(){
      isDarkTheme = themeBox.get("theme",defaultValue: false);
      notifyListeners();
    }

    void toggleTheme(){
      isDarkTheme = !isDarkTheme;
      themeBox.put("theme", isDarkTheme);
      notifyListeners();
    }

    ThemeData whichTheme(){
      return (isDarkTheme)?darkThemeMode():lightThemeMode();
    }


}