import 'package:flutter/material.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/chat_message.dart';
import 'package:ringy_flutter/ringy/resources/colors.dart';

class FileMessageView extends StatelessWidget {
  final List<ChatModel> messagesList;
  final int index;

  const FileMessageView({Key? key, required this.messagesList, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Row(
        children: [
          InkWell(
              onTap: () => {},
              child:  Icon(
                Icons.folder,
                size: 30,
                color: RingyColors.lightWhite,
              )),
          const SizedBox(width: 10,),
          Expanded(
            child: Text(
              messagesList[index].message.toString(),
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white,
                overflow: TextOverflow.ellipsis
              ),
            ),
          ),
        ],
      ),
    );
  }
}
