import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/chat_message.dart';

class AudioMessageView extends StatelessWidget {
  final List<ChatModel> messagesList;
  final int index;

  const AudioMessageView(
      {Key? key, required this.messagesList, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
