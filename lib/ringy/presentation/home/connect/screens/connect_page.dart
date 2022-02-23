import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringy_flutter/ringy/application/connect/connect_pages_cubit.dart';
import 'package:ringy_flutter/ringy/application/connect/connect_pages_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ringy_flutter/ringy/presentation/home/connect/screens/pages/connect_screen.dart';
import 'package:ringy_flutter/ringy/presentation/home/connect/screens/pages/friends_screen.dart';
import 'package:ringy_flutter/ringy/presentation/home/connect/screens/pages/invite_screen.dart';
import 'package:ringy_flutter/ringy/presentation/home/connect/screens/pages/search_screen.dart';
import 'package:ringy_flutter/ringy/resources/constants.dart';
import '../../../../resources/colors.dart';

class ConnectPage extends StatelessWidget {
  ConnectPage({Key? key}) : super(key: key);

  var selectedColor = RingyColors.primaryColor;
  var unSelectedColor = RingyColors.unSelectedColor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConnectPagesCubit>(
      create: (context) => ConnectPagesCubit(),
      child: _buildScaffold(context),
    );
  }

  _buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: InkWell(
        splashColor: Colors.transparent,
        onTap: () => {},
        child: SvgPicture.asset(
          "assets/images/friend_request_icon.svg",
          fit: BoxFit.scaleDown,
        ),
      ),
      actions: [
        InkWell(
          splashColor: Colors.transparent,
          onTap: () => {},
          child: SvgPicture.asset(
            "assets/images/settings_icon.svg",
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(width: 20)
      ],
      centerTitle: true,
      title: Text('Connect',
          style:
              TextStyle(color: RingyColors.blue, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: Container(
            color: RingyColors.lightWhite,
            padding: const EdgeInsets.all(14),
            height: 75,
            child: Row(
              children: [
                _buildConnectView(
                    "assets/images/connect_friend_icon.svg", "Connect", 0),
                const VerticalDivider(thickness: 0.7),
                _buildConnectView(
                    "assets/images/friends_icon.svg", "Friends", 1),
                const VerticalDivider(thickness: 0.7),
                _buildConnectView("assets/images/invite_icon.svg", "Invite", 2),
                const VerticalDivider(thickness: 0.7),
                _buildConnectView("assets/images/search_icon.svg", "Search", 3),
              ],
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        ),
        BlocBuilder<ConnectPagesCubit, ConnectPagesInitial>(
          builder: (context, state) {
            return Expanded(
              child: state.pageValue == Constants.connectPage
                  ? const ConnectScreen()
                  : state.pageValue == Constants.friendsPage
                      ? const FriendsScreen()
                      : state.pageValue == Constants.invitePage
                          ? const InviteScreen()
                          : const SearchScreen(),
            );
          },
        )
      ],
    );
  }

  Widget _buildConnectView(String imgUrl, String title, int position) {
    return BlocBuilder<ConnectPagesCubit, ConnectPagesInitial>(
      builder: (context, state) {
        return Column(
          children: [
            InkWell(
              onTap: () => {
                BlocProvider.of<ConnectPagesCubit>(context).changePage(position)
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    imgUrl,
                    width: 24,
                    height: 24,
                    color: position == state.pageValue
                        ? selectedColor
                        : unSelectedColor,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: position == state.pageValue
                            ? selectedColor
                            : unSelectedColor),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
