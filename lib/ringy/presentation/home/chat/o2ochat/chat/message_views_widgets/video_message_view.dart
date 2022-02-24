import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/chat_message.dart';

class VideoMessageView extends StatelessWidget {
  final List<ChatModel> messagesList;
  final int index;

  const VideoMessageView(
      {Key? key, required this.messagesList, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Padding(
        padding: messagesList[index].senderId?.id == "6152f067d8eda876c8d49cbe"
            ? const EdgeInsets.only(left: 5)
            : const EdgeInsets.only(right: 5),
        child: Stack(

          alignment: Alignment.center,
          children: [
            messagesList[index].message != null
                ? CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, progress) => Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                    width: 200,
                    fit: BoxFit.cover,
                    imageUrl: "https://randomuser.me/api/portraits/men/5.jpg"
                    // Constants.IMAGES_URL + messagesList[index].message.toString(),
                    )
                : Image.asset(
                    "assets/images/ic_placeholder.png",
                    fit: BoxFit.cover,
                  ),
            const Center(
              child: Icon(
                Icons.play_circle_filled_outlined,
                size: 50,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
