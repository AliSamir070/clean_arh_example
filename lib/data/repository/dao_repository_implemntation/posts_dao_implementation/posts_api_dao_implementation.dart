import 'package:clean_archticture/data/repository/dao_repository/posts_dao/post_api_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../api_manager/api_manager.dart';
import '../../../model/PostModel.dart';
import '../../../utils/error_handler.dart';
import '../../../utils/error_responsecode.dart';

@Named("api")
@Singleton(as: PostsDataSource)
class PostsAPiDataSourceImplementation implements PostsDataSource{

  @override
  Future<Either<List<PostModel>, String>> FetchPosts() async{
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