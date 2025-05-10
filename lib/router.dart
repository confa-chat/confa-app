import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:konfa/screens/connect_screen.dart';
import 'package:konfa/screens/loading_screen.dart';
import 'package:konfa/screens/server_screen.dart';
import 'package:konfa/screens/server_selection_screen.dart';

/// Combines all route definitions from across the app
List<RouteBase> get $appRoutes => [
  $connectScreenRoute,
  $serverSelectionScreenRoute,
  $serverScreenRoute,
  // $loadingScreenRoute,
];

/// The main router for the app
final GoRouter appRouter = GoRouter(
  initialLocation: '/connect',
  routes: $appRoutes,
  errorBuilder: (context, state) {
    return Scaffold(body: Center(child: Text('Error: ${state.error}')));
  },
);
