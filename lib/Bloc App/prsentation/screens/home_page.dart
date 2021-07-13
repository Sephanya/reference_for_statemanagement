

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_getx_bloc_provider/Bloc%20App/cubit/home_cubit.dart';
import 'package:state_getx_bloc_provider/Bloc%20App/cubit/home_state.dart';
import 'package:state_getx_bloc_provider/Bloc%20App/model/model_class.dart';
import 'package:state_getx_bloc_provider/Widgets/FloatingButton.dart';
import 'package:state_getx_bloc_provider/Widgets/custom_text.dart';

import 'add_item_screen.dart';
import 'update_item_screen.dart';


class BlocHomePage extends StatelessWidget {
  final String title;
  final Axis scrollDirection;
  BlocHomePage({Key? key, required this.title, required this.scrollDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CubitHome>().fetchData();

    return Scaffold(
        appBar:  AppBar(title: Text('Bloc State'),),
        body: BlocBuilder<CubitHome, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }
            if (state is HomeLoaded) {
              List<DataModel>  list = state.list;
              if(scrollDirection == Axis.horizontal){
                return horizontalListView(context, list);
              }else{
                return verticalListView(list);
              }
            }
            return Container();
          },
        ),
        floatingActionButton: FloatingButton(scrollDirection: scrollDirection, title: title,)
    );
  }

  ListView verticalListView(List<DataModel> list) {
    return ListView.separated(
      separatorBuilder: (context, position) => SizedBox(
        height: 5.0,
      ),
      itemCount: list.length,
      itemBuilder: (context, position) {
        return Card(
          child: ListTile(
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
                            context.read<CubitHome>().deleteData(position);
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
                                builder: (context) => UpdateItemPage(position: position),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  });
            },
            leading: Text('${list[position].id}'),
            title: Text('${list[position].name}'),
            subtitle: Text('${list[position].title}'),
          ),
        );
      },
    );
  }

  Row horizontalListView(BuildContext context,List<DataModel> list) {
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
                      width: MediaQuery.of(context).size.width * 0.5,
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
                                context.read<CubitHome>().deleteData(position);
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
                                    builder: (context) => UpdateItemPage(position: position),
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