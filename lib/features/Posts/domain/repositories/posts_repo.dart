import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/post_entity.dart';

abstract class PostsRepo{
  Future<Either<List<PostEntity>,String>> GetPosts();
}