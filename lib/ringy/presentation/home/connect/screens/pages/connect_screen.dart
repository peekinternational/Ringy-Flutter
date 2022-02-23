import 'package:flutter/material.dart';
import 'package:ringy_flutter/ringy/application/connect/ring_list/ring_list_bloc.dart';
import 'package:ringy_flutter/ringy/domain/entities/connect/get_user_ring.dart';
import 'package:ringy_flutter/ringy/infrastructure/API/api_content.dart';
import 'package:ringy_flutter/ringy/presentation/home/connect/screens/pages/widgets/ring_item_tile.dart';
import 'package:ringy_flutter/ringy/resources/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../injections.dart';
import '../../../../core/widgets/error_retry_widget.dart';

class ConnectScreen extends StatelessWidget {

  const ConnectScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var projectId ="5d4c07fb030f5d0600bf5c03";
    var userId ="6152eec97fa31675f62b8089";
    final RingListBloc chatListBloc = serviceLocator<RingListBloc>();

    return BlocProvider<RingListBloc>(
        create: (context) => chatListBloc..add(GetRingsEvent(projectId: projectId, userId: userId)),
        child: BlocBuilder<RingListBloc, RingListState>(
            builder: (context, RingListState state) {
              if (state is RingsListLoadedState) {
                return  _buildfullScreen(context, state.list);
              } else if (state is RingsLoadingState) {
                return  _buildLoadingBody(context);
              } else if (state is RingsListErrorState) {
                return ErrorRetryWidget(
                    "Error while fetching Chat",
                        () => {
                      chatListBloc..add(GetRingsEvent(projectId: "",userId: "")),
                    });
              }
              return const Center(child
                  : CircularProgressIndicator());
            }));


  }

  Widget _buildfullScreen(BuildContext context, List<GetUserRingModel> list) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Text(
                "Ring",
                style: TextStyle(
                    color: RingyColors.unSelectedColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Chip(
                  backgroundColor: RingyColors.primaryColor,
                  avatar: const Icon(Icons.add, color: Colors.white),
                  label: const Text(
                    "Create Ring",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ))
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: list.length,
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(

              ),
              itemBuilder: (BuildContext context, int index) {
                return RingItemTile(model:list[index]);
              },
            ))
      ],
    );
  }

  Widget _buildLoadingBody(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
