import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ringy_flutter/ringy/presentation/routes/router.dart';
import 'package:ringy_flutter/ringy/resources/colors.dart';

class O2OUsers extends StatelessWidget {
  const O2OUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: RingyColors.lightWhite,
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: RingyColors.lightWhite,
          title: const  Text(
            'Chat',
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
          ),
        ),
        body: _buildBody(context));
  }
}

Widget _buildBody(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    children: [
      _buildListItems(context,"Nasir Subhan", "hello dude"),
      const Divider(),
      _buildListItems(context,"Esar Khan", "ok bro"),
      const Divider(),
      _buildListItems(context,"Sajeel Server", "See you later"),
      const Divider(),
    ],
  );
}

Widget _buildListItems(BuildContext context,String name, String lastMessage) {
  return InkWell(
    onTap: () =>{
    context.pushRoute(ChatScreenRoute(userName: name))
    },
    child: ListTile(
      leading:  CircleAvatar(child: Center(child: Text(name[0]))),
      title: Text(name),
      subtitle: Text(lastMessage),
    ),
  );
}
