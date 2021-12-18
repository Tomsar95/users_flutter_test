import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_tomas_sarmiento/src/blocs/users_scroll/users_scroll_bloc.dart';
import 'package:users_tomas_sarmiento/src/blocs/users_scroll/users_scroll_events.dart';
import 'package:users_tomas_sarmiento/src/blocs/users_scroll/users_scroll_states.dart';
import 'package:users_tomas_sarmiento/src/common/UI/user_app_bar.dart';
import 'package:users_tomas_sarmiento/src/common/UI/user_tile.dart';
import 'package:users_tomas_sarmiento/src/common/utils/labels.dart';
import 'package:users_tomas_sarmiento/src/common/utils/user_colors.dart';
import 'package:users_tomas_sarmiento/src/common/utils/user_text_styles.dart';
import 'package:users_tomas_sarmiento/src/screens/user_posts_screen.dart';

class MainUsersScreen extends StatefulWidget {
  const MainUsersScreen({Key? key}) : super(key: key);

  @override
  _MainUsersScreenState createState() => _MainUsersScreenState();
}

class _MainUsersScreenState extends State<MainUsersScreen> {
  late UsersBloc usersBloc;
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    usersBloc = UsersBloc();
    usersBloc.add(LoadDataUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UserColors.backGround,
      appBar: const UserAppBar(),
      body: BlocProvider(
        create: (context) => usersBloc,
        child: BlocBuilder(
          bloc: usersBloc,
          builder: builder,
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void userTileTapped(String userId) {
    FocusScope.of(context).unfocus();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserPostsScreen(userId: userId)),
    );
  }

  void searchOperation(String searchText) {
    if (searchText.isNotEmpty) usersBloc.add(SearchUserEvent(searchText));
  }

  Widget builder(BuildContext context, UsersState state) {
    if (state is OnLoadingUsersState) {
      return const LoadingView();
    }
    if (state is OnFetchedUsersState) {
      List<Widget> sliverList = [];
      sliverList.add(
        SliverToBoxAdapter(
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, color: UserColors.principal),
              hintText: UILabels.searchHint,
              hintStyle: UserTextStyles.robotoRegular()
                  .copyWith(color: UserColors.principal),
            ),
            onChanged: searchOperation,
          ),
        ),
      );
      state.users.isEmpty
          ? sliverList.add(const SliverToBoxAdapter(child: EmptyResultsView()))
          : sliverList.add(SliverList(
              delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: _searchController.value.text.isEmpty
                      ? UserTile(
                          user: state.users[index],
                          tileTapped: () =>
                              userTileTapped(state.users[index].id))
                      : UserTile(
                          user: state.users[index],
                          tileTapped: () =>
                              userTileTapped(state.users[index].id)),
                );
              },
              childCount: state.users.length,
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
    if (state is OnErrorFetchingUsersState) {
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

class EmptyResultsView extends StatelessWidget {
  const EmptyResultsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          MessagesLabels.empty,
          textAlign: TextAlign.center,
          style: UserTextStyles.robotoRegular(),
        ),
      ),
    );
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(MessagesLabels.fetchError,
            textAlign: TextAlign.center,
            style: UserTextStyles.robotoRegular()),
      ),
    );
  }
}
