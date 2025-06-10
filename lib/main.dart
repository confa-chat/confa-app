import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konfa/bloc/voice_bloc.dart';
import 'package:konfa/router.dart';
import 'package:konfa/services/connection_manager.dart';
import 'package:konfa/theme.dart';
import 'package:konfa/widgets/loading.dart';
import 'package:l/l.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main([List<String>? args]) {
  runWithLogger(const ConfaApp());
}

void runWithLogger(Widget app) {
  final logFile = File('log.txt').openWrite();
  l.capture<void>(
    () => runZonedGuarded<void>(() => runApp(const ConfaApp()), l.e),
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
  const ConfaApp({super.key});

  @override
  State<ConfaApp> createState() => _ConfaAppState();
}

class _ConfaAppState extends State<ConfaApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HubsManager>(create: (_) => HubsManager()),
        BlocProvider<VoiceBloc>(create: (context) => VoiceBloc()),
      ],
      child: KonfaColorBuilder(
        builder: (lightTheme, darkTheme) {
          return MaterialApp.router(
            title: 'Konfa',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.system,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
