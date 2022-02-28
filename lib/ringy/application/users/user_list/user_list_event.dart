part of 'user_list_bloc.dart';

@immutable
abstract class UserListEvent {}
class GetUsersEvent extends UserListEvent{

 final String projectId;
  final String userId;

  GetUsersEvent(this.projectId, this.userId);
}
class UpdateUsersEvent extends UserListEvent{

  final List<UsersModel> users;

  UpdateUsersEvent(this.users);
}

class GetUsersFromLocalDbEvent extends UserListEvent{
 final String projectId;
 final String userId;
 GetUsersFromLocalDbEvent(this.projectId, this.userId);
}
