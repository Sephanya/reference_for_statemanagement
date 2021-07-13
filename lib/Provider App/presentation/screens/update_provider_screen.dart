
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_getx_bloc_provider/Provider%20App/Pprovider_notifier/ItemAddProviderNotifier.dart';
import 'package:state_getx_bloc_provider/Provider%20App/model/model_provider.dart';
import 'package:state_getx_bloc_provider/Widgets/custom_text.dart';
import 'package:state_getx_bloc_provider/Widgets/custom_textfield.dart';
import 'package:state_getx_bloc_provider/Widgets/custombutton_widget.dart';

class UpdateProviderPage extends StatelessWidget {
  TextEditingController namecontroller = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  int position;
  int? id;
  UpdateProviderPage({required this.position});
  void setText(BuildContext context) {
    id =  Provider.of<ItemAddNotifier>(context, listen: false).itemList[position].id;
    namecontroller.text = Provider.of<ItemAddNotifier>(context, listen: false).itemList[position].name;
    descriptionController.text =Provider.of<ItemAddNotifier>(context, listen: false).itemList[position].title;
  }

  @override
  Widget build(BuildContext context) {
    setText(context);
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
                        .updateItem( DataModel(
                      name:namecontroller.text, id:id!, title: descriptionController.text,
                    ),position);
                  Navigator.pop(context);
                },
                child: CustomText(
                  alignment: MainAxisAlignment.center,
                  text: "Update Data",
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