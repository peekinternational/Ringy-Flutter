import 'package:flutter/material.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/chat_message.dart';
import 'package:ringy_flutter/ringy/presentation/core/widgets/encryption_utils.dart';
import 'package:ringy_flutter/ringy/resources/constants.dart';

class NormalMessageView extends StatelessWidget {
  final List<ChatModel> messagesList;
  final int index;

  const NormalMessageView(
      {Key? key, required this.messagesList, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isMyMessage = messagesList[index].senderId?.id == Constants.MY_ID;
    return Text(
      EncryptData.decryptAES(messagesList[index].message.toString(),
          messagesList[index].senderId?.id),
      style: TextStyle(
        fontSize: 15,
        color: isMyMessage ? Colors.white : Colors.black,
      ),
    );
  }
}
