

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StateButton extends StatelessWidget{
  final String text;
  final Function() onPressed;

  StateButton({required this.text,required this.onPressed});
  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey),
        ),
        child: Text(text, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
        )
    );

  }

}