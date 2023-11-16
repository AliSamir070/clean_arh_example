import 'package:clean_archticture/features/Posts/data/data_sources/post_datasource.dart';
import 'package:clean_archticture/features/Posts/data/models/PostModel.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/error_handler.dart';

@Named("cache")
@Singleton(as: PostsDatasource)
class PostsCacheDao implements PostsDatasource{

  @override
  Future<Either<List<PostModel>, String>> GetPosts() async{
    try{
      final postsBox = await Hive.openBox<PostModel>("posts");
      List<PostModel> posts = postsBox.values.toList();
      return Left(posts);
    }catch(e){
      return Right(ErrorHandler.handle(e).failure);
    }
  }

}