// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$connectScreenRoute];

RouteBase get $connectScreenRoute => GoRouteData.$route(
  path: '/connect',

  factory: $ConnectScreenRouteExtension._fromState,
);

extension $ConnectScreenRouteExtension on ConnectScreenRoute {
  static ConnectScreenRoute _fromState(GoRouterState state) =>
      ConnectScreenRoute();

  String get location => GoRouteData.$location('/connect');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
