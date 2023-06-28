import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_devoir_groupe3/view_models/app_view_model.dart';
import 'package:todoapp_devoir_groupe3/views/bottom_sheets/delete_bottom_sheet_view.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child){
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text("Salut 🖐!", style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        )),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(viewModel.user.name, style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text("#${viewModel.user.username}",
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic)
                        ),
                      ),
                    )
                  ],
                )
            ),
            Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child:  SizedBox.fromSize(
                    size: const Size(55, 55),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Material(
                        color: viewModel.colorBackground2,
                        child: InkWell(
                          splashColor: viewModel.colorBackground2,
                          onTap: () {
                            viewModel.bottomSheetBuilder(const DeleteBottomSheetView(), context);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.delete_outline, color: viewModel.colorBlack), // <-- Icon
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
      );
    });
  }
}
