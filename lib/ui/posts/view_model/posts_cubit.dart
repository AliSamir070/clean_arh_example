import 'package:bloc/bloc.dart';
import 'package:clean_archticture/features/Posts/domain/entities/post_entity.dart';
import 'package:clean_archticture/features/Posts/domain/repositories/posts_repo.dart';
import 'package:clean_archticture/features/Posts/domain/use_cases/GetPostUseCase.dart';
import 'package:clean_archticture/ui/posts/view_model/posts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../features/Posts/data/models/PostModel.dart';


@injectable
class PostsCubit extends Cubit<PostsStates> {
  @factoryMethod
  PostsCubit(this.postsUseCase) : super(PostsInitial());
  GetPostsUseCase postsUseCase;
  static PostsCubit get(context)=>BlocProvider.of(context);

  List<PostEntity> posts = [];

  void GetAllPosts(){
    emit(PostsLoadingState());
    postsUseCase.call().then((value){
      value.fold((l){
        posts = l;
        emit(PostsSuccessState());
      }, (r){
        emit(PostsErrorState(r));
      });
    });
  }
}
