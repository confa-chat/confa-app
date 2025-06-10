import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:konfa/screens/connect_screen.dart';
import 'package:konfa/screens/server_screen.dart';
import 'package:konfa/screens/server_selection_screen.dart';
import 'package:konfa/services/connection_manager.dart';
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

GoRouter get appRouter => GoRouter(
  initialLocation: '/',
  routes: $appRoutes,
  observers: [SaveLastRouteObserver()],
  redirect: (context, state) async {
    if (state.matchedLocation == '/') {
      final savedRouter = await getSavedRoute();
      if (savedRouter != null && !savedRouter.contains(':hubID')) {
        return savedRouter;
      }

      return '/connect';
    }

    // TODO make it better
    if (state.fullPath == '/hub/:hubID/server/:serverID') {
      await SharedPreferencesAsync().setString(lastRouteKey, state.matchedLocation);
    }

    return null;
  },
  errorBuilder: (context, state) {
    return Scaffold(body: Center(child: Text('Error: ${state.error}')));
  },
);

const lastRouteKey = 'last_route';

Future<String?> getSavedRoute() async {
  return await SharedPreferencesAsync().getString(lastRouteKey);
}

class SaveLastRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is ServerScreenRoute) {
      SharedPreferencesAsync().setString(lastRouteKey, route.settings.name!);
    }
  }
}
