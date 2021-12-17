
import 'package:equatable/equatable.dart';

class UsersEvent extends Equatable{
  UsersEvent([List props = const []]):super(props);
}

class LoadDataUserEvent extends UsersEvent{
  LoadDataUserEvent():super([]);
}

class SearchUserEvent extends UsersEvent{

  String searchText;

  SearchUserEvent(this.searchText):super([]);
}