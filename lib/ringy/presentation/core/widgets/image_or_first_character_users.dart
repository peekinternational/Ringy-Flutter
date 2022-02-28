import 'package:flutter/material.dart';
import 'package:ringy_flutter/ringy/resources/colors.dart';

import '../../../infrastructure/API/api_content.dart';

class ImageOrFirstCharacterUsers extends StatelessWidget {
  int radius;
  int maxRadius;
  String imageUrl;
  String name;
  int onlineStatus;
  bool showOnlineStatus;

  ImageOrFirstCharacterUsers({
    Key? key,
    this.radius = 22,
    this.maxRadius = 24,
    required this.imageUrl,
    required this.name,
    required this.onlineStatus,
    this.showOnlineStatus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var onlineStatusIconColor = onlineStatus == 0 ? Colors.red : onlineStatus ==
        1 ? Colors.green :Colors.transparent;
    if(!showOnlineStatus){
      onlineStatusIconColor = Colors.transparent;
    }
    return CircleAvatar(
      radius: maxRadius + 0,
      backgroundColor: RingyColors.primaryColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            backgroundColor: RingyColors.lightWhite,
            child: imageUrl == ""
                ? name == ""
                ? const Text("")
                : Center(
              child: Text(
                getFirstTwoCharOfUserName(name),
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
                : ClipOval(
              child: Image.network(
                APIContent.ImageUrl + imageUrl,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
            radius: radius + 0,
          ),
           Padding(
            padding: const EdgeInsets.all(2),
            child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                    backgroundColor: onlineStatusIconColor,
                    radius: 6,
                    // Icon(Icons.error, size: 12, color: onlineStatusIconColor)),
          )))
        ],
      ),
    );
  }

  String getFirstTwoCharOfUserName(String s1) {
    String finalStr = "";
    String lastStr = "";
    String firstStr = "";
    List myName;
    try {
      if (s1 != null) {
        myName = s1.trim().split(" ");
        if (myName.length > 1) {
          String s = myName[myName.length - 1].trim();
          lastStr = s[0];

          String f2 = myName[0].trim();
          firstStr = f2[0];

          finalStr = firstStr.toUpperCase() + lastStr.toUpperCase();
        } else {
          finalStr = s1[0].toUpperCase();
        }
      }
    } catch (e) {
      finalStr = s1;
    }

    return finalStr;
  }
}
