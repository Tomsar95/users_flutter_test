
import 'package:equatable/equatable.dart';

class UserPostEvent extends Equatable{
  UserPostEvent([List props = const []]):super(props);
}

class LoadUserPostsEvent extends UserPostEvent{

  String userId;

  LoadUserPostsEvent(this.userId):super([]);
}