import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malak_stem/Cubic/Cubit.dart';
import 'package:malak_stem/Cubic/States.dart';
import 'package:malak_stem/Screens/Todo%20Tasks/todo%20comp.dart';


class NewTasks extends StatelessWidget {
  const NewTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<MedicineCubit,MedicineStates>(
      listener: (context, state){},
      builder: (context,state){
        var tasks = MedicineCubit.get(context).newTasks;
        return taskBuilder(
          tasks: tasks,
        );
      },
    );
  }
}
