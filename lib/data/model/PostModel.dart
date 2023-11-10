import 'package:hive/hive.dart';
part 'PostModel.g.dart';
/// userId : 1
/// id : 1
/// title : "delectus aut autem"
/// completed : false
@HiveType(typeId: 0)
class PostModel extends HiveObject{
  PostModel({
      this.userId, 
      this.id, 
      this.title, 
      this.completed,});

  PostModel.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }
  @HiveField(0)
  int? userId;
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? title;
  @HiveField(3)
  bool? completed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['completed'] = completed;
    return map;
  }

}