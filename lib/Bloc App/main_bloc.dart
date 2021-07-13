

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'cubit/home_cubit.dart';
import 'prsentation/screens/home_page.dart';

class MyBloc extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> CubitHome(),
      child: MaterialApp(
        title: 'Bloc State',
        home: BlocHomePage(title: 'Bloc App ', scrollDirection: Axis.vertical,
      ),
      )
    );
  }

}