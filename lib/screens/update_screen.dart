import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'update_screen.g.dart';

@TypedGoRoute<UpdateScreenRoute>(path: '/update')
@immutable
class UpdateScreenRoute extends GoRouteData with _$UpdateScreenRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UpdateScreen();
  }
}

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
