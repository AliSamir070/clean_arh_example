import 'package:clean_archticture/data/model/PostModel.dart';
import 'package:clean_archticture/data/repository/dao_repository/posts_dao/post_api_datasource.dart';
import 'package:clean_archticture/data/utils/error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Named("cache")
@Singleton(as: PostsDataSource)
class PostsCacheDaoImpl implements PostsDataSource{
  @override
  Future<Either<List<PostModel>, String>> FetchPosts() async{
    try{
      final postsBox = await Hive.openBox<PostModel>("posts");
      List<PostModel> posts = postsBox.values.toList();
      return Left(posts);
    }catch(e){
      return Right(ErrorHandler.handle(e).failure);
    }
  }


}