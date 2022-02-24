import 'package:flutter/material.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/chat_message.dart';
import 'package:ringy_flutter/ringy/presentation/core/widgets/encryption_utils.dart';

class NormalMessageView extends StatelessWidget {
  List<ChatModel> messagesList;
  int index;

  NormalMessageView({Key? key, required this.messagesList, required this.index}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Text(
        EncryptData.decryptAES(
            messagesList[index].message.toString(), messagesList[index].senderId?.id),
        style: const TextStyle(fontSize: 15),
      );
  }
}


