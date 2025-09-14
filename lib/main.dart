import 'dart:async';
import 'package:confa/screens/server_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confa/bloc/connection_cubit.dart';
import 'package:confa/bloc/voice_bloc.dart';
import 'package:confa/router.dart';
import 'package:confa/services/connection_manager.dart';
import 'package:confa/services/shared_storage.dart';
import 'package:confa/theme.dart';
import 'package:l/l.dart';
import 'package:provider/provider.dart';
import 'package:confa/src/rust/frb_generated.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main([List<String>? args]) {
  // final logFile = File('log.txt').openWrite();
  l.capture<void>(
    () => runZonedGuarded<void>(run, l.e),
    LogOptions(
      handlePrint: true,
      outputInRelease: true,
      printColors: true,
      output: LogOutput.platform,
      // overrideOutput: (event) {
      //   final msg = event.toString();
      //   logFile.writeln(msg);
      //   return msg;
      // },
    ),
  );
}

void run() async {
  await RustLib.init();

  WidgetsFlutterBinding.ensureInitialized();

  await SharedStorage.init();

  final hubsManager = HubsManager();

  var initialRoute = '/connect'; // Default route

  final lastRoute = SharedStorage.instance.getLastRoute();
  if (lastRoute != null && lastRoute.serverID != null) {
    initialRoute = ServerScreenRoute(
      hubUrl: lastRoute.hubID,
      serverID: lastRoute.serverID!,
    ).location;
  }

  runApp(ConfaApp(hubsManager: hubsManager, initialRoute: initialRoute));
}

class ConfaApp extends StatefulWidget {
  final String initialRoute;
  final HubsManager hubsManager;

  const ConfaApp({super.key, required this.hubsManager, required this.initialRoute});

  @override
  State<ConfaApp> createState() => _ConfaAppState();
}

class _ConfaAppState extends State<ConfaApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HubsManager>.value(value: widget.hubsManager),
        BlocProvider<VoiceBloc>(create: (context) => VoiceBloc()),
        BlocProvider<ConnectionCubit>(create: (context) => ConnectionCubit(widget.hubsManager)),
      ],
      child: ConfaColorBuilder(
        builder: (lightTheme, darkTheme) {
          return MaterialApp.router(
            title: 'Confa',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.system,
            routerConfig: appRouter(widget.initialRoute),
          );
        },
      ),
    );
  }
}
