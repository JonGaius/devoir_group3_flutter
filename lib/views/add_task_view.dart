import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_devoir_groupe3/view_models/app_view_model.dart';
import 'package:todoapp_devoir_groupe3/views/bottom_sheets/add_task_bottom_sheet_view.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return SizedBox(
        width: 60,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: viewModel.colorLevel4,
            foregroundColor: viewModel.colorWhite,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24)
            ),
            elevation: 0
          ),
          onPressed: () {
            HapticFeedback.heavyImpact();
            viewModel.bottomSheetBuilder(const AddTaskBottomSheetView(), context);
          },
          child: const Icon(Icons.add, size: 30,),),
      );
    });
  }
}
