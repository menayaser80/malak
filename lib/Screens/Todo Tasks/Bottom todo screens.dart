import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:malak_stem/Cubic/Cubit.dart';

import 'package:malak_stem/Cubic/States.dart';
import 'package:malak_stem/Screens/Todo%20Tasks/todo%20comp.dart';



class Bottomtodo extends StatelessWidget {
  const Bottomtodo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MedicineCubit()
        ..createDatabase()
        ..newTasks
        ..doneTasks
        ..archiveTasks,
      child: BlocConsumer<MedicineCubit, MedicineStates>(
        listener: (context, state) {
          if (state is InsertToDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          MedicineCubit cubit = BlocProvider.of(context);
          return Scaffold(
            backgroundColor: Colors.white,
            key: cubit.scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.white,
elevation: 0.0,
              title: Text(
                cubit.tetle[cubit.currentIndex],
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.sort_rounded,
                  ),
                ),
              ],
            ),
            body: ConditionalBuilder(
              condition:
              state is! GetDatabaseLoadingState ,
              builder: (context) => cubit.scrons[cubit.currentIndex],
              fallback: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  )),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (cubit.formKey.currentState!.validate()) {
                    if (cubit.fabIcon == Icons.add) {
                      cubit
                          .insertToDatabase(
                          title: cubit.titleController.text,
                          time: cubit.timeController.text,
                          date: cubit.dateController.text)
                          .then((value) {
                        showToast(
                          message: 'Task added successfully',
                        );

                        MedicineCubit.get(context).timeController.text = '';
                        MedicineCubit.get(context).titleController.text = '';
                        MedicineCubit.get(context).dateController.text = '';
                      });
                    } else if (cubit.fabIcon == Icons.check) {
                      debugPrint("in editing now");
                      cubit
                          .updateDatabaseTask(
                        id: cubit.taskId,
                        title: cubit.titleController.text,
                        time: cubit.timeController.text,
                        date: cubit.dateController.text,
                      )
                          .then((value) {
                        showToast(
                            message: 'Task edited successfully',
                            color: Colors.blue);
                        cubit.titleController.text = '';
                        cubit.timeController.text = '';
                        cubit.dateController.text = '';
                        Navigator.pop(context);
                      });
                    }
                  }
                } else {
                  cubit.scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: cubit.formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultFormField(
                              controller: cubit.titleController,
                              label: 'Task title',
                              type: TextInputType.text,
                              prefix: Icons.title,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            defaultFormField(
                              controller: cubit.timeController,
                              label: 'Task time',
                              type: TextInputType.none,
                              onTap: () {
                                showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                    .then((value) {
                                  cubit.timeController.text =
                                      value!.format(context).toString();
                                });
                              },
                              prefix: Icons.watch_later_rounded,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            defaultFormField(controller: cubit.dateController,
                              type: TextInputType.datetime,

                              onTap: (){
                                showDatePicker(context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2025-11-26'),
                                ).then((value) {
                                  cubit.dateController.text=DateFormat.yMMMd().format(value!);
                                });
                              },
                              label: 'Task Date',
                              prefix:Icons.calendar_month_outlined,
                            ),
                          ],
                        ),
                      ),
                    ),
                    elevation: 20.0,
                  )
                      .closed
                      .then((value) {
                    debugPrint("cloooseeed");
                    cubit.changeBottomSheetState(
                        isShow: false, icon: Icons.edit);
                  });
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                }
              },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 3.0,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}