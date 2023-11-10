import 'package:clean_archticture/data/api_manager/api_manager.dart';
import 'package:clean_archticture/data/model/PostModel.dart';
import 'package:clean_archticture/data/repository/dao_repository/posts_dao/post_api_datasource.dart';
import 'package:clean_archticture/data/repository/data_repository/posts_repository.dart';
import 'package:clean_archticture/data/utils/error_handler.dart';
import 'package:clean_archticture/data/utils/internet_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../utils/error_responsecode.dart';
@Injectable(as: PostsRepository)
class PostsRepositoryImpl implements PostsRepository{
  PostsDataSource dataSourceApi;
  PostsDataSource dataSourceCache;
  @factoryMethod
  PostsRepositoryImpl(@Named("api") this.dataSourceApi,@Named("cache") this.dataSourceCache);
  @override
  Future<Either<List<PostModel>, String>> FetchPosts() async{
    await InternetChecker.checkConnectivity();
    if(InternetChecker.connectionStatus != ConnectivityResult.none){
      print("Api datasource");
      return await dataSourceApi.FetchPosts();
    }else{
      print("Cache datasource");
      return await dataSourceCache.FetchPosts();
    }
  }


}