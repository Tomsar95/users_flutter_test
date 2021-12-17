import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_tomas_sarmiento/src/blocs/users_scroll/users_scroll_events.dart';
import 'package:users_tomas_sarmiento/src/blocs/users_scroll/users_scroll_states.dart';
import 'package:users_tomas_sarmiento/src/common/utils/global_variables.dart';
import 'package:users_tomas_sarmiento/src/common/utils/utils.dart';
import 'package:users_tomas_sarmiento/src/models/user.dart';

class UsersBloc extends Bloc<UsersEvent,UsersState> {

  final _repo = Utils.repository;
  late final List<User> users;
  final List<User> searchUsers = [];

  @override
  UsersState get initialState => OnLoadingUsersState();

  @override
  Stream<UsersState> mapEventToState(UsersEvent event) async* {
    if (event is LoadDataUserEvent) {
      yield OnLoadingUsersState();
      if(GlobalVariables.usersData.isEmpty){
        var data = await _repo.fetchUsers();
        if (data.success ?? false) {
          users = data.body;
          GlobalVariables.usersData = users;
          Utils.sharedPreferencesManager.setUsersData(users);
          yield OnFetchedUsersState(users);
        } else {
          yield OnErrorFetchingUsersState();
        }
      }else{
        var users = GlobalVariables.usersData;
        yield OnFetchedUsersState(users);
      }
    }
    if(event is SearchUserEvent) {
      if(event.searchText.isNotEmpty){
        searchUsers.clear();
        for (var user in users) {
          if(user.name.toLowerCase().contains(event.searchText)){
            searchUsers.add(user);
          }
        }
        yield OnFetchedUsersState(searchUsers);
      }else{
        yield OnFetchedUsersState(users);
      }
    }
  }

}