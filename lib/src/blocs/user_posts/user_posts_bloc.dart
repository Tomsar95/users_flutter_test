

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_tomas_sarmiento/src/blocs/user_posts/user_post_events.dart';
import 'package:users_tomas_sarmiento/src/blocs/user_posts/user_post_states.dart';
import 'package:users_tomas_sarmiento/src/common/utils/utils.dart';
import 'package:users_tomas_sarmiento/src/models/user_post.dart';

class UserPostBloc extends Bloc<UserPostEvent,PostsState> {

  final _repo = Utils.repository;
  late final List<UserPost> posts;

  @override
  PostsState get initialState => OnLoadingPostsState();

  @override
  Stream<PostsState> mapEventToState(UserPostEvent event) async* {
    if (event is LoadUserPostsEvent) {
      yield OnLoadingPostsState();
      var data = await _repo.fetchUserPosts(event.userId);
      if (data.success ?? false) {
        posts = data.body;
        yield OnFetchedPostsState(posts);
      } else {
        yield OnErrorFetchingPostsState();
      }
    }
  }

}