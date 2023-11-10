import 'package:clean_archticture/data/model/PostModel.dart';
import 'package:dartz/dartz.dart';

abstract class PostsRepository{

  Future<Either<List<PostModel>, String>> FetchPosts();

}