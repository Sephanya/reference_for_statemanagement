
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_getx_bloc_provider/Provider%20App/Pprovider_notifier/ItemAddProviderNotifier.dart';
import 'package:state_getx_bloc_provider/Provider%20App/model/model_provider.dart';
import 'package:state_getx_bloc_provider/Widgets/FloatingButton.dart';
import 'package:state_getx_bloc_provider/Widgets/custom_text.dart';

import '../../../main.dart';
import 'add_provider_screen.dart';
import 'update_provider_screen.dart';


class ProviderHomePage extends StatelessWidget {
  final String title;
  final Axis scrollDirection;
  ProviderHomePage({Key? key, required this.title, required this.scrollDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DataModel> list = Provider.of<ItemAddNotifier>(context, listen: false).itemList;
    return Scaffold(
      appBar: AppBar(title: Text('Provider State'),
        leading: BackButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),);

          },
        ),),
      body:  Consumer<ItemAddNotifier>(
        builder: (context, itemAddNotifier, _)
        {
          if (list.isNotEmpty) {
            if (scrollDirection == Axis.horizontal)
              return horizontalListView(context,list);
            else
              return verticalListView(list);
          } else
            return Center(child: Text('Please add data'));
        },
      ),
      floatingActionButton: FloatingButtonWidget(title: title, scrollDirection: scrollDirection),
    );
  }

  ListView verticalListView(list) {
    return ListView.separated(
      separatorBuilder: (context, position) => SizedBox(
        height: 5.0,
      ),
      scrollDirection: scrollDirection,
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (context, position) {
        return Card(
          child: ListTile(
              leading: Text('${list[position].id}'),
              title: Text('${list[position].name}'),
              subtitle: Text('${list[position].title}'),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: new Icon(Icons.delete),
                            title: new Text('Delete'),
                            onTap: () {
                              Provider.of<ItemAddNotifier>(context, listen: false).deleteItem(position);
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.edit),
                            title: new Text('Update'),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateProviderPage(position: position),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    });
              }),
        );
      },
    );
  }

  Row horizontalListView(BuildContext context,list) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.separated(
              separatorBuilder: (context, position) => SizedBox(
                height: 10.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              shrinkWrap: true,
              itemBuilder: (context, position) {
                return GestureDetector(
                    child: Container(
                      // width: MediaQuery.of(context).size.width * 0.,
                      child: Card(
                        margin: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            CustomText(
                              text: '${list[position].id}',
                              padding: 10,maxLines: 2,
                              alignment: MainAxisAlignment.center,
                            ),
                            CustomText(
                              text: '${list[position].name}',
                              padding: 10,maxLines: 2,
                              alignment: MainAxisAlignment.center,
                            ),
                            CustomText(
                              text: '${list[position].title}',
                              padding: 10,maxLines: 2,
                              alignment: MainAxisAlignment.center,
                            ),
                          ],
                        ),
                      ),
                    ),onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: new Icon(Icons.delete),
                              title: new Text('Delete'),
                              onTap: () {
                                Provider.of<ItemAddNotifier>(context, listen: false).deleteItem(position);
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: new Icon(Icons.edit),
                              title: new Text('Update'),
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateProviderPage(position: position),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      });
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
