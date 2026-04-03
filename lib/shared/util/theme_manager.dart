import 'package:flutter/material.dart';
import 'package:habit_tracker_project/shared/util/colors_manager.dart';

ThemeData lightThemeMode (){
  return ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: ColorsManager.gold1,
        foregroundColor: ColorsManager.white,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25
        ),
        centerTitle: true,
        elevation: 10,
        shadowColor: ColorsManager.gold3,
    ) ,
    scaffoldBackgroundColor: ColorsManager.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.gold1,
      foregroundColor: ColorsManager.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: ColorsManager.white,
      tileColor: ColorsManager.gold2,
      contentPadding: EdgeInsets.symmetric(vertical: 18,horizontal: 13),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      titleTextStyle: TextStyle(fontWeight: FontWeight.w700 , fontSize: 20),
      textColor: ColorsManager.white,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.resolveWith((widgetState){
        return ColorsManager.white;
      }),
      fillColor:  WidgetStateProperty.resolveWith((widgetState){
        return ColorsManager.gold3;
      }),
      side: WidgetStateBorderSide.resolveWith(
            (states) => BorderSide(width: 1.5, color:  ColorsManager.white),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
          backgroundColor: ColorsManager.red, // A color to signify a destructive action
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: ColorsManager.gold3,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style:  ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.gold2
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: ColorsManager.white,fontWeight: FontWeight.bold),
      bodyMedium:  TextStyle(color: ColorsManager.white),
      titleLarge: TextStyle(color: ColorsManager.white,fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: ColorsManager.black,fontSize: 18),
      bodySmall: TextStyle(color: ColorsManager.black,fontSize: 20,fontWeight: FontWeight.bold),
    ),
    primaryColor: ColorsManager.gold1,
    secondaryHeaderColor: ColorsManager.gold2,
    primaryColorLight:  ColorsManager.gold3,
    primaryColorDark:  ColorsManager.black,
    canvasColor:  ColorsManager.white,
    cardColor:  ColorsManager.red,
    hintColor: ColorsManager.gold4,
    dividerColor: ColorsManager.brown1,
    disabledColor: ColorsManager.brown2,
  );
}

ThemeData darkThemeMode (){
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.dark1,
      foregroundColor: ColorsManager.darkWhite,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25
      ),
      centerTitle: true,
      elevation: 8,
      shadowColor: ColorsManager.darkWhite1,
    ) ,
    scaffoldBackgroundColor: ColorsManager.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.dark1,
      foregroundColor: ColorsManager.darkWhite,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: ColorsManager.darkWhite,
      tileColor: ColorsManager.dark2,
      contentPadding: EdgeInsets.symmetric(vertical: 18,horizontal: 13),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      titleTextStyle: TextStyle(fontWeight: FontWeight.w700 , fontSize: 20),
      textColor: ColorsManager.darkWhite,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.resolveWith((widgetState){
        return ColorsManager.darkWhite;
      }),
      fillColor:  WidgetStateProperty.resolveWith((widgetState){
        return ColorsManager.dark3;
      }),
      side: WidgetStateBorderSide.resolveWith(
            (states) => BorderSide(width: 1.5, color:  ColorsManager.darkWhite),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
          backgroundColor: ColorsManager.darkRed, // A color to signify a destructive action
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: ColorsManager.dark3,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style:  ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.dark2
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: ColorsManager.darkWhite,fontWeight: FontWeight.bold),
      bodyMedium:  TextStyle(color: ColorsManager.darkWhite),
      titleLarge: TextStyle(color: ColorsManager.darkWhite,fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: ColorsManager.darkWhite,fontSize: 18),
      bodySmall: TextStyle(color: ColorsManager.darkWhite,fontSize: 20,fontWeight: FontWeight.bold),
    ),
    primaryColor: ColorsManager.dark1,
    secondaryHeaderColor: ColorsManager.dark2,
    primaryColorLight:  ColorsManager.dark3,
    primaryColorDark:  ColorsManager.darkWhite,
    canvasColor:  ColorsManager.darkWhite,
    cardColor:  ColorsManager.darkRed,
    hintColor: ColorsManager.dark4,
    dividerColor: ColorsManager.darkWhite,
    disabledColor: ColorsManager.darkWhite1,
  );
}