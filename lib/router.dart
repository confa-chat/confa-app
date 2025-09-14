import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:confa/screens/connect_screen.dart';
import 'package:confa/screens/server_screen.dart';
import 'package:confa/screens/server_selection_screen.dart';

/// Combines all route definitions from across the app
List<RouteBase> get $appRoutes => [
  $connectScreenRoute,
  $serverSelectionScreenRoute,
  $serverScreenRoute,
];

/// The main router for the app
// final GoRouter _appRouter = GoRouter(
//   initialLocation: '/connect',
//   routes: $appRoutes,
//   errorBuilder: (context, state) {
//     return Scaffold(body: Center(child: Text('Error: ${state.error}')));
//   },
// );

GoRouter appRouter(String initialRoute) => GoRouter(
  initialLocation: initialRoute,
  routes: $appRoutes,
  observers: [SaveLastRouteObserver()],
  errorBuilder: (context, state) {
    return Scaffold(body: Center(child: Text('Error: ${state.error}')));
  },
);

class SaveLastRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // if (route.settings is ServerScreenRoute) {
    //   final ServerScreenRoute serverScreenRoute = route.settings as ServerScreenRoute;
    //   SharedStorage.instance.saveLastRoute(
    //     SavedRoute(hubID: serverScreenRoute.hubUrl, serverID: serverScreenRoute.serverID),
    //   );
    // }
  }
}
