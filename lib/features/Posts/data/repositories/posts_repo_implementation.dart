import 'package:clean_archticture/features/Posts/domain/entities/post_entity.dart';
import 'package:clean_archticture/features/Posts/domain/repositories/posts_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/internet_checker.dart';
import '../data_sources/post_datasource.dart';
@Injectable(as: PostsRepo)
class PostsRepoImp implements PostsRepo{
  PostsDatasource apiDao;
  PostsDatasource cacheDao;

  @factoryMethod
  PostsRepoImp(@Named("api") this.apiDao, @Named("cache") this.cacheDao);

  @override
  Future<Either<List<PostEntity>, String>> GetPosts() async{
    await InternetChecker.checkConnectivity();
    if(InternetChecker.connectionStatus != ConnectivityResult.none){
      print("Api datasource");
      return await apiDao.GetPosts();
    }else{
      print("Cache datasource");
      return await cacheDao.GetPosts();
    }
  }

}