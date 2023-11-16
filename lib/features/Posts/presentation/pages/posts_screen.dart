import 'package:clean_archticture/ui/posts/view_model/posts_cubit.dart';
import 'package:clean_archticture/ui/posts/view_model/posts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/DI/dependency_injection.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<PostsCubit>()..GetAllPosts(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<PostsCubit, PostsStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            PostsCubit cubit = PostsCubit.get(context);
            return state is PostsLoadingState
            ?const Center(child: CircularProgressIndicator(),)
            :state is PostsErrorState
            ?const Center(child: Text("Something went wrong",style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.w600
            ),),)
            :ListView.separated(
                itemBuilder: (context, index) => Text(
                    cubit.posts[index].title??"",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 20,),
                itemCount:cubit.posts.length
            );
          },
        ),
      ),
    );
  }
}
