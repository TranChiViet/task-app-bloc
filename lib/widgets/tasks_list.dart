import 'package:flutter/material.dart';
import '/widgets/task_tile.dart';

import '../models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList.map((task) => ExpansionPanelRadio(
                value: task.id,
                headerBuilder: (context, isOpen)=> TaskTile(task: task),
                body: ListTile(
                  title: SelectableText.rich(TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Text\n',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: task.title),
                      const TextSpan(
                        text: '\n\nDescription\n',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: task.description),
                    ]
                  )),
                ),
              )).toList(),
        ),
      ),
    );
  }
}


// Expanded(
//       child: ListView.builder(
//           itemCount: taskList.length,
//           itemBuilder: ((context, index) {
//             var task = taskList[index];
//             return TaskTile(task: task);
//           })),
//     );