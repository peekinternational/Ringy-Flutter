
import 'package:get_it/get_it.dart';
import 'package:ringy_flutter/ringy/application/chat/chat_list_bloc/chat_list_bloc.dart';
import 'package:ringy_flutter/ringy/application/chat/send_chat/send_chat_bloc.dart';
import 'package:ringy_flutter/ringy/application/connect/ring_list/ring_list_bloc.dart';
import 'package:ringy_flutter/ringy/application/users/user_list/user_list_bloc.dart';
import 'package:ringy_flutter/ringy/infrastructure/_repository.dart';
import 'package:ringy_flutter/ringy/infrastructure/data_sources/api_data_source.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  chatDependencies();
}

Future<void> chatDependencies() async {

  serviceLocator.registerFactory(
    () => ChatListBloc(
       serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => RingListBloc(
       serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
        () => SendChatBloc(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
        () => UserListBloc(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => Repository(
      apiDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => ApiDataSource(),
  );
}

