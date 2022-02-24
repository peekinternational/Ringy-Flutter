import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';
import 'package:ringy_flutter/ringy/application/chat/chat_list_bloc/chat_list_bloc.dart';

import '../../../domain/entities/chat_message/chat_message.dart';
import '../../../infrastructure/_repository.dart';

part 'send_chat_event.dart';
part 'send_chat_state.dart';

class SendChatBloc extends Bloc<SendChatEvent, SendChatState> {
  final Repository repository;

  SendChatBloc(this.repository) : super(SendChatInitial()) {
    on<SendChatsEvent>(_onEvent, transformer: sequential());
  }


  FutureOr<void> _onEvent(SendChatsEvent event,
      Emitter<SendChatState> emit) async {
    emit(LoadingState());
    print("pppppppppppppppp");
    var result = await repository.sendMessage(event.model);
    print(result);
    emit(result.fold((l) => ErrorState(), (r) =>
        LoadedState(chats: r)));
  }
}


