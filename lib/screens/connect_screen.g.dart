// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$connectScreenRoute];

RouteBase get $connectScreenRoute => GoRouteData.$route(
  path: '/connect',
  factory: _$ConnectScreenRoute._fromState,
);

mixin _$ConnectScreenRoute on GoRouteData {
  static ConnectScreenRoute _fromState(GoRouterState state) =>
      ConnectScreenRoute();

  @override
  String get location => GoRouteData.$location('/connect');

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
