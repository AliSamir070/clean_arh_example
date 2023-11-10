import 'package:dartz/dartz.dart';

import '../../../model/PostModel.dart';

abstract class PostsDataSource{
  Future<Either<List<PostModel>, String>> FetchPosts();
}