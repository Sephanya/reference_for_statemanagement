// part of 'home_cubit.dart';

import 'package:flutter/cupertino.dart';
import 'package:state_getx_bloc_provider/Bloc%20App/model/model_class.dart';


@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<DataModel> list;
  HomeLoaded(this.list);
}