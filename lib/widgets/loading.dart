import 'package:flutter/material.dart';

class LoadingBuilder<T extends Object> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(BuildContext context, T data) builder;

  const LoadingBuilder({super.key, required this.future, required this.builder});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future, // Call the provided future function
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final data = snapshot.data;
        if (data != null) {
          return builder(context, data);
        }

        return const Center(child: Text('No data available'));
      },
    );
  }
}
