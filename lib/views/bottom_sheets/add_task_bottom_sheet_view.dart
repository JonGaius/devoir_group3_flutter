import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_devoir_groupe3/models/task_model.dart';
import 'package:todoapp_devoir_groupe3/view_models/app_view_model.dart';

class AddTaskBottomSheetView extends StatelessWidget {
  const AddTaskBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      var hauteurEcran = MediaQuery.of(context).size.height;
      var largeurEcran = MediaQuery.of(context).size.width;
      final TextEditingController entryController = TextEditingController();

      return SizedBox(
        height: hauteurEcran,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              width: largeurEcran * 0.8,
              child: TextField(
                onSubmitted: (value) {
                  if(entryController.text.isNotEmpty){
                    Task newTask = Task(entryController.text, false);
                    viewModel.addTask(newTask);
                    entryController.clear();
                  }
                  Navigator.of(context).pop();
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(bottom: 5),
                  filled: true,
                  fillColor: viewModel.colorWhite,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none
                    )
                  )
                ),
                autofocus: true,
                autocorrect: false,
                textAlign: TextAlign.center,
                cursorColor: viewModel.colorLevel3,
                textAlignVertical: TextAlignVertical.center,
                controller: entryController,
                style: TextStyle(
                    color: viewModel.colorLevel4,
                    fontWeight: FontWeight.w500,
                    fontSize: 24
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
