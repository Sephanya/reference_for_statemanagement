import 'package:flutter/material.dart';

import 'Bloc App/main_bloc.dart';
import 'Getx App/main_getx.dart';
import 'Provider App/main_provider.dart';
import 'Widgets/custom_button.dart';


void main() {
  runApp(MaterialApp(
      home: MyApp()));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30,bottom: 20,left: 20,right: 20),
              child: SizedBox(
                width: 400,
                height: 150,
                child: StateButton(text: 'GetX State', onPressed: (){
                  print("Clicked");
                  Navigator.push(context,  MaterialPageRoute(builder: (context) => MyGetx()),);
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 400,
                height: 150,
                child: StateButton(text: 'Bloc State', onPressed: () {
                  print("Clicked");
                  Navigator.push(context,  MaterialPageRoute(builder: (context) => MyBloc()),);
                }
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 400,
                height: 150,
                child: StateButton(text: 'Provider State', onPressed: (){
                  print("Clicked");
                  Navigator.push(context,  MaterialPageRoute(builder: (context) => MyProvider()),);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

