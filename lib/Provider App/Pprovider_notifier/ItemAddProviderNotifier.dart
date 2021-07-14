


import 'package:flutter/cupertino.dart';
import 'package:state_getx_bloc_provider/Provider%20App/model/model_provider.dart';


class ItemAddNotifier extends ChangeNotifier {
  //
  List<DataModel> itemList = [];

  addItem(DataModel item) async {
    itemList.add(item);
    notifyListeners();
  }

  updateItem(DataModel item,int position) async {
    itemList[position] = item;
    notifyListeners();
  }

  deleteItem(int index) async {
    itemList.removeAt(index);
    notifyListeners();
  }
}