
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_getx_bloc_provider/Bloc%20App/prsentation/screens/add_item_screen.dart';
import 'package:state_getx_bloc_provider/Bloc%20App/prsentation/screens/home_page.dart';
import 'package:state_getx_bloc_provider/Provider%20App/presentation/screens/add_provider_screen.dart';
import 'package:state_getx_bloc_provider/Provider%20App/presentation/screens/home_provider_screen.dart';


class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key? key,
    required this.title,
    required this.scrollDirection,
  }) : super(key: key);

  final String title;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: new Icon(Icons.person_add),
                    title: new Text('Add Person'),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddItemPage(),
                        ),
                      );
                    },
                  ),

                  ListTile(
                    leading: new Icon(Icons.screen_rotation),
                    title: new Text('Orrientation Change'),
                    onTap: () {
                      if (scrollDirection == Axis.horizontal) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocHomePage(
                                title: title, scrollDirection: Axis.vertical),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocHomePage(
                                title: title,
                                scrollDirection: Axis.horizontal),
                          ),
                        );
                      }
                    },
                  ),
                ],
              );
            });
      },
      child: const Icon(Icons.add),
      backgroundColor: Colors.blueGrey,
    );
  }
}
class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({
    Key? key,
    required this.title,
    required this.scrollDirection,
  }) : super(key: key);

  final String title;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: new Icon(Icons.person_add),
                    title: new Text('Add Person'),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddData(),
                        ),
                      );
                    },
                  ),

                  ListTile(
                    leading: new Icon(Icons.screen_rotation),
                    title: new Text('Orrientation Change'),
                    onTap: () {
                      if (scrollDirection == Axis.horizontal) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProviderHomePage(
                                title: title, scrollDirection: Axis.vertical),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProviderHomePage(
                                title: title,
                                scrollDirection: Axis.horizontal),
                          ),
                        );
                      }
                    },
                  ),
                ],
              );
            });
      },
      child: const Icon(Icons.add),
      backgroundColor: Colors.blueGrey,
    );
  }
}