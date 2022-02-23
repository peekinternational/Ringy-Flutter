part of 'ring_list_bloc.dart';

@immutable
abstract class RingListEvent {

}

class GetRingsEvent extends RingListEvent{
  String projectId;
  String userId;

  GetRingsEvent({ required this.projectId, required this.userId});
}
