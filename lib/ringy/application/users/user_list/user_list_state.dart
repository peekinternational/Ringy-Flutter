part of 'user_list_bloc.dart';

@immutable
abstract class UserListState {}

class UserListInitial extends UserListState {}

class LoadedState extends UserListState{

  final List<UsersModel> users;

  LoadedState({required this.users});

}

class ErrorState extends UserListState{

}
class LoadingState extends UserListState{}
