import 'package:flutter/material.dart';
import 'package:ringy_flutter/ringy/resources/colors.dart';

import '../../../../../../infrastructure/API/api_content.dart';

class ImageOrFirstCharacter extends StatelessWidget {
  int radius;
  String imageUrl;
  String name;

  ImageOrFirstCharacter(
      {Key? key,
      required this.radius,
      required this.imageUrl,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + 1,
      backgroundColor: RingyColors.primaryColor,
      child: CircleAvatar(
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
        radius: 25,
      ),
    );
  }

  static String getFirstTwoCharOfUserName(String s1) {
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
          //  Log.e("SPACECHECKist", "s1: " + s1 + " finalString" + finalStr);

        } else {
          finalStr = s1[0].toUpperCase();
          // Log.e("SPACECHECKscnd", "s1: " + s1 + " finalString" + finalStr);
        }
      }
    } catch (e) {
      finalStr = s1;
    }

    return finalStr;
  }
}
