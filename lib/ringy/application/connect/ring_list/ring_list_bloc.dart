import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';
import 'package:ringy_flutter/ringy/domain/entities/connect/get_user_ring.dart';

import '../../../infrastructure/_repository.dart';

part 'ring_list_event.dart';
part 'ring_list_state.dart';

class RingListBloc extends Bloc<RingListEvent, RingListState> {
  final Repository repository;

  RingListBloc(this.repository) : super(RingListInitial()){
    on<GetRingsEvent>(_onEvent, transformer: sequential());
  }


  FutureOr<void> _onEvent(GetRingsEvent event, Emitter<RingListState> emit) async {
    emit(RingsLoadingState());
    print("pppppppppppppppp");
    var result = await repository.getRingList(event.projectId,event.userId);
    print(result);
    emit(result.fold((l) => RingsListErrorState(), (r) => RingsListLoadedState(list: r)));
  }
}
