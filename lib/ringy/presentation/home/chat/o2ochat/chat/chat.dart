import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ringy_flutter/ringy/application/chat/chat_list_bloc/chat_list_bloc.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/chat_message.dart';
import 'package:ringy_flutter/ringy/presentation/core/utils/data_travel_model.dart';
import 'package:ringy_flutter/ringy/presentation/core/widgets/encryption_utils.dart';
import 'package:ringy_flutter/ringy/presentation/core/widgets/error_retry_widget.dart';
import 'package:ringy_flutter/ringy/resources/colors.dart';
import 'package:ringy_flutter/ringy/resources/constants.dart';
import 'package:ringy_flutter/ringy/resources/strings_en.dart';
import 'package:ringy_flutter/ringy/resources/styles.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../../injections.dart';
import '../../../../../application/chat/send_chat/send_chat_bloc.dart';
import 'message_views_widgets/app_bar_view.dart';
import 'message_views_widgets/chat_item_design.dart';

class ChatScreen extends StatelessWidget {
  final TmpDataTravel dataTravel;

  ChatScreen(this.dataTravel, {Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ChatListBloc chatListBloc = serviceLocator<ChatListBloc>();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: RingyColors.lightWhite,
          flexibleSpace: AppBarChat(dataTravel),
        ),
        body: BlocProvider<ChatListBloc>(
            create: (context) => chatListBloc
              ..add(GetChatsEvent(
                  senderId: Constants.MY_ID,
                  receiverId: dataTravel.recieverId,
                  limit: "100")),
            child: BlocBuilder<ChatListBloc, ChatListState>(
                builder: (context, ChatListState state) {
              if (state is ChatListLoadedState) {
                return _buildBody(context, state.chats, chatListBloc);
              } else if (state is ChatsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ChatListErrorState) {
                return ErrorRetryWidget(
                    StringsEn.errorWhileFetchingChat,
                    () => {
                          chatListBloc
                            ..add(GetChatsEvent(
                                senderId: Constants.MY_ID,
                                receiverId: dataTravel.recieverId,
                                limit: "100")),
                        });
              }
              return const Center(child: CircularProgressIndicator());
            })));
  }

  Widget _buildBody(BuildContext context, List<ChatModel> messages,
      ChatListBloc chatListBloc) {
    return Column(
      children: [
        Expanded(child: _buildListMessage(context, messages)),
        const Divider(height: 1),
        _buildInput(context, messages, chatListBloc),
      ],
    );
  }

  Widget _buildInput(BuildContext context, List<ChatModel> messages,
      ChatListBloc chatListBloc) {
    var msgEntered = "";
    final SendChatBloc sendChatObj = serviceLocator<SendChatBloc>();
    return BlocProvider<SendChatBloc>(
        create: (context) => sendChatObj,
        child: BlocBuilder<SendChatBloc, SendChatState>(
            builder: (context, SendChatState state) {
          return Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  // height: 70,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _showBottomMenu(context);
                        },
                        child: Transform.rotate(
                          angle: 45,
                          child: const Icon(
                            Icons.attach_file,
                            color: Colors.black38,
                            size: 25,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(80)),
                              color: RingyColors.lightWhite,
                              border: Border.all(color: Colors.black12)),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () => {},
                                  child: const Icon(
                                      Icons.emoji_emotions_outlined)),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextField(
                                  maxLines: 4,
                                  minLines: 1,
                                  keyboardType: TextInputType.multiline,
                                  controller: _editingController,
                                  decoration: const InputDecoration(
                                    hintText: StringsEn.enterMessage,
                                    hintStyle: TextStyle(color: Colors.black54),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (text) {
                                    msgEntered = text;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          if (msgEntered != "") {
                            sendSimpleChat(context, msgEntered, chatListBloc,
                                messages, dataTravel);
                            _editingController.clear();
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(1)),
                            color: RingyColors.lightWhite,
                            // border: Border.all(color: Colors.black12)
                          ),
                          child: const Icon(
                            Icons.send,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }));
  }

  Widget _buildListMessage(BuildContext context, List<ChatModel> messages) {
    return ListView.builder(
      itemCount: messages.length,
      reverse: true,
      shrinkWrap: true,
      controller: scrollController,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      itemBuilder: (context, index) {
        final revereIndex = messages.length - 1 - index;
        return ChatItemDesign(messages, revereIndex);
      },
    );
  }

  void sendSimpleChat(
      BuildContext context,
      String msgEntered,
      ChatListBloc chatListBloc,
      List<ChatModel> messages,
      TmpDataTravel tmpDataTravel) {
    var senderMainUserId = Constants.MY_MAIN_USER_ID;
    var receiverMainUserId = tmpDataTravel.mainUserId;
    String sId = Constants.MY_ID;
    String rId = tmpDataTravel.recieverId;
    String pId = Constants.projectId;
    SenderId receiverIdObj = SenderId();
    receiverIdObj.id = rId;

    SenderId senderIdObj = SenderId();
    senderIdObj.id = sId;

    ChatModel chatModel = ChatModel();
    chatModel.receiverId = receiverIdObj;
    chatModel.senderId = senderIdObj;
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
  }



  void _showBottomMenu(BuildContext context) {
    FocusScope.of(context).unfocus();
    final items = <Widget>[
      ListTile(
        dense: true,
        leading: const Icon(Icons.photo_camera),
        title: const Text('Camera'),
        onTap: () {
          _getFromCamera(context);
        },
      ),
      const Divider(height: 1,),
      ListTile(
        dense: true,
        leading: const Icon(Icons.photo_library),
        title: const Text('Gallery'),
        onTap: () {
          _getFromGallery(context);
        },
      ),
      const Divider(height: 1,),
      ListTile(
        dense: true,
        leading: const Icon(Icons.file_copy),
        title: const Text('Files'),
        onTap: () {
          _getFile(context);
        },
      ),
      const Divider(height: 1,),
      ListTile(
        dense: true,
        leading: const Icon(Icons.videocam_outlined),
        title: const Text('Videos'),
        onTap: () {
          _getVideo(context);
        },
      ),
      const Divider(height: 1,),
      ListTile(
        dense: true,
        leading: const Icon(Icons.location_on_outlined),
        title: const Text('Location'),
        onTap: () {},
      ),
    ];
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: false,
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: RingyStyles.decor5,
              margin: const EdgeInsets.all(10),
              child: Wrap(
                children: items,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15,5,15,15),
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () => {Navigator.pop(context)},
                child: const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.close,
                      color: Colors.black38,
                      size: 30,
                    )),
              ),
            )
          ],
        ));
  }

  _getFromCamera(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    VxToast.show(context, msg: photo!.path);
  }
  _getFromGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    List<XFile>? photo = await _picker.pickMultiImage();
    // final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    VxToast.show(context, msg: photo!.length.toString());
  }
  _getVideo(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    VxToast.show(context, msg: video!.name);
  }
  _getFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["xlsx", "xls", "doc", "docx", "ppt", "pptx", "pdf", "txt"],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
    } else {
      // User canceled the picker
    }
    VxToast.show(context, msg: result!.files.single.path!);
  }
}


