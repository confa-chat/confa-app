import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'splash_screen.g.dart';

@TypedGoRoute<SplashScreenRoute>(path: '/splash')
@immutable
class SplashScreenRoute extends GoRouteData with _$SplashScreenRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
