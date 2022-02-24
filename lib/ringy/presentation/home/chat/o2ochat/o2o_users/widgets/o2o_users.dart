
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ringy_flutter/ringy/application/users/user_list/user_list_bloc.dart';
import 'package:ringy_flutter/ringy/domain/entities/chat_message/user_model.dart';
import 'package:ringy_flutter/ringy/presentation/home/chat/o2ochat/o2o_users/widgets/user_item_tile.dart';
import 'package:ringy_flutter/ringy/resources/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../injections.dart';
import '../../../../../core/widgets/error_retry_widget.dart';

class O2OUsers extends StatelessWidget {
  const O2OUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserListBloc userListBloc = serviceLocator<UserListBloc>();
    var projectId ="5d4c07fb030f5d0600bf5c03";
    var myId ="6152f067d8eda876c8d49cbe";
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: RingyColors.lightWhite,
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: RingyColors.lightWhite,
          title: Text(
            'Chat',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: RingyColors.blue),
          ),
        ),

        body:BlocProvider<UserListBloc>(
          create: (context) =>
          userListBloc
            ..add(GetUsersEvent(projectId, myId)),
          child:
          BlocBuilder<UserListBloc, UserListState>(
            builder: (context, state) {
              if(state is LoadedState) {
                return _buildBody(context, state.users);
              }
              else{
                return ErrorRetryWidget(
                    "Error while fetching Chat",
                        () => {
                          userListBloc..add(GetUsersEvent(projectId, myId)),
                    });
              }
            },
          ),
        ));

    //  _buildBody(context));
  }
}

Widget _buildBody(BuildContext context, List<UsersModel> list) {
  return ListView.separated(
        shrinkWrap: true,
        itemCount: list.length,
        separatorBuilder: (BuildContext context, int index) =>
        const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return UserItemTile(model: list[index]);
        },
      );
}


