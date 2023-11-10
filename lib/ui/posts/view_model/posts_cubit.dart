import 'package:bloc/bloc.dart';
import 'package:clean_archticture/data/repository/dao_repository_implemntation/posts_dao_implementation/posts_api_dao_implementation.dart';
import 'package:clean_archticture/data/repository/dao_repository_implemntation/posts_dao_implementation/posts_cache_dao_implementation.dart';
import 'package:clean_archticture/data/repository/data_repository/posts_repository.dart';
import 'package:clean_archticture/data/repository/data_repository_implementation/posts_repository_implementation.dart';
import 'package:clean_archticture/ui/posts/view_model/posts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../data/model/PostModel.dart';

@injectable
class PostsCubit extends Cubit<PostsStates> {
  @factoryMethod
  PostsCubit(this.repository) : super(PostsInitial());
  PostsRepository repository;
  static PostsCubit get(context)=>BlocProvider.of(context);

  List<PostModel> posts = [];

  void GetAllPosts(){
    emit(PostsLoadingState());
    repository.FetchPosts().then((value){
      value.fold((l){
        posts = l;
        emit(PostsSuccessState());
      }, (r){
        emit(PostsErrorState(r));
      });
    });
  }
}
