import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_devoir_groupe3/view_models/app_view_model.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child){
      return Row(
        children: [
           Expanded(
             flex: 3,
             child: Container(color: Colors.red,)
           ),
           Expanded(
             flex: 1,
             child: Container(color: Colors.blue,)
           ),
           Expanded(
             flex: 1,
             child: Container(color: Colors.purple ,)
           ),
        ],
      );
    });
  }
}
