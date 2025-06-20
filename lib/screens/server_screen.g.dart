// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$serverScreenRoute];

RouteBase get $serverScreenRoute => GoRouteData.$route(
  path: '/hub/:hubID/server/:serverID',

  factory: _$ServerScreenRoute._fromState,
);

mixin _$ServerScreenRoute on GoRouteData {
  static ServerScreenRoute _fromState(GoRouterState state) => ServerScreenRoute(
    hubID: state.pathParameters['hubID']!,
    serverID: state.pathParameters['serverID']!,
  );

  ServerScreenRoute get _self => this as ServerScreenRoute;

  @override
  String get location => GoRouteData.$location(
    '/hub/${Uri.encodeComponent(_self.hubID)}/server/${Uri.encodeComponent(_self.serverID)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
