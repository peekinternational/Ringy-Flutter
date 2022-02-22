import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringy_flutter/ringy/presentation/core/widgets/error_retry_widget.dart';
import 'package:ringy_flutter/ringy/presentation/home/chat/o2ochat/o2o_users/widgets/o2o_users.dart';
import 'package:ringy_flutter/ringy/resources/colors.dart';
import 'dart:developer';

import 'connect/screens/connect_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const O2OUsers();
      case 1:
        return const Center(
          child: Text('Group Users'),
        );
      case 2:
        return const Center(
          child: Text('Calls'),
        );
      case 3:
        return const Center(
          child: Text('Rings'),
        );
      case 4:
        return  ConnectPage();
      default:
        return ErrorRetryWidget("error!", () => {
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      // body: screens[_currentIndex],
      body: _getDrawerItemWidget(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/bottomIcons/chat_icon.svg",
                color: RingyColors.blue,
              ),
              icon: SvgPicture.asset(
                "assets/bottomIcons/chat_icon.svg",
              ),
              label: 'Chat'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.group), label: 'Groups'),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/bottomIcons/calls_icon.svg",
                color: RingyColors.blue,
              ),
              icon: SvgPicture.asset(
                "assets/bottomIcons/calls_icon.svg",
              ),
              label: 'Calls'),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/bottomIcons/rings_icon.svg",
                color: RingyColors.blue,
              ),
              icon: SvgPicture.asset(
                "assets/bottomIcons/rings_icon.svg",
              ),
              label: 'Rings'),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/bottomIcons/connect_icon.svg",
                color: RingyColors.blue,
              ),
              icon: SvgPicture.asset(
                "assets/bottomIcons/connect_icon.svg",
              ),
              label: 'Connect'),
          // BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/bottomIcons/ic_briefcase.png")), label: 'JOBS'),
        ],
        selectedItemColor: RingyColors.blue,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
