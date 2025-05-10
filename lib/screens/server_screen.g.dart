// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$serverScreenRoute];

RouteBase get $serverScreenRoute => GoRouteData.$route(
  path: '/hub/:hubID/server/:serverID',

  factory: $ServerScreenRouteExtension._fromState,
);

extension $ServerScreenRouteExtension on ServerScreenRoute {
  static ServerScreenRoute _fromState(GoRouterState state) => ServerScreenRoute(
    hubID: state.pathParameters['hubID']!,
    serverID: state.pathParameters['serverID']!,
  );

  String get location => GoRouteData.$location(
    '/hub/${Uri.encodeComponent(hubID)}/server/${Uri.encodeComponent(serverID)}',
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
