

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_getx_bloc_provider/Provider%20App/Pprovider_notifier/ItemAddProviderNotifier.dart';
import 'package:state_getx_bloc_provider/Provider%20App/model/model_provider.dart';
import 'package:state_getx_bloc_provider/Widgets/custom_text.dart';
import 'package:state_getx_bloc_provider/Widgets/custom_textfield.dart';
import 'package:state_getx_bloc_provider/Widgets/custombutton_widget.dart';

class AddData extends StatelessWidget {
  TextEditingController namecontroller = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int index =  Provider.of<ItemAddNotifier>(context, listen: false).itemList.length;
    int id;
    if(index == 0){
      id  = 0;
    }else {
      id = Provider
          .of<ItemAddNotifier>(context, listen: false)
          .itemList[index].id;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Provider State'),
        ),
        body:  Container(
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
                  if(namecontroller.text.isNotEmpty && descriptionController.text.isNotEmpty)
                    Provider.of<ItemAddNotifier>(context, listen: false)
                        .addItem( DataModel(
                      name:namecontroller.text, id:id+1, title: descriptionController.text,
                    ),);
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