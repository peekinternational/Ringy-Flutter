import 'package:flutter/material.dart';
import 'package:ringy_flutter/ringy/resources/colors.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Text(
                "Profiles",
                style: TextStyle(color: RingyColors.unSelectedColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Chip(
                  backgroundColor: RingyColors.primaryColor,
                  avatar: const Icon(Icons.add,color: Colors.white),
                  label: const Text(
                    "Create",
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                    fontSize: 14),
                  ))
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ],
    );
  }
}
