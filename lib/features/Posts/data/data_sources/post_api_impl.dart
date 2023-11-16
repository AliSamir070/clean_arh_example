import 'package:clean_archticture/features/Posts/data/data_sources/post_datasource.dart';
import 'package:clean_archticture/features/Posts/data/models/PostModel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/error_responsecode.dart';

@Named("api")
@Singleton(as: PostsDatasource)
class PostsApiDao implements PostsDatasource{
  @override
  Future<Either<List<PostModel>, String>> GetPosts() async{
    try{
      Response? response = await ApiManager.GetPosts();
      if(response?.statusCode == 200){
        List<PostModel> posts = [];
        response?.data.forEach((post){
          posts.add(PostModel.fromJson(post));
        });
        final postsBox = await Hive.openBox<PostModel>("posts");
        postsBox.addAll(posts);
        return Left(posts);
      }else{
        return Right(ErrorResponseCode.CheckError(response?.statusCode));
      }
    }catch(e){
      return Right(ErrorHandler.handle(e).failure);
    }
  }


}