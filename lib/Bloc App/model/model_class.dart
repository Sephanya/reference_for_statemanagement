

class DataModel {
  final String title;
  final String name;
  final int id ;

  DataModel({required this.id
    ,required this.name
    ,required this.title});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return new DataModel(
      id : json['id'],
      name: json['title'],
      title: json['docid'],
    );
  }

}