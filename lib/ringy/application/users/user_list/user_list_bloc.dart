import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/user_model.dart';
import '../../../infrastructure/_repository.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final Repository repository;

  UserListBloc(this.repository) : super(UserListInitial()){
    on<GetUsersEvent>(_onEvent, transformer: sequential());
  }

  FutureOr<void> _onEvent(GetUsersEvent event, Emitter<UserListState> emit) async {
    emit(LoadingState());
    print("UserListBloc");
    var result = await repository.getUsersList(event.projectId, event.userId);
   // print(result);
    emit(result.fold((l) => ErrorState(), (r) => LoadedState(users: r)));
  }
  FutureOr<void> _onEventUpdate(UpdateUsersEvent event, Emitter<UserListState> emit) async {
    emit(LoadedState(users: event.users));
  }
}
