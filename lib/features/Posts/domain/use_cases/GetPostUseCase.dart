import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/post_entity.dart';
import '../repositories/posts_repo.dart';

@injectable
class GetPostsUseCase{
  PostsRepo repo;

  @factoryMethod
  GetPostsUseCase(this.repo);

  Future<Either<List<PostEntity>,String>> call()=>repo.GetPosts();
}