part of 'ring_list_bloc.dart';

@immutable
abstract class RingListState {}
class RingListInitial extends RingListState {}

class RingsListLoadedState extends RingListState{
  final List<GetUserRingModel> list;

  RingsListLoadedState({required this.list});

}

class RingsListErrorState extends RingListState{

}
class RingsLoadingState extends RingListState{}
