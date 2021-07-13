

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_getx_bloc_provider/Bloc%20App/cubit/home_cubit.dart';
import 'package:state_getx_bloc_provider/Bloc%20App/model/model_class.dart';
import 'package:state_getx_bloc_provider/Widgets/custom_text.dart';
import 'package:state_getx_bloc_provider/Widgets/custom_textfield.dart';
import 'package:state_getx_bloc_provider/Widgets/custombutton_widget.dart';


class AddItemPage extends StatelessWidget {
  TextEditingController namecontroller = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    int index = context.read<CubitHome>().list.length;
    return Scaffold(
        appBar: AppBar(
          title: Text('Bloc State'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTextField(
                hintText: 'User Name',
                textEditingController: namecontroller,
                keyBoardType: TextInputType.text,
              ),
              CommonTextField(
                hintText: 'Description',
                textEditingController: descriptionController,
                keyBoardType: TextInputType.text,
              ),
              CustomButtonWidget(
                onPressed: () {
                  context.read<CubitHome>().addData(
                    DataModel(
                      name: namecontroller.text,
                      id: index + 1,
                      title: descriptionController.text,
                    ),
                  );

                  Navigator.pop(context);
                },
                child: CustomText(
                  alignment: MainAxisAlignment.center,
                  text: "Add Data",
                  size: 20,
                  textColor: Colors.white,
                ),
                margin: 20,
              )
            ],
          ),
        ));
  }
}