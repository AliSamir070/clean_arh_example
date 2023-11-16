import 'package:clean_archticture/features/Posts/domain/entities/post_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'PostModel.g.dart';
/// userId : 1
/// id : 1
/// title : "delectus aut autem"
/// completed : false

@HiveType(typeId: 0)
class PostModel extends PostEntity with EquatableMixin,HiveObjectMixin{
  PostModel({
      this.userId,
      this.id,
      super.title,
      super.completed,});

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


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['completed'] = completed;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title];

}