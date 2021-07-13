
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pprovider_notifier/ItemAddProviderNotifier.dart';
import 'presentation/screens/home_provider_screen.dart';

class MyProvider extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ItemAddNotifier>(
      create: (BuildContext context) {
        return ItemAddNotifier();
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ProviderHomePage(scrollDirection: Axis.vertical,title: 'Provider App',)
      ),
    );
  }
}