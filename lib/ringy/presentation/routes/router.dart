import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:ringy_flutter/ringy/presentation/core/utils/data_travel_model.dart';
import 'package:ringy_flutter/ringy/presentation/home/chat/o2ochat/chat/chat.dart';
import 'package:ringy_flutter/ringy/presentation/home/home_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: ChatScreen),
  ],
)
class AppRouter extends _$AppRouter{
}