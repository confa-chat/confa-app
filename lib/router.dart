import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:confa/screens/connect_screen.dart';
import 'package:confa/screens/server_screen.dart';
import 'package:confa/screens/server_selection_screen.dart';
import 'package:confa/services/connection_manager.dart';
import 'package:confa/services/shared_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  // redirect: (context, state) async {
  //   if (state.matchedLocation == '/') {
  //     final savedRouter = SharedStorage.instance.getLastRoute();
  //     if (savedRouter != null && !savedRouter.contains(':hubID')) {
  //       return savedRouter;
  //     }

  //     return '/connect';
  //   }

  //   // TODO make it better
  //   if (state.fullPath == '/hub/:hubID/server/:serverID') {
  //     SharedStorage.instance.saveLastRoute(state.matchedLocation);
  //   }

  //   return null;
  // },
  errorBuilder: (context, state) {
    return Scaffold(body: Center(child: Text('Error: ${state.error}')));
  },
);

class SaveLastRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is ServerScreenRoute) {
      SharedStorage.instance.saveLastRoute(route.settings.name!);
    }
  }
}
