import 'dart:async';

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ringy_flutter/ringy/application/chat/chat_list_bloc/chat_list_bloc.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/chat_message.dart';
import 'package:ringy_flutter/ringy/presentation/core/utils/data_travel_model.dart';
import 'package:ringy_flutter/ringy/presentation/core/widgets/encryption_utils.dart';
import 'package:ringy_flutter/ringy/presentation/core/widgets/error_retry_widget.dart';
import 'package:ringy_flutter/ringy/resources/colors.dart';
import 'package:ringy_flutter/ringy/resources/constants.dart';

import '../../../../../../injections.dart';
import '../../../../../application/chat/send_chat/send_chat_bloc.dart';
import 'message_views_widgets/audio_message_view.dart';
import 'message_views_widgets/image_message_view.dart';
import 'message_views_widgets/normal_message_view.dart';
import 'message_views_widgets/video_message_view.dart';

class ChatScreen extends StatelessWidget {
  TmpDataTravel dataTravel;


  ChatScreen(this.dataTravel, {Key? key}) : super(key: key);
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final ChatListBloc chatListBloc = serviceLocator<ChatListBloc>();
    return BlocProvider<ChatListBloc>
      (
        create: (context) => chatListBloc..add(GetChatsEvent(senderId:Constants.MY_ID,receiverId: dataTravel.recieverId,limit: "100")),
        child: BlocBuilder<ChatListBloc, ChatListState>(
            builder: (context, ChatListState state) {
          if (state is ChatListLoadedState) {
            return _buildMainBody(context, dataTravel, state.chats,chatListBloc);
          } else if (state is ChatsLoadingState) {
            return  _buildLoadingBody(context, dataTravel);
          } else if (state is ChatListErrorState) {
            return ErrorRetryWidget(
                "Error while fetching Chat",
                () => {
                      chatListBloc..add(GetChatsEvent(senderId:Constants.MY_ID,receiverId: dataTravel.recieverId,limit: "100")),
                    });
          }
          return const Center(child
              : CircularProgressIndicator());
        }));
  }

  Widget _buildMainBody(
      BuildContext context, TmpDataTravel dataTravel, List<ChatModel> chats, ChatListBloc chatListBloc) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: RingyColors.lightWhite,
          flexibleSpace: _buildAppBarSafeArea(context, dataTravel),
        ),
        body: _buildBody(context, chats,chatListBloc));
  }

  Widget _buildLoadingBody(
      BuildContext context, TmpDataTravel userName) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: RingyColors.lightWhite,
          flexibleSpace: _buildAppBarSafeArea(context, dataTravel),
        ),
        body: const Center(child: CircularProgressIndicator(),));
  }

  Widget _buildAppBarSafeArea(BuildContext context, TmpDataTravel dataTravel) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                // Navigator.pop(context);
                context.popRoute();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            const CircleAvatar(
              backgroundImage:
                  NetworkImage("https://randomuser.me/api/portraits/men/5.jpg"),
              maxRadius: 20,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    dataTravel.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Online",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.settings,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, List<ChatModel> messages, ChatListBloc chatListBloc) {
    return Column(
      children: [
        Expanded(child: _buildListMessage(context, messages)),
        _buildInput(context, messages,chatListBloc),
      ],
    );
  }

  Widget _buildInput(BuildContext context, List<ChatModel> messages,ChatListBloc chatListBloc) {
    var msgEntered = "";
    final SendChatBloc sendChatObj = serviceLocator<SendChatBloc>();
    return BlocProvider<SendChatBloc>(
        create: (context) => sendChatObj,
        child: BlocBuilder<SendChatBloc, SendChatState>(
            builder: (context, SendChatState state) {
                return  Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                        height: 60,
                        width: double.infinity,
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintText: "Write message...",
                                  hintStyle: TextStyle(color: Colors.black54),
                                  border: InputBorder.none,
                                ),
                                onChanged: (text) {
                                  msgEntered = text;
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                sendSimpleChat(context,msgEntered,chatListBloc,messages);
                                scrollController.animateTo(scrollController.position.maxScrollExtent+1000, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);

                                },
                              child: const Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 18,
                              ),
                              backgroundColor: Colors.blue,
                              elevation: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
            }

        ));
  }

  Widget _buildListMessage(BuildContext context, List<ChatModel> messages) {
    return ListView.builder(
      itemCount: messages.length,
      shrinkWrap: true,
      controller: scrollController,

      padding: const EdgeInsets.only(top: 10, bottom: 10),
      itemBuilder: (context, index) {
        return Container(
          padding:
              const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
          child: Align(
            //https://ringy.jp:22000/GetRingo2oChat/6152f067d8eda876c8d49cbe/61aef7d8d5d2971bb4c8b890/100/5d4c07fb030f5d0600bf5c03/0
            alignment:
                (messages[index].senderId?.id != "6152f067d8eda876c8d49cbe"
                    ? Alignment.topLeft
                    : Alignment.topRight),

            child: Padding(
              padding:
                  messages[index].senderId?.id == "6152f067d8eda876c8d49cbe"
                      ? const EdgeInsets.only(left: 40)
                      : const EdgeInsets.only(right: 40),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: messages[index].senderId?.id !=
                            "6152f067d8eda876c8d49cbe"
                        ? const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))
                        : const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                    color: (messages[index].senderId?.id !=
                            "6152f067d8eda876c8d49cbe"
                        ? Colors.grey.shade200
                        : Colors.blue[200]),
                  ),
                  padding: const EdgeInsets.all(14),
                  child: messages[index].messageType == Constants.VIDEO_MSG
                      ? VideoMessageView(messagesList: messages, index: index)
                      : messages[index].messageType == Constants.IMAGE_MSG
                      ? ImageMessageView(
                      messagesList: messages, index: index)
                      : messages[index].messageType == Constants.AUDIO_MSG
                      ? AudioMessageView(
                    messagesList: messages,
                    index: index,
                  )
                      : NormalMessageView(
                    messagesList: messages,
                    index: index,
                  )),
            ),
          ),
        );
      },
    );
  }

  void sendSimpleChat(BuildContext context, String msgEntered, ChatListBloc chatListBloc, List<ChatModel> messages) {

    var senderMainUserId ="6152eec97fa31675f62b8089";
    var receiverMainUserId ="618c87dec66e4d9818bac595";
    String sId = "6152f067d8eda876c8d49cbe";
    String rId = "61aef7d8d5d2971bb4c8b890";
    String pId = "5d4c07fb030f5d0600bf5c03";
    SenderId receiverIdObj = SenderId();
    receiverIdObj.id =rId;

    SenderId senderIdObj = SenderId();
    senderIdObj.id = sId;

    ChatModel chatModel = ChatModel();
   // chatModel.sId = "";
    chatModel.receiverId = receiverIdObj;
    chatModel.senderId =senderIdObj;
    chatModel.message = EncryptData.encryptAES(msgEntered, senderIdObj.id);
    chatModel.chatType = 0;
    chatModel.messageType = 0;
    chatModel.isGroup = 0;
    chatModel.isSeen = 0;
    chatModel.receiptStatus = 1;
    chatModel.isDeleted = 0;
    chatModel.projectId = pId;


    chatModel.senderUserId = senderMainUserId;
    chatModel.receiverUserId = receiverMainUserId;
    messages.add(chatModel);
    chatListBloc.add(UpdateChatsEvent(messages));




    BlocProvider.of<SendChatBloc>(context).repository.sendMessage(chatModel);
   /* Timer.periodic(Duration(seconds: 5), (_) {
      // this code runs after every 5 second. Good to use for Stopwatches
      chatListBloc.repository.getChats();
    });*/

  }

}

// Decrypt data



