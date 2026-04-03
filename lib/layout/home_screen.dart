import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:habit_tracker_project/controllers/habit_change_notifer.dart';
import 'package:habit_tracker_project/controllers/habit_cubit.dart';
import 'package:habit_tracker_project/models/habit_model.dart';
import 'package:habit_tracker_project/shared/util/colors_manager.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

   //? Attributes of keys
   final GlobalKey<FormState> _formKey = GlobalKey();
   final TextEditingController _titleController = TextEditingController();
   final TextEditingController _updateTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: HabitCubit.get(context),
      builder: (context,state) {
        var cubit = HabitCubit.get(context);
        return Scaffold(
        appBar: AppBar(
          title: Text("Habit Tracker"),
          actions: [
            Consumer<HabitChangeNotifier>(
              builder: (context,theme,_)=>IconButton(
                  onPressed: () {
                    theme.toggleTheme();
                  },
                  icon: Icon(Icons.nightlight_round),
                  iconSize: 35,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeatMap(
                  colorsets: {
                    0:Theme.of(context).scaffoldBackgroundColor,
                    1:Theme.of(context).scaffoldBackgroundColor,
                    2:Theme.of(context).scaffoldBackgroundColor,
                    3:Theme.of(context).scaffoldBackgroundColor,
                    4:Theme.of(context).scaffoldBackgroundColor,
                    5:Theme.of(context).scaffoldBackgroundColor,
                    6:Theme.of(context).scaffoldBackgroundColor,
                    7:Theme.of(context).scaffoldBackgroundColor,
                    8:Theme.of(context).scaffoldBackgroundColor,
                    9:Theme.of(context).scaffoldBackgroundColor,
                    10:Theme.of(context).scaffoldBackgroundColor
                  },

                  startDate:
                  (cubit.habitList.isEmpty)
                  ? DateTime.now().subtract(Duration(days: DateTime.now().weekday%7)) //! If the list is empty he will get the current week date
                  : cubit.habitList.last.currentDate.subtract(Duration(days: cubit.habitList.last.currentDate.weekday %7 )),//* Always get Sunday

                  endDate:
                  (cubit.habitList.isEmpty)
                      ? DateTime.now()
                      : cubit.habitList.last.currentDate,

                  size: 25,
                  showText: true,
                  scrollable: true,
                  defaultColor: Theme.of(context).primaryColorLight,
                  textColor: Theme.of(context).primaryColorDark,
                  showColorTip: false,//? To remove the less and more word
              ),

              if(cubit.habitList.isEmpty)
                ListTile(
                  title: Center(child: Text("No habits yet!" ,style: Theme.of(context).textTheme.bodySmall)),
                  subtitle: Center(child: Text("Tap + to add your first habit.",style: Theme.of(context).textTheme.titleMedium)),
                  tileColor: Theme.of(context).scaffoldBackgroundColor,
                )
              else
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cubit.habitList.length,
                  itemBuilder: (context,index){
                    return Slidable(
                      endActionPane: ActionPane(
                          motion: StretchMotion(),
                          children: [
                            SlidableAction(
                                onPressed: (context){
                                  showDialog(
                                      context: context,
                                      builder: (context){
                                        return AlertDialog(
                                          content: Form(
                                              key: _formKey,
                                              child: TextFormField(
                                                controller: _updateTitleController,
                                                decoration: InputDecoration(
                                                  hint: Text("Habit Title"),
                                                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).dividerColor,width: 2)),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).disabledColor,width: 2)),
                                                  errorBorder: OutlineInputBorder(borderSide: BorderSide(color:  Theme.of(context).cardColor,width: 2)),

                                                ),
                                                validator: (value){
                                                  if(value == null || value.isEmpty){
                                                    return "This Field is required";
                                                  }
                                                  return null;
                                                },
                                              )
                                          ),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: (){
                                                  if(_formKey.currentState!.validate()) {
                                                    cubit.updateHabit(_updateTitleController.text,index);
                                                    _updateTitleController.clear();
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: Text("Save",style: Theme.of(context).textTheme.bodyLarge)
                                            ),
                                            ElevatedButton(
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Cancel",style: Theme.of(context).textTheme.bodyLarge)
                                            ),
                                          ],
                                        );
                                      }
                                  );
                                },
                                backgroundColor: Theme.of(context).hintColor,
                                foregroundColor:  Theme.of(context).canvasColor,
                                label: "Edit",
                                icon: Icons.edit,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(8) , bottomLeft:  Radius.circular(8) ),

                            ),
                            SlidableAction(
                                onPressed: (context){
                                  cubit.deleteHabit(index);
                                },
                                backgroundColor: Theme.of(context).cardColor,
                                foregroundColor:  Theme.of(context).canvasColor,
                                label: "Delete",
                                icon: Icons.delete,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(8) , bottomRight:  Radius.circular(8) ),
                            ),
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                        child: ListTile(
                            leading: Checkbox(
                              value: cubit.habitList[index].isCompletedHabit,
                              onChanged: (value){
                                cubit.toggleIsCompletedHabit(index,value!);
                              },
                            ),
                            title: Text(cubit.habitList[index].habitTitle),
                            subtitle: Text(DateFormat('dd/MM/yyyy - hh:mm').format(cubit.habitList[index].currentDate)),
                            trailing: Icon(Icons.arrow_back_outlined),
                        ),
                      )
                    );
                  },

              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity, // Makes the button stretch horizontally
                  child: FilledButton(
                      onPressed: (){
                        cubit.deleteAllHabit();
                      },
                      child: Text(
                        "Delete All Habits",
                        style: Theme.of(context).textTheme.titleLarge
                      )
                  )
                )
                ,
              )
              ,
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      content: Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              hint: Text("Habit Title"),
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).dividerColor,width: 2)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).disabledColor,width: 2)),
                              errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).cardColor,width: 2)),

                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "This Field is required";
                              }
                              return null;
                            },
                          )
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: (){
                              if(_formKey.currentState!.validate()) {
                                cubit.addHabit(_titleController.text);
                                _titleController.clear();
                                Navigator.pop(context);
                              }
                            },
                            child: Text("Save",style: Theme.of(context).textTheme.bodyLarge)
                        ),
                        ElevatedButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text("Cancel",style: Theme.of(context).textTheme.bodyLarge,)
                        ),
                      ],
                    );
                  }
              );
            },
            child: Icon(Icons.add),
        ),
      );
      },
    );
  }


}
