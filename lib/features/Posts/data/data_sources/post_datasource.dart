import 'package:dartz/dartz.dart';

import '../models/PostModel.dart';

abstract class PostsDatasource{
  Future<Either<List<PostModel> , String>> GetPosts();
}