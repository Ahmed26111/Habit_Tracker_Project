import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_project/controllers/habit_change_notifer.dart';
import 'package:habit_tracker_project/controllers/habit_cubit.dart';
import 'package:habit_tracker_project/layout/home_screen.dart';
import 'package:habit_tracker_project/layout/intro_screen.dart';
import 'package:habit_tracker_project/models/habit_adapter.dart';
import 'package:habit_tracker_project/shared/util/theme_manager.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HabitAdapter());
  await Hive.openBox("HabitBox");
  await Hive.openBox("ThemeBox");
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
            create: (context) => HabitCubit()
        ),

        ChangeNotifierProvider(
            create: (context) => HabitChangeNotifier()
        )
      ],
      child: Consumer<HabitChangeNotifier>(
        builder: (context,theme,_)=> MaterialApp(
          theme:  theme.whichTheme() ,
          debugShowCheckedModeBanner: false,
          home: IntroScreen(),
        ),
      ),
    );
  }
}

