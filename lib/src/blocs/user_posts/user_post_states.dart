import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:users_tomas_sarmiento/src/models/user_post.dart';

class PostsState extends Equatable{
  PostsState([List props=const[]]):super(props);
}

class OnFetchedPostsState extends PostsState{
  final List<UserPost> posts;

  OnFetchedPostsState(this.posts)
      :super([posts, UniqueKey()]);
}

class OnFetchedUserPostsInitState extends PostsState{
  OnFetchedUserPostsInitState():super();
}

class OnErrorFetchingPostsState extends PostsState{
  OnErrorFetchingPostsState():super();
}

class OnLoadingPostsState extends PostsState{
  OnLoadingPostsState():super();
}