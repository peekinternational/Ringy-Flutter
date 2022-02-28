import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/user_model.dart';
import 'package:ringy_flutter/ringy/presentation/core/utils/data_travel_model.dart';
import 'package:ringy_flutter/ringy/presentation/core/utils/helper_class.dart';
import 'package:ringy_flutter/ringy/presentation/core/widgets/encryption_utils.dart';
import 'package:ringy_flutter/ringy/presentation/core/widgets/image_or_first_character.dart';
import 'package:ringy_flutter/ringy/presentation/core/widgets/image_or_first_character_users.dart';
import 'package:ringy_flutter/ringy/resources/colors.dart';

import '../../../../../routes/router.dart';

class UserItemTile extends StatelessWidget {
  final UsersModel model;

  UserItemTile({required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        nextPage(context, model),
      },
      child: ListTile(
        horizontalTitleGap: 10,
        title: Text(model.userName),
        subtitle: Text(
          model.latestMsg == ""
              ? "No Chat"
              : EncryptData.decryptAES(
                  model.latestMsg, model.latestMsgSenderId),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: RingyColors.primaryColor),
        ),
        leading: ImageOrFirstCharacterUsers(
          radius: 25,
          maxRadius: 26,
          imageUrl: model.pImage,
          name: model.userName,
          onlineStatus: model.onlineHideStatus == "0" ? model.onlineStatus : 2,
          showOnlineStatus: true,
        ),
        trailing: Text(model.latestMsg == ""
            ? ""
            : HelperClass.getFormatedDate(model.latestMsgCreatedAt)),
      ),
    );
  }

  nextPage(BuildContext context, UsersModel model) {
    TmpDataTravel tmpDataTravel = TmpDataTravel();
    tmpDataTravel.name = model.userName;
    tmpDataTravel.image = model.pImage;
    tmpDataTravel.recieverId = model.sId;
    tmpDataTravel.isOnlineHide = model.onlineHideStatus;
    tmpDataTravel.isOnline = model.onlineStatus;
    tmpDataTravel.mainUserId = model.userId;

    context.pushRoute(ChatScreenRoute(dataTravel: tmpDataTravel));
  }
}
