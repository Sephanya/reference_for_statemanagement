
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_getx_bloc_provider/Bloc%20App/model/model_class.dart';

import 'home_state.dart';

class CubitHome extends Cubit<HomeState> {
  CubitHome() : super(HomeInitial());

  List<DataModel> list = [
    DataModel( id:1,name: 'Adon',title: 'Adon is a name'),
    DataModel( id:2,name: 'Aron',title: 'Aron is a name'),
  ];
  fetchData() {
    emit(HomeLoading());
    Future.delayed(Duration(seconds: 1), () => emit(HomeLoaded(list)));
  }

  addData(DataModel dataModel) {
    emit(HomeLoading());
    list.add(dataModel);
    Future.delayed(Duration(seconds: 1), () => emit(HomeLoaded(list)));
  }

  updateData({required DataModel dataModel, required int position}) {
    emit(HomeLoading());
    list[position] = dataModel;
    Future.delayed(Duration(seconds: 1), () => emit(HomeLoaded(list)));
  }

  deleteData(int position) {
    emit(HomeLoading());
    list.removeAt(position);
    Future.delayed(Duration(seconds: 1), () => emit(HomeLoaded(list)));
  }
}