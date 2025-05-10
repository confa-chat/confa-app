import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konfa/bloc/voice_bloc.dart';
import 'package:konfa/router.dart';
import 'package:konfa/services/connection_manager.dart';
import 'package:konfa/theme.dart';
import 'package:l/l.dart';
import 'package:provider/provider.dart';

void main([List<String>? args]) {
  final logFile = File('log.txt').openWrite();
  l.capture<void>(
    () => runZonedGuarded<void>(() => runApp(const MyApp()), l.e),
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _KonfaAppState();
}

class _KonfaAppState extends State<MyApp> {
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
