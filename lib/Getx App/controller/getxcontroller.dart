

import 'package:get/get.dart';
import 'package:state_getx_bloc_provider/Getx%20App/model/model_getx.dart';


class DataController extends GetxController {
  // RxBool isLoading = true.obs;
  RxString name = "".obs;
  RxString description = "".obs;
  RxList<Model>  list = List<Model>.empty(growable: true).obs;
  RxInt id = 0.obs;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<RxList<Model>> fetchDetails() async {
    return list;
  }


  void addData(Model model){
    list.add(model);
    print(list.length);
  }

  void deleteData(int index){
    list.removeAt(index);
  }

  void updateData(Model model,int index){
    list[index] = model;
  }

  Model fetch(int index)  {

    Model model = list[index];
    return model;
  }

}
