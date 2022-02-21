import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/chat_message.dart';
import 'package:ringy_flutter/ringy/infrastructure/chat_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'chat_list_event.dart';
part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final ChatRepository repository;

  ChatListBloc(this.repository) : super(ChatListInitial()){
    on<GetChatsEvent>(_onEvent, transformer: sequential());
  }

  FutureOr<void> _onEvent(GetChatsEvent event, Emitter<ChatListState> emit) async {
    emit(ChatsLoadingState());
    print("pppppppppppppppp");
    var result = await repository.getChats();
    print(result);
    emit(result.fold((l) => ChatListErrorState(), (r) => ChatListLoadedState(chats: r)));
  }





  // @override
  // Stream<ChatListState> mapEventToState(
  //   ChatListEvent event,
  // ) async* {
  //   if (event is GetChatsEvent) {
  //     yield ChatsLoadingState();
  //     var result = await repository.getChats();
  //     yield result.fold((l) => ChatListErrorState(), (r) => ChatListLoadedState(chats: r));
  //     // if (result.isLeft()) {
  //     //   yield ChatListErrorState();
  //     // } else {
  //     //   yield ChatListLoadedState(posts: result.getOrElse(() => null));
  //     // }
  //   }
  // }
}
