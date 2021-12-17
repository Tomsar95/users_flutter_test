import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_tomas_sarmiento/src/blocs/user_posts/user_post_events.dart';
import 'package:users_tomas_sarmiento/src/blocs/user_posts/user_post_states.dart';
import 'package:users_tomas_sarmiento/src/blocs/user_posts/user_posts_bloc.dart';
import 'package:users_tomas_sarmiento/src/common/UI/post_tile.dart';
import 'package:users_tomas_sarmiento/src/common/UI/user_app_bar.dart';
import 'package:users_tomas_sarmiento/src/common/utils/labels.dart';
import 'package:users_tomas_sarmiento/src/common/utils/user_colors.dart';

class UserPostsScreen extends StatefulWidget {
  const UserPostsScreen({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  _UserPostsScreenState createState() => _UserPostsScreenState();
}

class _UserPostsScreenState extends State<UserPostsScreen> {

  late UserPostBloc userPostsBloc;

  @override
  void initState() {
    userPostsBloc = UserPostBloc();
    userPostsBloc.add(LoadUserPostsEvent(widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UserColors.backGround,
      appBar: const UserAppBar(),
      body: BlocProvider(
        create: (context) => userPostsBloc,
        child: BlocBuilder(
          bloc: userPostsBloc,
          builder: builder,
        ),
      ),
    );
  }

  Widget builder(BuildContext context, PostsState state) {
    if (state is OnLoadingPostsState) {
      return const LoadingView();
    }
    if (state is OnFetchedPostsState) {
      List<Widget> sliverList = [];
      sliverList.add(SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: PostTile(
                  post: state.posts[index],
                  index: index,
                ),
              );
            },
            childCount: state.posts.length,
          )));
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: false,
          slivers: sliverList,
        ),
      );
    }
    if (state is OnErrorFetchingPostsState) {
      return const ErrorView();
    }
    return const ErrorView();
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(MessagesLabels.fetchError, textAlign: TextAlign.center,),
      ),
    );
  }
}

