import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'connect_pages_state.dart';

class ConnectPagesCubit extends Cubit<ConnectPagesInitial> {
  ConnectPagesCubit() : super(ConnectPagesInitial(pageValue: 0));

  void changePage(int value) => emit(ConnectPagesInitial(pageValue: value));
}
