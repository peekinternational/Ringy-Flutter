import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/chat_message.dart';

class ImageMessageView extends StatelessWidget {
  final List<ChatModel> messagesList;
  final int index;

  const ImageMessageView(
      {Key? key, required this.messagesList, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return messagesList[index].message != null
        ? InkWell(
            onTap: () => {},
            child: CachedNetworkImage(
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              ),
              width: 200,
              fit: BoxFit.cover,
              imageUrl: "https://randomuser.me/api/portraits/men/5.jpg",
            ),
          )
        : Image.asset(
            "assets/images/ic_placeholder.png",
            fit: BoxFit.cover,
          );
  }
}
