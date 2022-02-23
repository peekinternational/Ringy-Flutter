import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ringy_flutter/ringy/application/chat/chat_list_bloc/chat_list_bloc.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/chat_message.dart';
import 'package:ringy_flutter/ringy/presentation/core/widgets/encryption_utils.dart';
import 'package:ringy_flutter/ringy/presentation/core/widgets/error_retry_widget.dart';
import 'package:ringy_flutter/ringy/resources/colors.dart';
import 'package:ringy_flutter/ringy/resources/constants.dart';

import '../../../../../../injections.dart';

class ChatScreen extends StatelessWidget {
  String userName;

  ChatScreen(this.userName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatListBloc chatListBloc = serviceLocator<ChatListBloc>();

    return BlocProvider<ChatListBloc>(
        create: (context) => chatListBloc..add(GetChatsEvent()),
        child: BlocBuilder<ChatListBloc, ChatListState>(
            builder: (context, ChatListState state) {
          if (state is ChatListLoadedState) {
            return _buildMainBody(context, userName, state.chats);
          } else if (state is ChatsLoadingState) {
            return  _buildLoadingBody(context, userName);
          } else if (state is ChatListErrorState) {
            return ErrorRetryWidget(
                "Error while fetching Chat",
                () => {
                      chatListBloc..add(GetChatsEvent()),
                    });
          }
          return const Center(child
              : CircularProgressIndicator());
        }));
  }

  Widget _buildMainBody(
      BuildContext context, String userName, List<ChatModel> chats) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: RingyColors.lightWhite,
          flexibleSpace: _buildAppBarSafeArea(context, userName),
        ),
        body: _buildBody(context, chats));
  }

  Widget _buildLoadingBody(
      BuildContext context, String userName) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: RingyColors.lightWhite,
          flexibleSpace: _buildAppBarSafeArea(context, userName),
        ),
        body: const Center(child: CircularProgressIndicator(),));
  }

  Widget _buildAppBarSafeArea(BuildContext context, String userName) {
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
                    userName,
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

  Widget _buildBody(BuildContext context, List<ChatModel> messages) {
    return Column(
      children: [
        Expanded(child: _buildListMessage(context, messages)),
        _buildInput(context, messages),
      ],
    );
  }

  Widget _buildInput(BuildContext context, List<ChatModel> messages) {
    var msgEntered = "";
    return Stack(
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
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Coming Soon!"),
                    ));
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

  Widget _buildListMessage(BuildContext context, List<ChatModel> messages) {
    return ListView.builder(
      itemCount: messages.length,
      shrinkWrap: true,
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
                  child:
                      // messages[index].messageType == Constants.VIDEO_MSG
                      //     ? _buildVideoMessage(messages, index)
                      //     :
                      messages[index].messageType == Constants.IMAGE_MSG
                          ? _buildImageMessage(messages, index, context)
                          : _buildNormalMessage(messages, index)),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNormalMessage(List<ChatModel> messages, int index) {
    return Text(
      EncryptData.decryptAES(
          messages[index].message.toString(), messages[index].senderId?.id),
      style: const TextStyle(fontSize: 15),
    );
  }

  Widget _buildImageMessage(
      List<ChatModel> messages, int index, BuildContext context) {
    return messages[index].message != null
        ? CachedNetworkImage(
            progressIndicatorBuilder: (context, url, progress) => Center(
              child: CircularProgressIndicator(
                value: progress.progress,
              ),
            ),
            width: 200,
            fit: BoxFit.cover,
            // height: !kIsWeb ? 130 : context.screenSize.height / 2 + 100,
            imageUrl: "https://randomuser.me/api/portraits/men/5.jpg",
          )
        : Image.asset(
            "assets/images/ic_placeholder.png",
            fit: BoxFit.cover,
          );
  }

  Widget _buildVideoMessage(List<ChatModel> messages, int index) {
    return messages[index].message != null
        ? CachedNetworkImage(
            progressIndicatorBuilder: (context, url, progress) => Center(
              child: CircularProgressIndicator(
                value: progress.progress,
              ),
            ),
            // width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            // height: !kIsWeb ? 130 : context.screenSize.height / 2 + 100,
            imageUrl: Constants.IMAGES_URL + messages[index].message.toString(),
          )
        : Image.asset(
            "assets/images/ic_placeholder.png",
            fit: BoxFit.cover,
          );
  }
}

// Decrypt data



