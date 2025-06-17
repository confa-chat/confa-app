import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confa/bloc/voice_bloc.dart';
import 'package:confa/router.dart';
import 'package:confa/services/connection_manager.dart';
import 'package:confa/services/shared_storage.dart';
import 'package:confa/theme.dart';
import 'package:l/l.dart';
import 'package:provider/provider.dart';

void main([List<String>? args]) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedStorage.init();

  final hubsManager = HubsManager();

  var initialRoute = '/connect'; // Default route

  final lastRoute = SharedStorage.instance.getLastRoute();
  if (lastRoute != null && !lastRoute.contains(':hubID')) {
    initialRoute = lastRoute;
  }

  runWithLogger(ConfaApp(hubsManager: hubsManager, initialRoute: initialRoute));
}

void runWithLogger(Widget app) {
  final logFile = File('log.txt').openWrite();
  l.capture<void>(
    () => runZonedGuarded<void>(() => runApp(app), l.e),
    LogOptions(
      handlePrint: true,
      outputInRelease: true,
      printColors: true,
      output: LogOutput.platform,
      overrideOutput: (event) {
        final msg = event.toString();
        logFile.writeln(msg);
        return msg;
      },
    ),
  );
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
