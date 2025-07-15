// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_selection_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$serverSelectionScreenRoute];

RouteBase get $serverSelectionScreenRoute => GoRouteData.$route(
  path: '/hub/:hubUrl/servers',

  factory: _$ServerSelectionScreenRoute._fromState,
);

mixin _$ServerSelectionScreenRoute on GoRouteData {
  static ServerSelectionScreenRoute _fromState(GoRouterState state) =>
      ServerSelectionScreenRoute(
        hubUrl: Uri.parse(state.pathParameters['hubUrl']!)!,
      );

  ServerSelectionScreenRoute get _self => this as ServerSelectionScreenRoute;

  @override
  String get location => GoRouteData.$location(
    '/hub/${Uri.encodeComponent(_self.hubUrl.toString())}/servers',
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
