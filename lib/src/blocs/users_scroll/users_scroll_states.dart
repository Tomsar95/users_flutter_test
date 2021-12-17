

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:users_tomas_sarmiento/src/models/user.dart';

class UsersState extends Equatable{
  UsersState([List props=const[]]):super(props);
}

class OnFetchedUsersState extends UsersState{
  final List<User> users;

  OnFetchedUsersState(this.users)
      :super([users, UniqueKey()]);
}

class OnFetchedUsersInitState extends UsersState{
  OnFetchedUsersInitState():super();
}

class OnSearchUsersState extends UsersState{
  OnSearchUsersState():super();
}

class OnErrorFetchingUsersState extends UsersState{
  OnErrorFetchingUsersState():super();
}

class OnLoadingUsersState extends UsersState{
  OnLoadingUsersState():super();
}