

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_getx_bloc_provider/Getx%20App/controller/getxcontroller.dart';
import 'package:state_getx_bloc_provider/Getx%20App/model/model_getx.dart';
import 'package:state_getx_bloc_provider/Widgets/custom_text.dart';
import 'package:state_getx_bloc_provider/Widgets/custom_textfield.dart';
import 'package:state_getx_bloc_provider/Widgets/custombutton_widget.dart';


class UpdateGetxState extends GetView<DataController> {
  TextEditingController namecontroller = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DataController _controller = Get.find<DataController>();
  int index = Get.find<DataController>().list.length;
  int id;

  UpdateGetxState({required this.id});
  void setText() {
    namecontroller.text = _controller.list[id].name;
    descriptionController.text = _controller.list[id].title;
  }
  @override
  Widget build(BuildContext context) {
    setText();
    return Scaffold(
        appBar: AppBar(
          title: Text('Getx State'),
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
                  _controller.updateData( Model(
                    name:namecontroller.text, id:_controller.list[id].id, title: descriptionController.text,
                  ),id);
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
