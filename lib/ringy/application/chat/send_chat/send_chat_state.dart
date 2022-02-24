part of 'send_chat_bloc.dart';

@immutable
abstract class SendChatState {}

class SendChatInitial extends SendChatState {}

class LoadedState extends SendChatState{
  final ChatModel chats;

  LoadedState({required this.chats});

}

class ErrorState extends SendChatState{

}
class LoadingState extends SendChatState{}
