// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_selection_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$serverSelectionScreenRoute];

RouteBase get $serverSelectionScreenRoute => GoRouteData.$route(
  path: '/hub/:hubID/servers',

  factory: $ServerSelectionScreenRouteExtension._fromState,
);

extension $ServerSelectionScreenRouteExtension on ServerSelectionScreenRoute {
  static ServerSelectionScreenRoute _fromState(GoRouterState state) =>
      ServerSelectionScreenRoute(hubID: state.pathParameters['hubID']!);

  String get location =>
      GoRouteData.$location('/hub/${Uri.encodeComponent(hubID)}/servers');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
