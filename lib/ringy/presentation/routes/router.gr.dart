// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    ChatScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ChatScreenRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ChatScreen(args.dataTravel, key: args.key));
    }
  };

  @override
  List<RouteConfig> get routes => [
    RouteConfig(HomeRoute.name, path: '/'),
    RouteConfig(ChatScreenRoute.name, path: '/chat-screen')
  ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [ChatScreen]
class ChatScreenRoute extends PageRouteInfo<ChatScreenRouteArgs> {
  ChatScreenRoute({required TmpDataTravel dataTravel, Key? key})
      : super(ChatScreenRoute.name,
      path: '/chat-screen',
      args: ChatScreenRouteArgs(dataTravel: dataTravel, key: key));

  static const String name = 'ChatScreenRoute';
}

class ChatScreenRouteArgs {
  const ChatScreenRouteArgs({required this.dataTravel, this.key});

  final TmpDataTravel dataTravel;

  final Key? key;

  @override
  String toString() {
    return 'ChatScreenRouteArgs{userName: $dataTravel, key: $key}';
  }
}
