// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$updateScreenRoute];

RouteBase get $updateScreenRoute => GoRouteData.$route(
  path: '/update',

  factory: _$UpdateScreenRoute._fromState,
);

mixin _$UpdateScreenRoute on GoRouteData {
  static UpdateScreenRoute _fromState(GoRouterState state) =>
      UpdateScreenRoute();

  @override
  String get location => GoRouteData.$location('/update');

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
