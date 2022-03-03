import 'package:flutter/material.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/chat_message.dart';
import 'package:ringy_flutter/ringy/presentation/home/chat/o2ochat/chat/message_views_widgets/file_message_view.dart';
import 'package:ringy_flutter/ringy/presentation/home/chat/o2ochat/chat/message_views_widgets/video_message_view.dart';
import 'package:ringy_flutter/ringy/resources/colors.dart';
import 'package:ringy_flutter/ringy/resources/constants.dart';

import 'audio_message_view.dart';
import 'image_message_view.dart';
import 'normal_message_view.dart';

class ChatItemDesign extends StatelessWidget {
  final List<ChatModel> messages;
  final int index;

  const ChatItemDesign(this.messages, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildChatList(messages, index);
  }
}

Widget _buildChatList(List<ChatModel> messages, int index) {
  var isMyMessage = messages[index].senderId?.id == Constants.MY_ID;
  var isImageOrVideo = messages[index].messageType == Constants.IMAGE_MSG || messages[index].messageType == Constants.VIDEO_MSG;
  var isAudioOrFile = messages[index].messageType == Constants.AUDIO_MSG || messages[index].messageType == Constants.FILE_MSG;
  return Container(
    padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
    child: Align(
      alignment: (!isMyMessage
          ? Alignment.topLeft
          : Alignment.topRight),
      child: Padding(
        padding: isMyMessage
            ? const EdgeInsets.only(left: 40)
            : const EdgeInsets.only(right: 40),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: !isMyMessage
                  ? const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))
                  : const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20)),
              color: (!isMyMessage
                  ? Colors.grey.shade200
                  : RingyColors.primaryColor),
            ),
            padding:  EdgeInsets.all(isImageOrVideo? 8: isAudioOrFile ? 8 :12),
            child: messages[index].messageType == Constants.VIDEO_MSG
                ? VideoMessageView(messagesList: messages, index: index)
                : messages[index].messageType == Constants.IMAGE_MSG
                    ? ImageMessageView(messagesList: messages, index: index)
                    : messages[index].messageType == Constants.AUDIO_MSG
                        ? AudioMessageView(
                            messagesList: messages,
                            index: index,
                          )
                        : messages[index].messageType == Constants.FILE_MSG
                            ? FileMessageView(
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
}
