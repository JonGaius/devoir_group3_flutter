import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_devoir_groupe3/view_models/app_view_model.dart';

class DeleteBottomSheetView extends StatelessWidget {
  const DeleteBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child){
      var largeurEcran = MediaQuery.of(context).size.width;
      return SizedBox(
        height: 320,

        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: FittedBox(
              child: Column(
                children: [
                  const SizedBox(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Icon(Icons.delete_outline, size: 64,),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  SizedBox(
                    width: largeurEcran,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        viewModel.deleteCompletedTasks();
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: viewModel.colorWhite,
                          foregroundColor: viewModel.colorLevel4,
                          textStyle: const TextStyle(
                            fontSize: 18,
                          ),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                  width: 1,
                                  color: viewModel.colorLevel4
                              )
                          )
                      ),
                      child: const Text("Supprimer les tâches accomplies"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: largeurEcran,
                    height: 60,
                    child:  ElevatedButton(
                      onPressed: () {
                        viewModel.deleteAllTasks();
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: viewModel.colorLevel4,
                          foregroundColor: viewModel.colorWhite,
                          textStyle: const TextStyle(
                            fontSize: 18,
                          ),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )
                      ),
                      child: const Text("Supprimer toutes les tâches"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      );
    });
  }
}
