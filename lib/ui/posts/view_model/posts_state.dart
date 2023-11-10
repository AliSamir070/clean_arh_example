
abstract class PostsStates {}

class PostsInitial extends PostsStates {}
class PostsLoadingState extends PostsStates {}
class PostsSuccessState extends PostsStates {}
class PostsErrorState extends PostsStates {
  String message;
  PostsErrorState(this.message);
}
