import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/chat_message.dart';
import 'package:ringy_flutter/ringy/infrastructure/_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../connect/ring_list/ring_list_bloc.dart';

part 'chat_list_event.dart';
part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final Repository repository;

  ChatListBloc(this.repository) : super(ChatListInitial()){
    on<GetChatsEvent>(_onEvent, transformer: sequential());
    on<UpdateChatsEvent>(_onEventUpdate, transformer: sequential());
  }

  FutureOr<void> _onEvent(GetChatsEvent event, Emitter<ChatListState> emit) async {
    emit(ChatsLoadingState());
    print("pppppppppppppppp");
    var result = await repository.getChats(event.senderId,event.receiverId,event.limit);
    print(result);
    emit(result.fold((l) => ChatListErrorState(), (r) => ChatListLoadedState(chats: r)));
  }
  FutureOr<void> _onEventUpdate(UpdateChatsEvent event, Emitter<ChatListState> emit) async {
    emit(ChatListLoadedState(chats: event.chats));
  }

}
