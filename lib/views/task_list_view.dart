import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_devoir_groupe3/view_models/app_view_model.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: viewModel.colorWhite,
        ),
        child: ListView.separated(
            padding: const EdgeInsets.all(20),
            separatorBuilder: (context, index){
              return const SizedBox(
                height: 15,
              );
            },
            itemCount: viewModel.numTasks,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  viewModel.deleteTask(index);
                },
                background: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: viewModel.colorLevel1,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                  child: Center(
                    child: Icon(
                      Icons.delete,
                      color: viewModel.colorWhite,
                    ),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: viewModel.colorBackground2,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                  child: ListTile(
                    leading: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                            width: 2,
                            color: viewModel.colorBorder
                        ),
                      ),
                      checkColor: viewModel.colorLevel3,
                      activeColor: viewModel.colorLevel4,
                      value: viewModel.getTaskValue(index),
                      onChanged: (bool? value) {
                        viewModel.setTaskValue(index, value!);
                      },
                    ),
                    title: Text(
                      viewModel.getTaskTitle(index),
                      style: TextStyle(
                        color: viewModel.colorBlack,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            },
        ),
      );
    });
  }
}
