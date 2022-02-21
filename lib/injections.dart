
import 'package:get_it/get_it.dart';
import 'package:ringy_flutter/ringy/application/chat/chat_list_bloc/chat_list_bloc.dart';
import 'package:ringy_flutter/ringy/infrastructure/chat_repository.dart';
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
  serviceLocator.registerLazySingleton(
    () => ChatRepository(
      apiDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => ApiDataSource(),
  );
}
