
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_getx_bloc_provider/Getx%20App/controller/getxcontroller.dart';
import 'package:state_getx_bloc_provider/Widgets/custom_text.dart';
import 'package:state_getx_bloc_provider/main.dart';


import 'add_itemgetx_screen.dart';
import 'update_itemgetx_screen.dart';



class GetxHomePage extends GetView<DataController> {
  final String title;
  final Axis scrollDirection;
  final DataController dataController = Get.put(DataController());
  List list = Get.find<DataController>().list;
  GetxHomePage({Key? key, required this.title, required this.scrollDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Getx State'),
        leading: BackButton(
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),);

          },
        ),),
      body: Obx(
            () {
          if (list.isNotEmpty) {
            if (scrollDirection == Axis.horizontal)
              return verticalListView(context);
            else
              return verticalListView1();
          } else
            return Center(child: Text('Please add data'));
        },
      ),
      floatingActionButton: FloatingActionButton(
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
                            builder: (context) => AddGetxState(),
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
                              builder: (context) => GetxHomePage(
                                  title: title, scrollDirection: Axis.vertical),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GetxHomePage(
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
      ),
    );
  }

  ListView verticalListView1() {
    return ListView.separated(
      separatorBuilder: (context, position) => SizedBox(
        height: 10.0,
      ),
      scrollDirection: scrollDirection,
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (context, position) {
        return ListTile(
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
                            controller.deleteData(position);
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
                                builder: (context) => UpdateGetxState(id: position),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  });
            });
      },
    );
  }

  Row verticalListView(BuildContext context) {
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
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Card(
                        margin: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            CustomText(
                              text: '${list[position].id}',
                              padding: 10,
                              alignment: MainAxisAlignment.center,
                            ),
                            CustomText(
                              text: '${list[position].name}',
                              padding: 10,
                              alignment: MainAxisAlignment.center,
                            ),
                            CustomText(
                              text: '${list[position].title}',
                              padding: 10,
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
                                controller.deleteData(position);
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
                                    builder: (context) => UpdateGetxState(id: position),
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
