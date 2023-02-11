import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/tasks_list.dart';
import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
static const routeName= 'recycle_bin_screen';
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
              return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              PopupMenuItem(
                  onTap: ()=>context.read<TasksBloc>().add(DeleteAllTasks()),
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete_forever),
                    label: const Text('Delete All Tasks'),
                  ),
                ),
            ],
          ),
          drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.removedTasks.length} Tasks',
                  ),
                ),
              ),
              TasksList(taskList: state.removedTasks)
            ],
          ),
         
        );
    });
  }
}