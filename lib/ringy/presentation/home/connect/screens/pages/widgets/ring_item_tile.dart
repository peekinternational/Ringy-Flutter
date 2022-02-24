import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringy_flutter/ringy/domain/entities/connect/get_user_ring.dart';
import 'package:ringy_flutter/ringy/infrastructure/API/api_content.dart';
import 'package:ringy_flutter/ringy/presentation/core/widgets/image_or_first_character.dart';
import 'package:ringy_flutter/ringy/resources/colors.dart';

class RingItemTile extends StatelessWidget {
  final GetUserRingModel model;

  RingItemTile({required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 10,
      title: Text(model.ringName),
      subtitle: Text(
        "@" + model.ringUserId,
        style: TextStyle(color: RingyColors.primaryColor),
      ),
      leading: ImageOrFirstCharacter(
          radius: 25, imageUrl: model.pImage, name: model.ringName,isLock: false,isPublic: false,),
      trailing: SvgPicture.asset(
        "assets/images/scan_qr_icon.svg",
      ),
    );
  }
}
