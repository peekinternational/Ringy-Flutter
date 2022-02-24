part of 'user_list_bloc.dart';

@immutable
abstract class UserListEvent {}
class GetUsersEvent extends UserListEvent{

  String projectId;
  String userId;

  GetUsersEvent(this.projectId, this.userId);
}
class UpdateUsersEvent extends UserListEvent{

  final List<UsersModel> users;

  UpdateUsersEvent(this.users);
}
