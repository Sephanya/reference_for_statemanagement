


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/home_getx_screen.dart';

class MyGetx extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tx State',
      home: GetxHomePage(scrollDirection: Axis.vertical, title: 'Getx State',),
    );
  }

}